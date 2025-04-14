SMODS.Atlas({
    key = "jokers", 
    path = "jokers.png", 
    px = 71,
    py = 95
})

-- TEMPLATE JOKER CODE --
-- To copy and paste when adding a new Joker

-- SMODS.Joker({
--     key = "KEY",

--     loc_vars = function(self, info_queue, card)
--                 return {
--                     vars = {
--                     }
--                 }
--     end,
--     cost = 1,
--     rarity = 1,
--     blueprint_compat = false,
--     eternal_compat = true,
--     unlocked = true,
--     discovered = true,
--     atlas = 'jokers',
--     pos = {
--         x = 4,
--         y = 0
--     },
-- 	config = {
--         extra = {
--         }
--     },

--     calculate = function(self, card, context)
--         return true
--     end
-- })


-- ======================

-- Widget (uncommon)
SMODS.Joker({
    key = "widget",
    loc_txt = {
        name = 'Widget',
        text = {
            "Retriggers {C:attention}5th {}played",
            "card of hand {C:attention}#1#{} times"
        }
    },
    loc_vars = function(self, info_queue, card)
                return {
                    vars = {
                        card.ability.extra.retriggers
                    }
                }
    end,
    cost = 5,
    rarity = 1,
    blueprint_compat = true,
    eternal_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'jokers',
    pos = {
        x = 0,
        y = 0
    },
	config = {
        extra = {
            retriggers = 2
        }
    },

    calculate = function(self, card, context)
        if context.repetition and context.cardarea == G.play and context.other_card == context.scoring_hand[5] then
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 4.10+(0.5*G.SETTINGS.GAMESPEED),
                blocking = false,
                blockable = false,
                func = function() 
                    play_sound("rh_widget_piano", 2.0, 0.5)
                    play_sound("rh_widget_piano", 1.0, 0.5)
                    play_sound("rh_widget_launch", 1.0, 0.5)
                    return true 
                end 
            }))  
            return {
                message = localize('k_again_ex'),
                repetitions = card.ability.extra.retriggers,
                card = card
            }
        end
    end
})

-- Space Gramps (common)
SMODS.Joker({
    key = "space_gramp",
    loc_txt = {
        name = 'Space Gramp',
        text = {
            "This Joker gains {C:mult}+#1#{} Mult",
            "if played hand contains",
            "a {C:attention}Black #2#",
            "{C:inactive}(Currently {C:red}+#3#{C:inactive} Mult)",
        },
    },
    loc_vars = function(self, info_queue, card)
                return {
                    vars = {
                        card.ability.extra.mult_mod,
                        localize('Flush', 'poker_hands'),
                        card.ability.extra.mult
                    }
                }
    end,
    cost = 6,
    rarity = 2,
    blueprint_compat = true,
    eternal_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'jokers',
    pos = {
        x = 0,
        y = 1
    },
	config = { extra = { mult = 0, mult_mod = 4 }},

    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.before then
            if next(context.poker_hands['Flush']) and not context.blueprint then
                sendDebugMessage("card suits: "..context.scoring_hand[1].base.suit.." "..context.scoring_hand[2].base.suit, "rh_j_gramps")
                if  (context.scoring_hand[1].base.suit == "Spades" or context.scoring_hand[1].base.suit == "Clubs") and
                    (context.scoring_hand[2].base.suit == "Spades" or context.scoring_hand[2].base.suit == "Clubs") then
                    card.ability.extra.mult = card.ability.extra.mult + card.ability.extra.mult_mod
                    return {
                        message = localize('k_upgrade_ex'),
                        colour = G.C.MULT
                    }
                end
            end
        end
        if context.joker_main then
            if card.ability.extra.mult > 0 then
                return {
                    message = localize({ type = "variable", key = "a_mult", vars = {
                        card.ability.extra.mult,
                    }}),
                    mult_mod = card.ability.extra.mult,
                    colour = G.C.MULT
                }
            end
        end
    end
})

