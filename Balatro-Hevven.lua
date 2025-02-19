SMODS.load_file("Consumables.lua")()
SMODS.load_file("Flow.lua")()
SMODS.load_file("Jokers.lua")()
SMODS.load_file("Sounds.lua")()

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
                local card_t = {
                    set = "Tarot",
                    area = G.consumeables,
                    key = "c_rh_trio"
                }
                local card = SMODS.create_card(card_t)
                G.consumeables:emplace(card)
                return true
            end
        }))
    end
}

