function inc_flow_count()
    if G.GAME.consumeable_usage_total.flow ~= nil then
        G.GAME.consumeable_usage_total.flow = G.GAME.consumeable_usage_total.flow + 1
    else
        G.GAME.consumeable_usage_total.flow = 1
    end
end

function Card:remove_edition()
    self.edition.chips = 0
    self.edition.holo = false
    self.edition.foil = false
    self.edition.polychrome = false
    self.edition.negative = false
    self.edition.type = ''
end

function add_flow_tag(_tag)
    G.GAME.current_round.rh_flow_used = true
    G.HUD_tags = G.HUD_tags or {}
    local flow_sprite_ui = _tag:generate_UI()
    G.HUD_tags[#G.HUD_tags+1] = UIBox{
        definition = {n=G.UIT.ROOT, config={align = "cm",padding = 0.05, colour = G.C.CLEAR}, nodes={
            flow_sprite_ui
        }},
        config = {
          align = G.HUD_tags[1] and 'tm' or 'bri',
          offset = G.HUD_tags[1] and {x=0,y=0} or {x=0.7,y=0},
          major = G.HUD_tags[1] and G.HUD_tags[#G.HUD_tags] or G.ROOM_ATTACH}
    }
    
    G.GAME.tags[#G.GAME.tags+1] = _tag
    _tag.HUD_tag = G.HUD_tags[#G.HUD_tags]
end

function poll_poker_hand(ignore, seed, allowhidden)
	--From Cryptid, which apparently got it from JenLib's get_random_hand
	local chosen_hand
	ignore = ignore or {}
	seed = seed or "randomhand"
	if type(ignore) ~= "table" then
		ignore = { ignore }
	end
	while true do
		chosen_hand = pseudorandom_element(G.handlist, pseudoseed(seed))
		if G.GAME.hands[chosen_hand].visible or allowhidden then
			local safe = true
			for _, v in pairs(ignore) do
				if v == chosen_hand then
					safe = false
				end
			end
			if safe then
				break
			end
		end
	end
	return chosen_hand
end

function rh_seek_copiable(highlighted, card, hand)
    local pos = -1
    local copiable = nil
    for k, v in pairs(hand) do
        if v == card then
            pos = k
        end
    end
    for j=pos, 1, -1 do
        if hand[j].ability.name ~= 'm_rh_call_response' then
            if (hand[j].highlighted or false) == highlighted then
                copiable = hand[j]
                break
            end
        end
    end
    return copiable
end

function rh_localize_sfx(key)
    local sound = key..'_en'
    if BHevven.config.rh_language == 2 and SMODS.Sounds[key..'_jp'] then
        sound = key..'_jp'
    elseif BHevven.config.rh_language == 3 and SMODS.Sounds[key..'_fr'] then
        sound = key..'_fr'
    elseif BHevven.config.rh_language == 4 and SMODS.Sounds[key..'_sp'] then
        sound = key..'_sp'
    end
    return sound
end

function rh_copy_card(other, new_card, card_scale, playing_card, strip_edition)
    local old_ability = copy_table(new_card.ability)
    local other_abilities = copy_table(new_card.old_abilities)
    local old_name = new_card.ability.name
    local new_card = new_card or Card(other.T.x, other.T.y, G.CARD_W*(card_scale or 1), G.CARD_H*(card_scale or 1), G.P_CARDS.empty, G.P_CENTERS.c_base, {playing_card = playing_card})
    new_card:set_ability(other.config.center)
    new_card.ability.type = other.ability.type
    new_card:set_base(other.config.card)
    for k, v in pairs(other.ability) do
        if type(v) == 'table' then 
            new_card.ability[k] = copy_table(v)
        else
            new_card.ability[k] = v
        end
    end

    if other_abilities then
        for k, v in pairs(other_abilities) do
            if other.ability.name == k then
                new_card.ability = copy_table(v)
            end
        end
    end

    if not strip_edition then 
        new_card:set_edition(other.edition or {}, nil, true)
    end
    check_for_unlock({type = 'have_edition'})
    new_card:set_seal(other.seal, true)
    if other.params then
        new_card.params = other.params
        new_card.params.playing_card = playing_card
    end
    new_card.debuff = other.debuff
    new_card.pinned = other.pinned
    new_card.old_abilities = copy_table(other_abilities)
    if not new_card.old_abilities then
        new_card.old_abilities = {}
    end
    new_card.old_abilities[old_name] = copy_table(old_ability)
    return new_card
end

function rh_create_card_silent(t)
    if not t.area and t.key and G.P_CENTERS[t.key] then
        t.area = G.P_CENTERS[t.key].consumeable and G.consumeables or G.P_CENTERS[t.key].set == 'Joker' and G.jokers
    end
    if not t.area and not t.key and t.set and SMODS.ConsumableTypes[t.set] then
        t.area = G.consumeables
    end
    SMODS.bypass_create_card_edition = t.no_edition or t.edition
    SMODS.bypass_create_card_discover = t.discover
    SMODS.bypass_create_card_discovery_center = t.bypass_discovery_center
    local _card = create_card(t.set, t.area, t.legendary, t.rarity, t.skip_materialize, t.soulable, t.key, t.key_append)
    SMODS.bypass_create_card_edition = nil
    SMODS.bypass_create_card_discover = nil
    SMODS.bypass_create_card_discovery_center = nil

    -- Should this be restricted to only cards able to handle these
    -- or should that be left to the person calling SMODS.create_card to use it correctly?
    if t.edition then _card:set_edition(t.edition, nil, true) end
    if t.enhancement then _card:set_ability(G.P_CENTERS[t.enhancement]) end
    if t.seal then _card:set_seal(t.seal, true) end
    if t.stickers then
        for i, v in ipairs(t.stickers) do
            local s = SMODS.Stickers[v]
            if not s or type(s.should_apply) ~= 'function' or s:should_apply(_card, t.area, true) then
                SMODS.Stickers[v]:apply(_card, true)
            end
        end
    end

    return _card
end