-- Cosmic Girl (common)
SMODS.Joker({
    key = "cosmic_girl",
    loc_txt = {
        name = 'Cosmic Girl',
        text = {
            "This Joker gains {C:mult}+#1#{} Mult",
            "if played hand contains",
            "a {C:attention}Red #2#",
            "{C:inactive}(Currently {C:red}+#3#{C:inactive} Mult)",
        },
    },
    loc_vars = function(self, info_queue, card)
                return {
                    vars = {
                        card.ability.extra.mult_mod,
                        localize('Flush', 'poker_hands'),
                        card.ability.extra.mult
                    }
                }
    end,
    cost = 6,
    rarity = 2,
    blueprint_compat = true,
    eternal_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'jokers',
    pos = {
        x = 1,
        y = 1
    },
	config = { extra = { mult = 0, mult_mod = 4 }},

    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.before then
            if next(context.poker_hands['Flush']) and not context.blueprint then
                if  context.scoring_hand[1].base.suit == "Hearts" or context.scoring_hand[1].base.suit == "Diamonds" and
                    context.scoring_hand[2].base.suit == "Hearts"  or context.scoring_hand[2].base.suit == "Diamonds"  then
                    card.ability.extra.mult = card.ability.extra.mult + card.ability.extra.mult_mod
                    local sound = 'rh_cosmic_girl_pose_jp'
                    if BHevven.config.language == "en" then
                        local sound = 'rh_cosmic_girl_pose_en'
                    elseif BHevven.config.language == "fr" then
                        local sound = 'rh_cosmic_girl_pose_en'
                    end
                    return {
                        sound = sound,
                        pitch = 1.0,
                        message = localize('k_upgrade_ex'),
                        colour = G.C.MULT
                    }
                end
            end
        end
        if context.joker_main then
            if card.ability.extra.mult > 0 then
                return {
                    message = localize({ type = "variable", key = "a_mult", vars = {
                        card.ability.extra.mult,
                    }}),
                    mult_mod = card.ability.extra.mult,
                    colour = G.C.MULT
                }
            end
        end
    end
})

