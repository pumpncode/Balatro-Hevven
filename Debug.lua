
SMODS.Back {
    key = "test",
    loc_txt = {
        ['default'] = {
            name = 'RH Test Deck',
            text = {'Spawns whatever cards I wanna test.'}
        }
    },
    apply = function(self)
        G.E_MANAGER:add_event(Event({
            blockable = false,
            func = function()
                ease_dollars(400, true)

                local card_t = {
                    set = "Joker",
                    area = G.jokers,
                    key = "j_cavendish"
                }
                local card = SMODS.create_card(card_t)
                G.jokers:emplace(card)

                local card_t = {
                    set = "Joker",
                    area = G.jokers,
                    key = "j_cavendish"
                }
                local card = SMODS.create_card(card_t)
                G.jokers:emplace(card)

                local card_t = {
                    set = "Joker",
                    area = G.jokers,
                    key = "j_cavendish"
                }
                local card = SMODS.create_card(card_t)
                G.jokers:emplace(card)

                local card_t = {
                    set = "Joker",
                    area = G.jokers,
                    key = "j_cavendish"
                }
                local card = SMODS.create_card(card_t)
                G.jokers:emplace(card)

                local card_t = {
                    set = "Joker",
                    area = G.jokers,
                    key = "j_cavendish"
                }
                local card = SMODS.create_card(card_t)
                G.jokers:emplace(card)

                local card_t = {
                    set = "Flow",
                    area = G.consumeables,
                    key = "c_rh_debug"
                }
                local card = SMODS.create_card(card_t)
                G.consumeables:emplace(card)

                return true
            end
        }))
    end
}

SMODS.Consumable({
    key = "debug",
    set = 'Tarot',
    cost=3,
    atlas = 'consumables',
    pos = {
        x = 0,
        y = 0
    },
    loc_txt = {
        name = 'Flow Gauge',
        text = {
            "Flow Cards appear",
            "#1#x more frequently",
            "in the shop ",
        },
    },

    use = function(self, card, area, copier)
        local card_t = {
            set = "Flow",
            area = G.consumeables,
            key = "c_rh_debug"
        }
        local card = SMODS.create_card(card_t)
        G.consumeables:emplace(card)
        add_tag(Tag('tag_voucher'))
        add_tag(Tag('tag_voucher'))
        add_tag(Tag('tag_voucher'))
        add_tag(Tag('tag_voucher'))
        add_tag(Tag('tag_voucher'))
    end,

    can_use = function (self, card) 
        return G.consumeables.config.card_limit >= #G.consumeables.cards
    end
})