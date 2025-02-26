SMODS.Atlas({
    key = "flow", 
    path = "flow.png", 
    px = 71,
    py = 95
})

SMODS.ConsumableType({
    key='Flow',
    primary_colour=HEX('FFFFFF'),
    secondary_colour=HEX('FFAFFB'),
    shop_rate=1,
    loc_txt = {
        name = 'Flow',
        collection = 'Flow Cards',

    },
    cards = {
        ["c_rh_try_again"] = true,
    }
})

-- Try Again
SMODS.Consumable({
    key = "try_again",
    set = 'Flow',
    cost=7,
    loc_txt = {
        name = 'Try Again',
        text = {
            "Discards and redraws",
            "your entire hand"
        }
    },
    atlas = 'flow',
    pos = {
        x = 1,
        y = 0
    },

    use = function(self, card, area, copier)
        inc_flow_count()
        local to_discard = {}
        for k, v in ipairs(G.hand.cards) do
                to_discard[#to_discard+1] = v
        end
        for k, v in ipairs(to_discard) do
            G.hand:add_to_highlighted(v, true)
            G.FUNCS.discard_cards_from_highlighted(nil, true)
            G.hand:remove_from_highlighted(v, true)
        end
    end,

    can_use = function(self, card)
		return G.STATE == G.STATES.SELECTING_HAND
	end,

    rh_credits = {
        idea = {
            "patataofcourse"
        },
        code = {
            "TheAlternateDoctor"
        }
    }
})

-- OK
SMODS.Consumable({
    key = "ok",
    set = 'Flow',
    cost=7,
    loc_txt = {
        name = 'OK',
        text = {
            "Discards and redraws",
            "your entire hand, save for",
            "selected cards"
        }
    },
    atlas = 'flow',
    pos = {
        x = 2,
        y = 0
    },

    use = function(self, card, area, copier)   
        inc_flow_count()     
        local to_discard = {}
        for k, v in ipairs(G.hand.cards) do
            if v.highlighted ==false then
                to_discard[#to_discard+1] = v
            end
        end
        G.hand:unhighlight_all()
        for k, v in ipairs(to_discard) do
            G.hand:add_to_highlighted(v, true)
            G.FUNCS.discard_cards_from_highlighted(nil, true)
            G.hand:remove_from_highlighted(v, true)
        end
        while #G.hand.cards < G.hand.config.card_limit do
            G.FUNCS.draw_from_deck_to_hand(1)
        end
    end,

    can_use = function(self, card)
		return G.STATE == G.STATES.SELECTING_HAND and #G.hand.highlighted > 0
	end,

    rh_credits = {
        idea = {
            "patataofcourse"
        },
        code = {
            "TheAlternateDoctor"
        }
    }
})

-- Superb
SMODS.Consumable({
    key = "superb",
    set = 'Flow',
    cost=7,
    loc_txt = {
        name = 'Superb',
        text = {
            "Enhances selected cards,",
            "plays them, and discards",
            "the rest of your hand"
        }
    },
    atlas = 'flow',
    pos = {
        x = 3,
        y = 0
    },

    use = function(self, card, area, copier)   
        inc_flow_count()
        local to_discard = {}
        local highlighted_cards = {}
        for k, v in ipairs(G.hand.cards) do
            if v.highlighted ==false then
                to_discard[#to_discard+1] = v
            else 
                highlighted_cards[#highlighted_cards+1] = v
            end
        end
        for i=1, #G.hand.highlighted do
            local percent = 1.15 - (i-0.999)/(#G.hand.highlighted-0.998)*0.3
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.15,
                func = function() 
                    G.hand.highlighted[i]:flip()
                    play_sound('card1', percent)
                    G.hand.highlighted[i]:juice_up(0.3, 0.3)
                    return true 
                end 
            }))   
        end
        for i=1, #G.hand.highlighted do
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.1,
                func = function() 
                    local enhancement_type = pseudorandom(pseudoseed("superb"))
                    if enhancement_type > 0.66 then
                        if enhancement_type > 0.82 then -- stone
                            G.hand.highlighted[i]:set_ability(G.P_CENTERS['m_stone'])
                        else -- wild
                            G.hand.highlighted[i]:set_ability(G.P_CENTERS['m_wild'])
                        end
                    elseif enhancement_type > 0.40 then
                        if enhancement_type > 0.53 then -- bonus
                            G.hand.highlighted[i]:set_ability(G.P_CENTERS['m_bonus'])
                        else -- gold
                            G.hand.highlighted[i]:set_ability(G.P_CENTERS['m_gold'])
                        end
                    elseif enhancement_type > 0.15 then
                        if enhancement_type > 0.27 then -- mult
                            G.hand.highlighted[i]:set_ability(G.P_CENTERS['m_mult'])
                        else -- lucky
                            G.hand.highlighted[i]:set_ability(G.P_CENTERS['m_lucky'])
                        end
                    else
                        if enhancement_type > 0.7 then -- steel
                            G.hand.highlighted[i]:set_ability(G.P_CENTERS['m_steel'])
                        else -- glass
                            G.hand.highlighted[i]:set_ability(G.P_CENTERS['m_glass'])
                        end
                    end
                    return true 
                end 
            }))        
        end
        for i=1, #G.hand.highlighted do
            local percent = 0.85 + (i-0.999)/(#G.hand.highlighted-0.998)*0.3
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.15,
                func = function() 
                    G.hand.highlighted[i]:flip()
                    play_sound('tarot2', percent, 0.6)
                    G.hand.highlighted[i]:juice_up(0.3, 0.3)
                    return true 
                end 
            }))
        end
        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.5,
            func = function() 
                G.hand:unhighlight_all()  
                for k, v in ipairs(to_discard) do
                    G.hand:add_to_highlighted(v, true)
                    G.FUNCS.discard_cards_from_highlighted(nil, true)
                    G.hand:remove_from_highlighted(v, true)
                end
                return true 
            end 
        })) 
    end,

    calculate = function(self, card, context)
        sendDebugMessage("Context: "..context.consumeable, "rh_c_superb")
        if
			context.using_consumeable
			and context.consumeable.beginning_end
		then
            for k, v in ipairs(G.hand.cards) do
                G.hand:add_to_highlighted(v, true)
            end
            G.FUNCS.play_cards_from_highlighted()
        end
    end,

    can_use = function(self, card)
		return G.STATE == G.STATES.SELECTING_HAND and #G.hand.highlighted > 0
	end,

    rh_credits = {
        idea = {
            "patataofcourse"
        },
        code = {
            "TheAlternateDoctor"
        }
    }
})

