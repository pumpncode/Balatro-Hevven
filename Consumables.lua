SMODS.Atlas({
    key = "consumables", 
    path = "consumeables.png", 
    px = 71,
    py = 95
})

-- Trio
SMODS.Consumable({
    key = "trio",
    set = 'Tarot',
    cost=3,
    atlas = 'consumables',
    pos = {
        x = 0,
        y = 0
    },

    use = function(self, card, area, copier)
        -- Tarot
        G.E_MANAGER:add_event(Event({trigger = 'after', delay = 0.4, func = function()
            if G.consumeables.config.card_limit > #G.consumeables.cards then
                play_sound('timpani')
                local card_t = {
                    set = "Tarot",
                    area = G.consumeables
                }
                local new_card = SMODS.create_card(card_t)
                new_card:add_to_deck()
                G.consumeables:emplace(new_card)
                card:juice_up(0.3, 0.5)
            end
            return true 
        end }))

        --Planet
        G.E_MANAGER:add_event(Event({trigger = 'after', delay = 0.4, func = function()
            if G.consumeables.config.card_limit > #G.consumeables.cards then
                play_sound('timpani')
                local card_t = {
                    set = "Planet",
                    area = G.consumeables
                }
                local new_card = SMODS.create_card(card_t)
                new_card:add_to_deck()
                G.consumeables:emplace(new_card)
                card:juice_up(0.3, 0.5)
            end
            return true 
        end }))

        --Flow
        G.E_MANAGER:add_event(Event({trigger = 'after', delay = 0.4, func = function()
            if G.consumeables.config.card_limit > #G.consumeables.cards then
                local card_t = {
                    set = "Flow",
                    area = G.consumeables
                }
                local new_card = SMODS.create_card(card_t)
                new_card:add_to_deck()
                G.consumeables:emplace(new_card)
                card:juice_up(0.3, 0.5)
            end
            return true 
        end }))
    end,

    can_use = function (self, card) 
        return G.consumeables.config.card_limit >= #G.consumeables.cards
    end
})

-- Castle
SMODS.Consumable({
    key = "castle",
    set = 'Tarot',
    cost=3,
    atlas = 'consumables',
    pos = {
        x = 1,
        y = 0
    },

    use = function(self, card, area, copier)
        --Flow
        G.E_MANAGER:add_event(Event({trigger = 'after', delay = 0.4, func = function()
            if G.consumeables.config.card_limit > #G.consumeables.cards then
                local card_t = {
                    set = "Flow",
                    area = G.consumeables
                }
                local new_card = SMODS.create_card(card_t)
                new_card:add_to_deck()
                G.consumeables:emplace(new_card)
                card:juice_up(0.3, 0.5)
            end
            return true 
        end }))
    end,

    can_use = function (self, card) 
        return G.consumeables.config.card_limit >= #G.consumeables.cards
    end
})

