SMODS.Atlas({
    key = "consumables", 
    path = "placeholders.png", 
    px = 71,
    py = 95
})

SMODS.Consumable({
    key = "trio",
    set = 'Tarot',
    loc_txt = {
        name = 'The Trio',
        text = {
            "Creates a random planet, tarot",
            "and flow card."
        }
    },

    use = function(self, card, area, copier)
        local card_t = {
            set = "Tarot",
            area = G.consumeables
        }
        local card = SMODS.create_card(card_t)
        G.consumeables:emplace(card)
        local card_t = {
            set = "Planet",
            area = G.consumeables
        }
        local card = SMODS.create_card(card_t)
        G.consumeables:emplace(card)
        local card_t = {
            set = "Flow",
            area = G.consumeables
        }
        local card = SMODS.create_card(card_t)
        G.consumeables:emplace(card)
    end,

    can_use = function (self, card) 
        return true
    end
})