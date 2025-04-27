
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
        
    end
})