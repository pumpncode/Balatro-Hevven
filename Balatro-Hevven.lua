SMODS.load_file("Functions.lua")()

SMODS.load_file("Consumables.lua")()
SMODS.load_file("Flow.lua")()
SMODS.load_file("Tags.lua")()
-- SMODS.load_file("Jokers.lua")()
SMODS.load_file("Sounds.lua")()

--Localization colors
local lc = loc_colour
function loc_colour(_c, _default)
	if not G.ARGS.LOC_COLOURS then
		lc()
	end
	G.ARGS.LOC_COLOURS.rh_flow = G.C.SECONDARY_SET.Flow
	return lc(_c, _default)
end

-- SMODS.Back {
--     key = "test",
--     loc_txt = {
--         ['default'] = {
--             name = 'RH Test Deck',
--             text = {'Spawns whatever cards I wanna test.'}
--         }
--     },
--     apply = function(self)
--         G.E_MANAGER:add_event(Event({
--             blockable = false,
--             func = function()

--                 local card_t = {
--                     set = "Joker",
--                     area = G.jokers,
--                     key = "j_crafty"
--                 }
--                 local card = SMODS.create_card(card_t)
--                 G.jokers:emplace(card)

--                 local card_t = {
--                     set = "Joker",
--                     area = G.jokers,
--                     key = "j_cavendish"
--                 }
--                 local card = SMODS.create_card(card_t)
--                 G.jokers:emplace(card)

--                 local card_t = {
--                     set = "Planet",
--                     area = G.consumeables,
--                     key = "c_rh_hevven_world"
--                 }
--                 local card = SMODS.create_card(card_t)
--                 G.consumeables:emplace(card)

--                 return true
--             end
--         }))
--     end
-- }
