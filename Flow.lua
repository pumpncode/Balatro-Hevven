SMODS.Atlas({
    key = "flow", 
    path = "flow.png", 
    px = 71,
    py = 95
})
SMODS.Atlas({
    key = "stickers", 
    path = "stickers.png", 
    px = 71,
    py = 95
})
SMODS.Atlas({
    key = "boosters", 
    path = "boosters.png", 
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

    }
})

SMODS.Booster({
    key='flow_pack_1',
    loc_txt = {
		name = "Flow Pack",
		text = {
			"Choose {C:attention}#1#{} of",
			"up to {C:rh_flow}#2# Flow Cards{}",
		},
    },
    kind = "Spectral",
    atlas = "boosters",
    config = { extra = 10, choose = 1 },
	loc_vars = function(self, info_queue, card)
		return { vars = { card.config.center.config.choose, card.ability.extra } }
	end,
    -- select_card = "consumeables",
    weight = 10000000,
    create_card = function(self, card)
		return create_card("Spectral", G.pack_cards, nil, nil, true, true, "c_rh_remix", "rh_flow")
	end,
	ease_background_colour = function(self)
		ease_colour(G.C.DYN_UI.MAIN, G.C.SECONDARY_SET.Flow)
		ease_background_colour({ new_colour = G.C.SECONDARY_SET.Flow, special_colour = G.C.BLACK, contrast = 2 })
	end,
	group_key = "k_rh_flow_pack",
})

SMODS.Booster({
    key='flow_pack_2',
    loc_txt = {
		name = "Flow Pack",
		text = {
			"Choose {C:attention}#1#{} of",
			"up to {C:rh_flow}#2# Flow Cards{}",
		},
    },
    kind = "Flow",
    atlas = "boosters",
    pos = {
        x = 1,
        y = 0
    },
    config = { extra = 2, choose = 1 },
	loc_vars = function(self, info_queue, card)
		return { vars = { card.config.center.config.choose, card.ability.extra } }
	end,
    select_card = "consumeables",
    create_card = function(self, card)
		return create_card("Flow", G.pack_cards, nil, nil, true, true, nil, "rh_flow")
	end,
	ease_background_colour = function(self)
		ease_colour(G.C.DYN_UI.MAIN, G.C.SECONDARY_SET.Flow)
		ease_background_colour({ new_colour = G.C.SECONDARY_SET.Flow, special_colour = G.C.BLACK, contrast = 2 })
	end,
	group_key = "k_rh_flow_pack",
})

SMODS.Booster({
    key='flow_jumbo',
    loc_txt = {
		name = "Jumbo Flow Pack",
		text = {
			"Choose {C:attention}#1#{} of",
			"up to {C:rh_flow}#2# Flow Cards{}",
		},
    },
    kind = "Flow",
    atlas = "boosters",
    pos = {
        x = 2,
        y = 0
    },
    config = { extra = 4, choose = 1 },
	loc_vars = function(self, info_queue, card)
		return { vars = { card.config.center.config.choose, card.ability.extra } }
	end,
    select_card = "consumeables",
    create_card = function(self, card)
		return create_card("Flow", G.pack_cards, nil, nil, true, true, nil, "rh_flow")
	end,
	ease_background_colour = function(self)
		ease_colour(G.C.DYN_UI.MAIN, G.C.SECONDARY_SET.Flow)
		ease_background_colour({ new_colour = G.C.SECONDARY_SET.Flow, special_colour = G.C.BLACK, contrast = 2 })
	end,
	group_key = "k_rh_flow_pack",
})

SMODS.Booster({
    key='flow_mega',
    loc_txt = {
		name = "Mega Flow Pack",
		text = {
			"Choose {C:attention}#1#{} of",
			"up to {C:rh_flow}#2# Flow Cards{}",
		},
    },
    kind = "Flow",
    atlas = "boosters",
    pos = {
        x = 3,
        y = 0
    },
    config = { extra = 4, choose = 2 },
	loc_vars = function(self, info_queue, card)
		return { vars = { card.config.center.config.choose, card.ability.extra } }
	end,
    select_card = "consumeables",
    create_card = function(self, card)
		return create_card("Flow", G.pack_cards, nil, nil, true, true, nil, "rh_flow")
	end,
	ease_background_colour = function(self)
		ease_colour(G.C.DYN_UI.MAIN, G.C.SECONDARY_SET.Flow)
		ease_background_colour({ new_colour = G.C.SECONDARY_SET.Flow, special_colour = G.C.BLACK, contrast = 2 })
	end,
	group_key = "k_rh_flow_pack",
})

