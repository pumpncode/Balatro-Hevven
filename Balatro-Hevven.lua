function inc_flow_count()
    if G.GAME.consumeable_usage_total.flow ~= nil then
        G.GAME.consumeable_usage_total.flow = G.GAME.consumeable_usage_total.flow + 1
    else
        G.GAME.consumeable_usage_total.flow = 1
    end
end

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
                    set = "Joker",
                    area = G.jokers,
                    key = "j_rh_cosmic_girl"
                }
                local card = SMODS.create_card(card_t)
                G.jokers:emplace(card)
                local card_t = {
                    set = "Joker",
                    area = G.jokers,
                    key = "j_rh_munchy_monk"
                }
                local card = SMODS.create_card(card_t)
                G.jokers:emplace(card)
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
