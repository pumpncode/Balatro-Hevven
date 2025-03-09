function inc_flow_count()
    if G.GAME.consumeable_usage_total.flow ~= nil then
        G.GAME.consumeable_usage_total.flow = G.GAME.consumeable_usage_total.flow + 1
    else
        G.GAME.consumeable_usage_total.flow = 1
    end
end

function poll_everything(seed)
    local upgrade_type = {
        is_enhancement = false,
        is_seal = false,
        is_edition = false,
        upgrade
    }
    local upgrade_chance = pseudorandom(pseudoseed(seed))
    if upgrade_chance > 0.50 then -- Add enhancement
        upgrade_type.is_enhancement = true
        -- upgrade_type.upgrade = poll_enhancements(seed)
        upgrade_type.upgrade = SMODS.poll_enhancement({guaranteed = true, type_key = seed})
    elseif upgrade_chance > 0.15 then -- Add seal
        upgrade_type.is_seal = true
        upgrade_type.upgrade = SMODS.poll_seal({guaranteed = true, type_key = seed})
    else -- Add Edition
        upgrade_type.is_edition = true
        upgrade_type.upgrade = poll_edition(seed, nil, true, true)
    end
    return upgrade_type
end

function Card:remove_edition()
    self.edition.chips = 0
    self.edition.holo = false
    self.edition.foil = false
    self.edition.polychrome = false
    self.edition.negative = false
    self.edition.type = ''
end

SMODS.load_file("Consumables.lua")()
SMODS.load_file("Flow.lua")()
SMODS.load_file("Jokers.lua")()
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
                    key = "j_crafty"
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
                    set = "Tarot",
                    area = G.consumeables,
                    key = "c_chariot"
                }
                local card = SMODS.create_card(card_t)
                G.consumeables:emplace(card)

                local card_t = {
                    set = "Flow",
                    area = G.consumeables,
                    key = "c_rh_new_record"
                }
                local card = SMODS.create_card(card_t)
                G.consumeables:emplace(card)

                return true
            end
        }))
    end
}