-- Try Again
SMODS.Consumable({
    key = "try_again",
    set = 'Flow',
    cost=7,
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
    atlas = 'flow',
    pos = {
        x = 2,
        y = 0
    },

    use = function(self, card, area, copier)   
        inc_flow_count()     
        G.E_MANAGER:add_event(Event({
            func = function() 
                local any_selected = nil
                local to_discard = {}
                for k, v in ipairs(G.hand.cards) do
                    if v.highlighted ==false then
                        to_discard[#to_discard+1] = v
                        any_selected = true
                    end
                end
                G.hand:unhighlight_all()
                for k, v in ipairs(to_discard) do
                    G.hand.highlighted[#G.hand.highlighted+1] = v
                    v:highlight(true)
                end
                if any_selected then
                    G.FUNCS.discard_cards_from_highlighted(nil, true)
                    G.STATE = G.STATES.DRAW_TO_HAND
                    G.E_MANAGER:add_event(Event({
                        func = function() 
                            G.STATE_COMPLETE = false
                            return true 
                        end 
                    }))
                end 
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

-- Superb
SMODS.Consumable({
    key = "superb",
    set = 'Flow',
    cost=7,
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
            trigger = "after", 
            delay = 1.2, 
            blocking = false,
            func = function() 
                G.FUNCS.play_cards_from_highlighted()
                return true
            end
        }))
        local hands_played_before = G.GAME.hands_played
        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 1.2,
            blocking = false,
            func = function() 
                if G.GAME.hands_played > hands_played_before then
                    G.hand:unhighlight_all()  
                    for k, v in ipairs(to_discard) do
                        G.hand.highlighted[#G.hand.highlighted+1] = v
                    end
                    G.FUNCS.discard_cards_from_highlighted(nil, true)
                    return true 
                end
                return false
            end 
        })) 
    end,

    calculate = function(self, card, context)
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
    atlas = 'flow',
    pos = {
        x = 4,
        y = 0
    },
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.base_chance,
                card.ability.extra.max_chance,
            }
        }
    end,
    config = {
        extra = {
            base_chance = 2,
            max_chance = 3
        }
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
                if enhancement_type > (G.GAME.probabilities.normal*card.ability.extra.base_chance)/card.ability.extra.max_chance then 
                    local edition = poll_edition('perfect', nil, true, true)
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
                            aura_card.edition = nil
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
            trigger = "after", 
            delay = 1.2, 
            blocking = false,
            func = function() 
                G.FUNCS.play_cards_from_highlighted()
                return true
            end
        }))
        local hands_played_before = G.GAME.hands_played
        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 1.2,
            blocking = false,
            func = function() 
                if G.GAME.hands_played > hands_played_before then
                    for k, v in ipairs(to_discard) do
                        if v.ability.name == 'Glass Card' then 
                            v:shatter()
                        else
                            v:start_dissolve(nil, false)
                        end
                    end
                    return true 
                end
                return false
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

-- Simple Tap
SMODS.Consumable({
    key = "simple_tap",
    set = 'Flow',
    cost=7,
    
    atlas = 'flow',
    pos = {
        x = 1,
        y = 1
    },
    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue+1] = {key = 'active_flow', set = 'Other'}
        return {}
    end,

    use = function(self, card, area, copier)   
        inc_flow_count()
        add_flow_tag(Tag('tag_rh_simple_tap'))
        play_sound('generic1', 0.9 + math.random()*0.1, 0.8)
        play_sound('holo1', 1.2 + math.random()*0.1, 0.4)
        G.GAME.current_round.rh_flow_simple_tap = true
    end,

    can_use = function(self, card)
		return G.STATE == G.STATES.SELECTING_HAND and not G.GAME.current_round.rh_flow_used
	end,

    rh_credits = {
        idea = {
            "patataofcourse"
        },
        code = {
            "TheAltDoc"
        }
    }
})