-- Perfect
SMODS.Consumable({
    key = "perfect",
    set = 'Flow',
    cost=7,
    loc_txt = {
        name = 'Perfect',
        text = {
            "Add {C:dark_edition}Foil{}, {C:dark_edition}Holographic{}, or {C:dark_edition}Polychrome{}",
            "to selected cards, plays them,",
            "and destroys the rest of your hand"
        }
    },
    atlas = 'flow',
    pos = {
        x = 4,
        y = 0
    },

    use = function(self, card, area, copier)   
        inc_flow_count()
        local to_discard = {}
        local highlighted_cards = {}
        for k, v in ipairs(G.hand.cards) do
            if v.highlighted ==false then
                to_discard[#to_discard+1] = v
            else 
                highlighted_cards[#highlighted_cards+1] = v
            end
        end
        for i=1, #G.hand.highlighted do
            G.E_MANAGER:add_event(Event({trigger = 'after', delay = 0.4, func = function()
                local enhancement_type = pseudorandom(pseudoseed("perfect"))
                local aura_card = G.hand.highlighted[i]
                if enhancement_type > 0.67 then 
                    local edition = poll_edition('aura', nil, true, true)
                    if not aura_card.edition then
                        aura_card:set_edition(edition, true)
                        aura_card:juice_up(0.3, 0.5)
                    end
                else
                    G.E_MANAGER:add_event(Event({trigger = 'after', delay = 0.4,blocking = false, blockable = false, func = function()
                        attention_text({
                            text = localize('k_nope_ex'),
                            scale = 1.3, 
                            hold = 1.4,
                            major = aura_card,
                            backdrop_colour = G.C.SECONDARY_SET.Tarot,
                            align = (G.STATE == G.STATES.TAROT_PACK or G.STATE == G.STATES.SPECTRAL_PACK) and 'tm' or 'cm',
                            offset = {x = 0, y = (G.STATE == G.STATES.TAROT_PACK or G.STATE == G.STATES.SPECTRAL_PACK) and -0.2 or 0},
                            silent = true
                            })
                            G.E_MANAGER:add_event(Event({trigger = 'after', delay = 0.06*G.SETTINGS.GAMESPEED, blockable = false, blocking = false, func = function()
                                play_sound('tarot2', 0.76, 0.4);return true end}))
                            play_sound('tarot2', 1, 0.4)
                            aura_card:juice_up(0.3, 0.5)
                    return true end }))
                    aura_card.edition = nil
                end
            return true end }))      
        end
        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.5,
            func = function() 
                G.hand:unhighlight_all()  
                for k, v in ipairs(to_discard) do
                    if v.ability.name == 'Glass Card' then 
                        v:shatter()
                    else
                        v:start_dissolve(nil, false)
                    end
                end
                return true 
            end 
        })) 
        G.E_MANAGER:add_event(Event({
            trigger = "after", 
            delay = 1.2, 
            blocking = false,
            func = function() 
                for k, v in ipairs(highlighted_cards) do
                    G.hand:add_to_highlighted(v, true)
                end
                G.FUNCS.play_cards_from_highlighted()
                return true
            end
        }))
    end,

    can_use = function(self, card)
		return G.STATE == G.STATES.SELECTING_HAND and #G.hand.highlighted > 0
	end,

    rh_credits = {
        idea = {
            "patataofcourse"
        },
        code = {
            "TheAlternateDoctor"
        }
    }
})