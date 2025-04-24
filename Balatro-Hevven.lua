
BHevven = SMODS.current_mod

--config
-- SMODS.current_mod.config_tab = function()
--     return {n = G.UIT.ROOT, config = {align = "cm"}, nodes = {
--         create_option_cycle({
--             label = "Language",
--             scale = 0.8,
--             w = 6,
--             options = {"English", "Japanese", "French"},
--             ref_value = 'language',
--             ref_table = BHevven.config,
--             })
    
--     }}
-- end

SMODS.load_file("misc/Functions.lua")()

SMODS.load_file("misc/Atlases.lua")()
SMODS.load_file("misc/Sounds.lua")()

SMODS.load_file("items/Consumables.lua")()
SMODS.load_file("items/Flow.lua")()
SMODS.load_file("items/Tags.lua")()
SMODS.load_file("items/Vouchers.lua")()
SMODS.load_file("items/Boosters.lua")()
SMODS.load_file("items/Jokers.lua")()
SMODS.load_file("items/Misc.lua")()

-- SMODS.load_file("Debug.lua")()

-- Icon!
SMODS.Atlas({
    key = "modicon",
    path = "icon.png",
    px = 34,
    py = 34
})

--Localization colors
local lc = loc_colour
function loc_colour(_c, _default)
	if not G.ARGS.LOC_COLOURS then
		lc()
	end
	G.ARGS.LOC_COLOURS.rh_flow = G.C.SECONDARY_SET.Flow
	return lc(_c, _default)
end

-- function BHevven.rh_update_language(args)
    -- if args.to_val == "English" then
    --     BHevven.language = "en"
    -- elseif args.to_val == "French" then
    --     BHevven.language = "fr"
    -- elseif args.to_val == "Japanese" then
    --     BHevven.language = "jp"
    -- end
    -- SMODS.save_mod_config(args)
-- end
