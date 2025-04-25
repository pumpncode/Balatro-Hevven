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
    sendDebugMessage("Found C&R at pos "..pos, "rhC&Rseek")
    local added = false
    for j=pos, 1, -1 do
        sendDebugMessage("Checking "..hand[j].base.value.." of "..hand[j].base.suit,"rhC&Rseek")
        if hand[j].ability.name ~= 'm_rh_call_response' and not added then
            if (hand[j].highlighted or false) == highlighted then
                added = true
                copiable = hand[j]
                sendDebugMessage("Found "..copiable.base.value.." of "..copiable.base.suit, "rhC&Rseek")
            end
        end
    end
    return copiable
end