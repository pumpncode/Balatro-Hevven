SMODS.Atlas({
    key = "flow", 
    path = "placeholders.png", 
    px = 71,
    py = 95
})

SMODS.ConsumableType({
    key='Flow',
    primary_colour=HEX('FFFFFF'),
    secondary_colour=HEX('FFAFFB'),
    loc_txt = {
        name = 'Flow',
        collection = 'Flow Cards',

    },
    cards = {
        ["c_rh_try_again"] = true,
    }
})

SMODS.Consumable({
    key = "try_again",
    set = 'Flow',
    loc_txt = {
        name = 'Try Again',
        text = {
            "Discards and redraws",
            "your entire hand"
        }
    },
    atlas = 'flow',
    pos = {
        x = 0,
        y = 0
    },

    use = function(self, card, area, copier)
        while #G.hand.cards ~= 0 do
            sendDebugMessage("Amount of cards:"..#G.hand.cards, "debugRhTryAgain")
            local card = G.hand.cards[1]
            G.hand:add_to_highlighted(card, true)
            table.remove(G.hand.cards,1)
            G.FUNCS.discard_cards_from_highlighted(nil, true)
            G.hand:remove_from_highlighted(card, true)
        end
    end,


    can_use = function(self, card)
		return G.STATE == G.STATES.SELECTING_HAND
	end,
})