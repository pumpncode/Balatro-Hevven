SMODS.Atlas({
    key = "consumables", 
    path = "consumeables.png", 
    px = 71,
    py = 95
})

SMODS.Consumable({
    key = "trio",
    set = 'Tarot',
    cost=3,
    loc_txt = {
        name = 'The Trio',
        text = {
            "Creates a random planet, tarot",
            "and flow card."
        }
    },
    atlas = 'consumables',
    pos = {
        x = 0,
        y = 1
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
            -- end
            return true 
        end }))
    end,

    can_use = function (self, card) 
        return true
    end
})