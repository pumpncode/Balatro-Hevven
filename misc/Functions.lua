function inc_flow_count()
    if G.GAME.consumeable_usage_total.flow ~= nil then
        G.GAME.consumeable_usage_total.flow = G.GAME.consumeable_usage_total.flow + 1
    else
        G.GAME.consumeable_usage_total.flow = 1
    end
end

function poll_everything(seed)
    local upgrade_type = {
        is_enhancement = false,
        is_seal = false,
        is_edition = false,
        upgrade
    }
    local upgrade_chance = pseudorandom(pseudoseed(seed))
    if upgrade_chance > 0.50 then -- Add enhancement
        upgrade_type.is_enhancement = true
        -- upgrade_type.upgrade = poll_enhancements(seed)
        upgrade_type.upgrade = SMODS.poll_enhancement({guaranteed = true, type_key = seed})
    elseif upgrade_chance > 0.15 then -- Add seal
        upgrade_type.is_seal = true
        upgrade_type.upgrade = SMODS.poll_seal({guaranteed = true, type_key = seed})
    else -- Add Edition
        upgrade_type.is_edition = true
        upgrade_type.upgrade = poll_edition(seed, nil, true, true)
    end
    return upgrade_type
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