-- New Record
SMODS.Consumable({
    key = "new_record",
    set = 'Flow',
    cost=7,
    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue+1] = {key = 'active_flow', set = 'Other'}
        return {
            vars = {G.GAME.round_scores['hand'].amt}
        }
    end,
    atlas = 'flow',
    pos = {
        x = 1,
        y = 2
    },

    use = function(self, card, area, copier)   
        inc_flow_count()
        G.GAME.current_round.rh_flow_new_record = true
        add_flow_tag(Tag('tag_rh_new_record'))
        play_sound('generic1', 0.9 + math.random()*0.1, 0.8)
        play_sound('holo1', 1.2 + math.random()*0.1, 0.4)
    end,

    can_use = function(self, card)
		return G.STATE == G.STATES.SELECTING_HAND and not G.GAME.current_round.rh_flow_used
	end,

    rh_credits = {
        idea = {
            "patataofcourse"
        },
        code = {
            "TheAltDoc"
        }
    }
})

-- Pity Skip
SMODS.Consumable({
    key = "pity_skip",
    set = 'Flow',
    cost=7,
    atlas = 'flow',
    pos = {
        x = 2,
        y = 1
    },

    use = function(self, card, area, copier)   
        inc_flow_count()
        G.E_MANAGER:add_event(
			Event({
				trigger = "immediate",
				func = function()
					if G.STATE ~= G.STATES.SELECTING_HAND then
						return false
					end
					G.GAME.current_round.rh_flow_pity_skip = true
                    local host = pseudorandom(pseudoseed("pity_skip"))
                    if host > 0.25 then 
                        G.GAME.current_round.rh_flow_pity_skip_host = localize("rh_pity_skip_host_barista")
                    else
                        G.GAME.current_round.rh_flow_pity_skip_host = localize("rh_pity_skip_host_rupert")
                    end
					G.STATE = G.STATES.HAND_PLAYED
					G.STATE_COMPLETE = true
					end_round()
					return true
				end,
			}),
			"other"
		)
    end,

    can_use = function(self, card)
		return G.STATE == G.STATES.SELECTING_HAND and not G.GAME.blind.boss
	end,

    rh_credits = {
        idea = {
            "The Cryptid Mod"
        },
        code = {
            "The Cryptid Mod"
        }
    }
})

-- Some Good Parts
SMODS.Consumable({
    key = "some_good_parts",
    set = 'Flow',
    cost=7,
    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue+1] = {key = 'active_flow', set = 'Other'}
        return {
            vars= {
                card.ability.extra.percentage,
                G.GAME and G.GAME.probabilities.normal or 1,
                card.ability.extra.chances
            }
        }
    end,

    config = {extra = {percentage=1,chances=8}},
    atlas = 'flow',
    pos = {
        x = 3,
        y = 1
    },

    use = function(self, card, area, copier)   
        inc_flow_count()
        G.GAME.current_round.rh_flow_good_parts = true
        G.GAME.current_round.rh_flow_good_parts_chances = card.ability.extra.chances
        G.GAME.current_round.rh_flow_good_parts_percentage = card.ability.extra.percentage
        add_flow_tag(Tag('tag_rh_some_good_parts'))
        play_sound('generic1', 0.9 + math.random()*0.1, 0.8)
        play_sound('holo1', 1.2 + math.random()*0.1, 0.4)
    end,

    can_use = function(self, card)
		return G.STATE == G.STATES.SELECTING_HAND and not G.GAME.blind.boss and not G.GAME.current_round.rh_flow_used
	end,

    rh_credits = {
        idea = {
            "The Cryptid Mod"
        },
        code = {
            "The Cryptid Mod"
        }
    }
})
-- Rewritting vanilla evaluate_round somewhat to make Pity Skip and Some Good Parts work
local gfer = G.FUNCS.evaluate_round
function G.FUNCS.evaluate_round()
    if G.GAME.current_round.rh_flow_pity_skip or G.GAME.current_round.rh_flow_good_parts_saved then
        add_round_eval_row({ dollars = 0, name = "blind1", pitch = 0.95, saved = true })
        G.E_MANAGER:add_event(Event({
            trigger = "before",
            delay = 1.3 * math.min(G.GAME.blind.dollars + 2, 7) / 2 * 0.15 + 0.5,
            func = function()
                G.GAME.blind:defeat()
                return true
            end,
        }))
        delay(0.2)
        add_round_eval_row({ name = "bottom", dollars = 0 })
    else
        return gfer()
    end
