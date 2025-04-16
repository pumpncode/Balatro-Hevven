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
                    level = G.GAME.hands[hand].level+card.ability.extra.times,
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