-- Munchy Monk
SMODS.Joker({
    key = "munchy_monk",
    loc_txt = {
        name = 'Munchy Monk',
        text = {
            "This Joker gains {C:blue}+#1#{} Chips per",
            "{C:rh_flow}Flow{} card used this run,  {C:red}+#2#{} Mult ",
            "per {C:tarot}Tarot{} card used this run, and",
            "{X:mult,C:white} X#3# {} Mult every time a {C:planet}Planet{} card is used",
            "{C:inactive}(Currently {C:blue}+#4#{} Chips, {C:red}+#5#{} Mult, {X:mult,C:white} X#6# {C:inactive} Mult)",
        }
    },
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.add_chips,
                card.ability.extra.add_mult,
                card.ability.extra.add_x_mult,
                (G.GAME.consumeable_usage_total and G.GAME.consumeable_usage_total.flow or 0)*card.ability.extra.add_chips,
                (G.GAME.consumeable_usage_total and G.GAME.consumeable_usage_total.tarot or 0)*card.ability.extra.add_mult,
                card.ability.extra.x_mult,
            }
        }
    end,
    cost = 20,
    rarity = 4,
    blueprint_compat = true,
    eternal_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'jokers',
    pos = {
        x = 0,
        y = 2
    },
    soul_pos = {
        x = 1,
        y = 2
    },
	config = { extra = {
        add_chips = 50,
        add_mult = 1,
        add_x_mult = 0.1,
        chips = 0,
        mult = 0,
        x_mult = 1.0,
        used_planets = 0,
        used_tarots = 0,
        used_flows = 0,
        monk_level = 0
    }},
    calculate = function(self, card, context)
        if
			context.using_consumeable
			and not context.consumeable.beginning_end
		then
			if context.consumeable.ability.set == "Planet" then
                card.ability.extra.x_mult = card.ability.extra.x_mult + card.ability.extra.add_x_mult
                card.ability.extra.used_planets = card.ability.extra.used_planets +1
                G.E_MANAGER:add_event(Event({
                    func = function()
                        if (card.ability.extra.monk_level < card.ability.extra.used_planets) and
                            (card.ability.extra.monk_level < card.ability.extra.used_tarots) and
                            (card.ability.extra.monk_level < card.ability.extra.used_flows)
                        then
                            card.ability.extra.monk_level = card.ability.extra.monk_level + 1
                            card.children.floating_sprite:set_sprite_pos({
                                x = card.ability.extra.monk_level + 1,
                                y = 2
                            })
                        end
                        card_eval_status_text(card, 'extra', nil, nil, nil, {message = localize{type='variable',key='a_xmult',vars={card.ability.extra.x_mult}}})
                        return true
                    end
                }))
            end
			if context.consumeable.ability.set == "Tarot" then
                card.ability.extra.mult = card.ability.extra.mult + card.ability.extra.add_mult
                card.ability.extra.used_tarots = card.ability.extra.used_tarots +1
                G.E_MANAGER:add_event(Event({
                    func = function()
                        if (card.ability.extra.monk_level < card.ability.extra.used_planets) and
                            (card.ability.extra.monk_level < card.ability.extra.used_tarots) and
                            (card.ability.extra.monk_level < card.ability.extra.used_flows)
                        then
                            if card.ability.extra.monk_level < 4 then
                                card.ability.extra.monk_level = card.ability.extra.monk_level + 1
                                card.children.floating_sprite:set_sprite_pos({
                                    x = card.ability.extra.monk_level + 1,
                                    y = 2
                                })
                                card.juice_up()
                            end
                        end
                        card_eval_status_text(card, 'extra', nil, nil, nil, {message = localize('k_upgrade_ex'), colour = G.C.MULT})
                        return true
                    end}))
            end
			if context.consumeable.ability.set == "Flow" then
                card.ability.extra.chips = card.ability.extra.chips + card.ability.extra.add_chips
                card.ability.extra.used_flows = card.ability.extra.used_flows +1
                G.E_MANAGER:add_event(Event({
                    func = function()
                        if (card.ability.extra.monk_level < card.ability.extra.used_planets) and
                            (card.ability.extra.monk_level < card.ability.extra.used_tarots) and
                            (card.ability.extra.monk_level < card.ability.extra.used_flows)
                        then
                            card.ability.extra.monk_level = card.ability.extra.monk_level + 1
                            card.children.floating_sprite:set_sprite_pos({
                                x = card.ability.extra.monk_level + 1,
                                y = 2
                            })
                        end
                        card_eval_status_text(card, 'extra', nil, nil, nil, {message = localize('k_upgrade_ex'), colour = G.C.CHIPS})
                        return true
                    end}))
            end
            sendDebugMessage("Monk level: "..card.ability.extra.monk_level, "rh_j_munchy_monk")
            sendDebugMessage("Used Planet cards: "..card.ability.extra.used_planets, "rh_j_munchy_monk")
            sendDebugMessage("Used Tarot cards: "..card.ability.extra.used_tarots, "rh_j_munchy_monk")
            sendDebugMessage("Used Flow cards: "..card.ability.extra.used_flows, "rh_j_munchy_monk")
            
            return
        end
        if context.joker_main then
            if
            card.ability.extra.x_mult ~= 1.0 or 
            card.ability.extra.mult ~= 0 or 
            card.ability.extra.chips ~= 0
            then 
                return {
                    message = localize({ type = "variable", key = "a_mmoonk", vars = {
                        card.ability.extra.chips,
                        card.ability.extra.mult,
                        card.ability.extra.x_mult 
                    }}),
                    Xmult_mod = card.ability.extra.x_mult,
                    chip_mod = card.ability.extra.chips,
                    mult_mod = card.ability.extra.mult,
                }
            end
        end
    end
})