end

-- You (card)
SMODS.Consumable({
    key = "you",
    set = 'Flow',
    cost=7,
    atlas = 'flow',
    pos = {
        x = 4,
        y = 1
    },
    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue+1] = {key = 'active_flow', set = 'Other'}
        return {}
    end,

    use = function(self, card, area, copier)   
        inc_flow_count()
        add_flow_tag(Tag('tag_rh_you'))
        play_sound('generic1', 0.9 + math.random()*0.1, 0.8)
        play_sound('holo1', 1.2 + math.random()*0.1, 0.4)
        G.hand.highlighted[1]:add_sticker("rh_you_sticker", true)
        G.hand.highlighted[1].ability.forced_selection = true
    end,

    can_use = function(self, card)
		return G.STATE == G.STATES.SELECTING_HAND and #G.hand.highlighted == 1 and not G.GAME.current_round.rh_flow_used
	end,

    rh_credits = {
        idea = {
            "TheAlternateDoctor"
        },
        code = {
            "TheAlternateDoctor"
        }
    }
})
-- You (Sticker)
SMODS.Sticker({
    key="you_sticker",
    badge_colour=G.C.BLACK,
    atlas='stickers',
    default_compat=true,
    rate=0
})

-- Extra Life
SMODS.Consumable({
    key = "extra_life",
    set = 'Flow',
    cost=7,
    config = {extra = {hands=1,discards=1}},
    loc_vars = function(self, info_queue, card)
        return {
            vars= {
                card.ability.extra.hands,
                (card.ability.extra.hands>1) and "s" or "",
                card.ability.extra.discards,
                (card.ability.extra.discards>1) and "s" or "",
            }
        }
    end,
    atlas = 'flow',
    pos = {
        x = 0,
        y = 2
    },

    use = function(self, card, area, copier)
        inc_flow_count()
        G.E_MANAGER:add_event(Event({func = function()
            ease_discard(card.ability.extra.discards)
            ease_hands_played(card.ability.extra.hands)
        return true end }))
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

-- Skill Star
SMODS.Consumable({
    key = "skill_star",
    set = 'Flow',
    cost=7,
    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue+1] = {key = 'active_flow', set = 'Other'}
        return {
            vars= {
                card.ability.extra.percentage,
                card.ability.extra.base_money,
                card.ability.extra.max_money
            }
        }
    end,
    config = {extra = {
        percentage = 5,
        base_money = 1,
        max_money = 40,
    }},
    atlas = 'flow',
    pos = {
        x = 0,
        y = 1
    },

    use = function(self, card, area, copier)
        inc_flow_count()
        add_flow_tag(Tag('tag_rh_skill_star'))
        G.GAME.current_round.skill_star = card.ability.extra
        play_sound('generic1', 0.9 + math.random()*0.1, 0.8)
        play_sound('holo1', 1.2 + math.random()*0.1, 0.4)
    end,

    can_use = function(self, card)
		return G.STATE == G.STATES.SELECTING_HAND and not G.GAME.current_round.rh_flow_used
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

-- Remix
SMODS.Consumable({
    key = "remix",
    set = 'Spectral',
    cost= 5,
    soul_set = 'Flow',
    atlas = 'flow',
    pos = {
        x = 2,
        y = 2
    },
    soul_pos = {
        x = 3,
        y = 2
    },

    use = function(self, card, area, copier)
        sendDebugMessage(#G.hand.cards, "RhFlowRemix")
        if #G.hand.cards == 0 then
            local card_t = {
                set = "Tarot",
                area = G.consumeables,
                key = "c_rh_remix"
            }
            local card = SMODS.create_card(card_t)
            G.consumeables:emplace(card)
        else
        end
		-- G.E_MANAGER:add_event(Event({
		-- 	trigger = "after",
		-- 	delay = 0.4,
		-- 	func = function()
		-- 		play_sound("tarot1")
		-- 		card:juice_up(0.3, 0.5)
		-- 		return true
		-- 	end,
		-- }))
		-- for i = 1, #G.hand.cards do
		-- 	local percent = 1.15 - (i - 0.999) / (#G.hand.cards - 0.998) * 0.3
		-- 	G.E_MANAGER:add_event(Event({
		-- 		trigger = "after",
		-- 		delay = 0.15,
		-- 		func = function()
		-- 			G.hand.cards[i]:flip()
		-- 			play_sound("card1", percent)
		-- 			G.hand.cards[i]:juice_up(0.3, 0.3)
		-- 			return true
		-- 		end,
		-- 	}))
		-- end
		-- delay(0.1)
        -- for k, v in pairs(G.hand.cards) do
        --     G.E_MANAGER:add_event(Event({
		-- 		func = function()
        --             v.edition = nil
        --             v:set_ability(G.P_CENTERS.c_base, nil, true)I'm gonna be honest 
        --             v.seal = nil
        --             if v.base.suit == 'Spades' then 
        --                 if upgrades.spades.is_enhancement then
        --                     v:set_ability(G.P_CENTERS[upgrades.spades.upgrade])
        --                 elseif upgrades.spades.is_seal then
        --                     v:set_seal(upgrades.spades.upgrade, true, true)
        --                 elseif upgrades.spades.is_edition then
        --                     v:set_edition(upgrades.spades.upgrade, true, true)
        --                 end
        --             elseif v.base.suit == 'Hearts' then
        --                 if upgrades.hearts.is_enhancement then
        --                     v:set_ability(G.P_CENTERS[upgrades.hearts.upgrade])
        --                 elseif upgrades.hearts.is_seal then
        --                     v:set_seal(upgrades.hearts.upgrade, true, true)
        --                 elseif upgrades.hearts.is_edition then
        --                     v:set_edition(upgrades.hearts.upgrade, true, true)
        --                 end
        --             elseif v.base.suit == 'Clubs' then
        --                 if upgrades.clubs.is_enhancement then
        --                     v:set_ability(G.P_CENTERS[upgrades.clubs.upgrade])
        --                 elseif upgrades.clubs.is_seal then
        --                     v:set_seal(upgrades.clubs.upgrade, true, true)
        --                 elseif upgrades.clubs.is_edition then
        --                     v:set_edition(upgrades.clubs.upgrade, true, true)
        --                 end
        --             elseif v.base.suit == 'Diamonds' then
        --                 if upgrades.diamonds.is_enhancement then
        --                     v:set_ability(G.P_CENTERS[upgrades.diamonds.upgrade])
        --                 elseif upgrades.diamonds.is_seal then
        --                     v:set_seal(upgrades.diamonds.upgrade, true, true)
        --                 elseif upgrades.diamonds.is_edition then
        --                     v:set_edition(upgrades.diamonds.upgrade, true, true)
        --                 end
        --             end
        --             return true
		-- 		end,
		-- 	}))
        -- end
		-- for i = 1, #G.hand.cards do
		-- 	local CARD = G.hand.cards[i]
		-- 	local percent = 0.85 + (i - 0.999) / (#G.hand.cards - 0.998) * 0.3
		-- 	G.E_MANAGER:add_event(Event({
		-- 		trigger = "after",
		-- 		delay = 0.15,
		-- 		func = function()
		-- 			CARD:flip()
		-- 			play_sound("tarot2", percent)
		-- 			CARD:juice_up(0.3, 0.3)
		-- 			return true
		-- 		end,
		-- 	}))
		-- end

        -- --Then we delete the Jokers
        -- local deletable_jokers = {}
        -- for k, v in pairs(G.jokers.cards) do
        --     if not v.ability.eternal then deletable_jokers[#deletable_jokers + 1] = v end
        -- end
        -- local _first_dissolve = nil
        -- G.E_MANAGER:add_event(Event({func = function()
        --     for k, v in pairs(deletable_jokers) do
        --         v:start_dissolve(nil, _first_dissolve)
        --         _first_dissolve = true
        --     end
        -- return true end }))

        -- --Finally, -1 Joker Slot
        -- G.jokers.config.card_limit = G.jokers.config.card_limit - 1
	end,

    can_use = function (self, card)
		return true
	end,
})
