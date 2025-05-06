
-- You (Sticker)
SMODS.Sticker({
    key="you_sticker",
    badge_colour=G.C.BLACK,
    atlas='stickers',
    default_compat=true,
    rate=0,
    calculate = function(self, card, context)
        if context.end_of_round then
            for k, v in pairs(G.playing_cards) do
                if v.ability["rh_you_sticker"] then 
                    sendDebugMessage("Removing sticker["..k.."]", "rhFlowSticker")
                    v:remove_sticker("rh_you_sticker")
                end
            end
        end
        
    end,
	credit = {
        art = "missingnumber",
        code = "TheAltDoc",
		concept = "TheAltDoc"
    }
})

-- Remix
SMODS.Sticker({
    key="remix_sticker",
    badge_colour=HEX('CD00CD'),
    atlas='stickers',
    default_compat=true,
    rate=0,
    pos={x=1,y=0},
    loc_vars = function(self, info_queue, card)
        if card.config.center.set == 'Joker' then
            return {
                vars = {
                    localize("rh_remix_sticker_joker_word"),
                    localize("rh_remix_sticker_joker_link"),
                    localize("rh_remix_sticker_joker_rarity"),
                }
            }
        else
            return {
                vars = {
                    localize("rh_remix_sticker_consumeable_word"),
                    localize("rh_remix_sticker_consumeable_link"),
                    localize("rh_remix_sticker_consumeable_type"),
                }
            }
        end
    end,
    calculate = function(self, card, context)
        if context.end_of_round and context.main_eval then
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.15,
                func = function() 
                    card:flip()
                    play_sound('card1')
                    card:juice_up(0.3, 0.3)
                    return true 
                end 
            }))   
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.1,
                func = function() 
                    local card_info = card.config.center
                    local remixed_config = {set = card_info.set, stickers = card_info.stickers, skip_materialize = false}
                    if card_info.rarity then
                        if card_info.rarity == 1 then
                            remixed_config.rarity = 0.6
                        elseif card_info.rarity == 2 then
                            remixed_config.rarity = 0.8
                        elseif card_info.rarity == 3 then
                            remixed_config.rarity = 1
                        elseif card_info.rarity == 4 then
                            remixed_config.legendary = true
                        else
                            remixed_config.rarity = card_info.rarity
                        end
                    end
                    if card.edition then
                        remixed_config.edition = card.edition.key
                    else 
                        remixed_config.no_edition = true
                    end
                    local remixed = rh_create_card_silent(remixed_config)
                    local pos = remixed.T
                    pos.x = 1000
                    pos.y = 1000
                    pos.w = 0
                    pos.h = 0
                    remixed.T = pos
                    remixed.CT = pos
                    remixed.VT = pos
                    while G.GAME.blind.boss and remixed.ability.name == "Chicot" do
                        sendDebugMessage("Rolled into Chicot during a boss blind!", "rhRemixSticker")
                        remixed:start_dissolve(nil,true)
                        remixed = rh_create_card_silent(remixed_config)
                        sendDebugMessage("Rolled "..remixed.ability.name, "rhRemixSticker")
                        pos = remixed.T
                        pos.x = 1000
                        pos.y = 1000
                        pos.w = 0
                        pos.h = 0
                        remixed.T = pos
                        remixed.CT = pos
                        remixed.VT = pos
                    end
                    rh_copy_card(remixed, card)
                    remixed:start_dissolve(nil,true)
                    return true 
                end 
            }))        
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.15,
                func = function() 
                    card:flip()
                    play_sound('tarot2', 1, 0.6)
                    card:juice_up(0.3, 0.3)
                    return true 
                end 
            }))
        end
    end,
	credit = {
        art = "missingnumber",
        code = "TheAltDoc",
		concept = "TheAltDoc"
    }
})