-- Double Sided (common)
SMODS.Joker({
    key = "lockstep",
    loc_txt = {
        name = 'Double Sided',
        text = {
            "Played cards with #1# rank gives",
            "{C:chips}+#2#{} chips, {C:mult}+#3#{} mult when scored,",
            "parity changes",
            "at end of round",
        },
    },
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.message,
                card.ability.extra.chips,
                card.ability.extra.mult
            }
        }
    end,
    cost = 4,
    rarity = 1,
    blueprint_compat = true,
    eternal_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'jokers',
    pos = {
        x = 2,
        y = 0
    },
	config = { extra = { parity = 0, chips = 20, mult = 2, message = localize("rh_even") }},

    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play then
            if (context.other_card:get_id() <= 10 and
            context.other_card:get_id() >= 0 and
            context.other_card:get_id()%2 == card.ability.extra.parity)
            then
                return {
                    chips = card.ability.extra.chips,
                    mult = card.ability.extra.mult
                }
            end
            -- I can't be bothered to write it better right now...
            if context.other_card:get_id() == 14 and card.ability.extra.parity == 1 then
                return {
                    chips = card.ability.extra.chips,
                    mult = card.ability.extra.mult
                }
            end
        end
        if context.end_of_round and context.cardarea == G.jokers then
            if card.ability.extra.parity == 1 then
                card.ability.extra.parity = 0
                card.ability.extra.message = localize("rh_even")
            else 
                card.ability.extra.parity = 1
                card.ability.extra.message = localize("rh_odd")
            end
            return {
                message = localize('k_reset')
            }
        end
    end,

    set_ability = function(self, card, initial, delay_sprites)
        card.ability.extra.message = localize("rh_even")
    end
})

-- Hairy Onion
SMODS.Joker({
    key = "onion",

    loc_vars = function(self, info_queue, card)
                return {
                    vars = {
                        card.ability.extra.n_draw,
                        card.ability.extra.can_draw
                    }
                }
    end,
    cost = 4,
    rarity = 1,
    blueprint_compat = false,
    eternal_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'jokers',
    pos = {
        x = 2,
        y = 1
    },
	config = {
        extra = {
            n_draw = 1,
            can_draw = false
        }
    },

    calculate = function(self, card, context)
        -- Not blueprint compatible
        if context.blueprint then
            return
        end

        -- When discarding, check if we're gonna be below max hand size after discard, if so, we can draw afterwards
        if context.pre_discard and not card.ability.extra.can_draw
        then
            if #G.hand.cards - #G.hand.highlighted < G.hand.config.card_limit then
                card.ability.extra.can_draw = true
            end
            return true
        end

        -- After drawing next hand after discard, draw an extra card
        if context.hand_drawn and card.ability.extra.can_draw
        then
            G.E_MANAGER:add_event(Event({
                func = function()
                    -- play_sound("rh_pluck", math.random(0.5,1.5) , 0.5)
                    G.FUNCS.draw_from_deck_to_hand(card.ability.extra.n_draw)
                    return true
            end}))

            card.ability.extra.can_draw = not card.ability.extra.can_draw

            return {
                message = "Pluck!",
                sound = "rh_pluck",
                pitch = math.random(0.1,1.5)
            }
        end
    end
})