-- Translator
SMODS.Consumable({
    key = "translator",
    set = 'Tarot',
    cost=3,
    atlas = 'consumables',
    pos = {
        x = 2,
        y = 0
    },

    use = function(self, card, area, copier)
        local card_index = math.ceil((pseudorandom(pseudoseed("translator")) * 100) % #G.hand.cards)
        sendDebugMessage(card_index, "rhTranslator")
        local CARD = G.hand.cards[card_index]
        local percent = 0.85 + (card_index - 0.999) / (#G.hand.cards - 0.998) * 0.3
        G.E_MANAGER:add_event(Event({
            trigger = "after",
            delay = 0.15,
            func = function()
                CARD:set_edition({
                    negative = true,
                })
                play_sound("tarot2", percent)
                CARD:juice_up(0.3, 0.3)
                return true
            end,
        }))
    end,

    can_use = function (self, card)
		return #G.hand.cards > 0
	end,
})

-- Remix
SMODS.Consumable({
    key = "remix",
    set = 'Spectral',
    cost=5,
    atlas = 'consumables',
    pos = {
        x = 0,
        y = 1
    },

    use = function(self, card, area, copier)
        local upgrades = {
            spades = poll_everything("remix"),
            hearts = poll_everything("remix"),
            clubs = poll_everything("remix"),
            diamonds = poll_everything("remix")
        }
		G.E_MANAGER:add_event(Event({
			trigger = "after",
			delay = 0.4,
			func = function()
				play_sound("tarot1")
				card:juice_up(0.3, 0.5)
				return true
			end,
		}))
		for i = 1, #G.hand.cards do
			local percent = 1.15 - (i - 0.999) / (#G.hand.cards - 0.998) * 0.3
			G.E_MANAGER:add_event(Event({
				trigger = "after",
				delay = 0.15,
				func = function()
					G.hand.cards[i]:flip()
					play_sound("card1", percent)
					G.hand.cards[i]:juice_up(0.3, 0.3)
					return true
				end,
			}))
		end
		delay(0.2)
        for k, v in pairs(G.playing_cards) do
            G.E_MANAGER:add_event(Event({
				func = function()
                    v.edition = {}
                    v:set_ability(G.P_CENTERS.c_base, nil, true)
                    v.seal = nil
                    if v.base.suit == 'Spades' then 
                        if upgrades.spades.is_enhancement then
                            v:set_ability(G.P_CENTERS[upgrades.spades.upgrade])
                        elseif upgrades.spades.is_seal then
                            v:set_seal(upgrades.spades.upgrade, true, true)
                        elseif upgrades.spades.is_edition then
                            v:set_edition(upgrades.spades.upgrade, true, true)
                        end
                    elseif v.base.suit == 'Hearts' then
                        if upgrades.hearts.is_enhancement then
                            v:set_ability(G.P_CENTERS[upgrades.hearts.upgrade])
                        elseif upgrades.hearts.is_seal then
                            v:set_seal(upgrades.hearts.upgrade, true, true)
                        elseif upgrades.hearts.is_edition then
                            v:set_edition(upgrades.hearts.upgrade, true, true)
                        end
                    elseif v.base.suit == 'Clubs' then
                        if upgrades.clubs.is_enhancement then
                            v:set_ability(G.P_CENTERS[upgrades.clubs.upgrade])
                        elseif upgrades.clubs.is_seal then
                            v:set_seal(upgrades.clubs.upgrade, true, true)
                        elseif upgrades.clubs.is_edition then
                            v:set_edition(upgrades.clubs.upgrade, true, true)
                        end
                    elseif v.base.suit == 'Diamonds' then
                        if upgrades.diamonds.is_enhancement then
                            v:set_ability(G.P_CENTERS[upgrades.diamonds.upgrade])
                        elseif upgrades.diamonds.is_seal then
                            v:set_seal(upgrades.diamonds.upgrade, true, true)
                        elseif upgrades.diamonds.is_edition then
                            v:set_edition(upgrades.diamonds.upgrade, true, true)
                        end
                    end
                    return true
				end,
			}))
        end
		for i = 1, #G.hand.cards do
			local CARD = G.hand.cards[i]
			local percent = 0.85 + (i - 0.999) / (#G.hand.cards - 0.998) * 0.3
			G.E_MANAGER:add_event(Event({
				trigger = "after",
				delay = 0.15,
				func = function()
					CARD:flip()
					play_sound("tarot2", percent)
					CARD:juice_up(0.3, 0.3)
					return true
				end,
			}))
		end

        --Then we delete the Jokers
        local deletable_jokers = {}
        for k, v in pairs(G.jokers.cards) do
            if not v.ability.eternal then deletable_jokers[#deletable_jokers + 1] = v end
        end
        local _first_dissolve = nil
        G.E_MANAGER:add_event(Event({func = function()
            for k, v in pairs(deletable_jokers) do
                v:start_dissolve(nil, _first_dissolve)
                _first_dissolve = true
            end
        return true end }))

        --Finally, -1 Joker Slot
        G.jokers.config.card_limit = G.jokers.config.card_limit - 1
	end,

    can_use = function (self, card)
		return true
	end,
})

-- Hevven World
SMODS.Consumable({
    key = "hevven_world",
    set = 'Planet',
    cost=3,
    loc_vars = function(self, info_queue, card)
        return {
            vars= {
                card.ability.extra.hands,
                card.ability.extra.times,
            }
        }
    end,
    config = {extra = {hands=3,times=2}},
    atlas = 'consumables',
    pos = {
        x = 0,
        y = 2
    },

    use = function(self, card, area, copier)
        for i = 1, card.ability.extra.hands do
            local hand = poll_poker_hand({}, "hevven", false)
            update_hand_text(
                { sound = "button", volume = 0.7, pitch = 0.8, delay = 0.3 },
                {
                    handname = localize(hand, "poker_hands"),
                    chips = G.GAME.hands[hand].chips*card.ability.extra.times,
                    mult = G.GAME.hands[hand].mult*card.ability.extra.times,
                    level = G.GAME.hands[hand].level*card.ability.extra.times,
                }
            )
            level_up_hand(card, hand, nil, card.ability.extra.times)
        end
        update_hand_text(
			{ sound = "button", volume = 0.7, pitch = 1.1, delay = 0 },
			{ mult = 0, chips = 0, handname = "", level = "" }
		)
	end,

    can_use = function (self, card)
		return true
	end,
})