-- Sneaky Spirit
SMODS.Joker({
    key = "sneaky_spirit",

    loc_vars = function(self, info_queue, card)
                return {
                    vars = {
                        card.ability.extra.rounds
                    }
                }
    end,
    cost = 6,
    rarity = 2,
    blueprint_compat = false,
    eternal_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'jokers',
    pos = {
        x = 3,
        y = 1
    },
	config = {
        extra = {
            rounds = 0
        }
    },

    calculate = function(self, card, context)

        -- Not compatible with blueprint, can't be retriggered
        if context.blueprint and context.retrigger_joker then return end

        local round_max = 2 -- variable for easy value change. Does not show up in description.

        -- At the end of each round, tick one if it's still inactive
        if context.end_of_round and context.cardarea == G.jokers
        then
            if card.ability.extra.rounds >= round_max then return end -- Don't do anything if we already reached the goal

            card.ability.extra.rounds = card.ability.extra.rounds + 1

            local display_message = (round_max-card.ability.extra.rounds) .. " Left!"
            if card.ability.extra.rounds >= round_max then
                display_message = "Ready!"
            end

            return {
                message = display_message
            }
        end

        -- When card is sold and waited enough rounds, trigger effect
        if context.selling_self and card.ability.extra.rounds >= round_max
        then
                -- Inspired by Invis. Joker.
                -- Set up the joker pool that excludes itself and does not already have an edition
                local jokers = {}
                for i=1, #G.jokers.cards do 

                    local c = G.jokers.cards[i]

                    if c ~= card and c.edition == nil then
                        sendDebugMessage("Adding card " .. G.jokers.cards[i].ability.name)
                        jokers[#jokers+1] = c
                    end
                    
                end

                if #jokers > 0
                then
                    local to_add_neg = pseudorandom_element(jokers, pseudoseed('sneaky_spirit'))

                    to_add_neg:set_edition({negative = true}, true)
                end

                return true
        end
    end
})

-- Samurai Drummer

SMODS.Joker({
    key = "samurai_drummer",

    loc_vars = function(self, info_queue, card)
                return {
                    vars = {
                        card.ability.extra.bonus_chips,
                        card.ability.extra.chips,
                    }
                }
    end,
    cost = 6,
    rarity = 1,
    blueprint_compat = true,
    eternal_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'jokers',
    pos = {
        x = 1,
        y = 0
    },
	config = {
        extra = {
            chips = 0,
            bonus_chips = 25
        }
    },

    calculate = function(self, card, context)
        
        if context.joker_main and context.cardarea == G.jokers then
            return {
                chips = card.ability.extra.chips
            }
        end

        if not context.blueprint then
            -- Check if flow card has been used
            if context.using_consumeable then
                if context.consumeable.ability.set == "Flow" then
                    card.ability.extra.chips = card.ability.extra.chips + card.ability.extra.bonus_chips
                    return {
                        message = "+" .. card.ability.extra.bonus_chips,
                        colour = G.C.BLUE,
                    }
                end
            end
        end

    end
})

-- Goat
SMODS.Joker({
    key = "goat",

    loc_vars = function(self, info_queue, card)
                return {
                    vars = {
                        card.ability.extra.small_payout,
                        card.ability.extra.medium_payout,
                        card.ability.extra.big_payout,
                    }
                }
    end,
    cost = 8,
    rarity = 2,
    blueprint_compat = false,
    eternal_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'jokers',
    pos = {
        x = 4,
        y = 1
    },
	config = {
        extra = {
            small_payout = 5,
            medium_payout = 15,
            big_payout = 50
        }
    },

    calc_dollar_bonus = function(self, card, context)
        local d100 = pseudorandom(pseudoseed('goat'), 1, 100)
        
        sendDebugMessage("Rolled a ".. d100)

        -- Payouts
        if d100 <= 60 then
            return card.ability.extra.small_payout
        end

        if d100 > 60 and d100 <= 95 then
            return card.ability.extra.medium_payout
        end

        if d100 > 95 then
            return card.ability.extra.big_payout
        end

        -- How did you even reach here??
        return 1

    end
})

-- Monkey
SMODS.Joker({
    key = "monkey",

    loc_vars = function(self, info_queue, card)
                return {
                    vars = {
                    }
                }
    end,
    cost = 8,
    rarity = 3,
    blueprint_compat = true,
    eternal_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'jokers',
    pos = {
        x = 3,
        y = 0
    },
	config = {
        extra = {
        }
    },

    calculate = function(self, card, context)
        if context.repetition and context.cardarea == G.play then
            return {
                message = localize('k_again_ex'),
                repetitions = 1,
                card = card,
                sound = "rh_monkey"
            }
        end
    end
})