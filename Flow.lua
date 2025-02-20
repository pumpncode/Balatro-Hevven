SMODS.Atlas({
    key = "flow", 
    path = "flow.png", 
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
        x = 1,
        y = 0
    },

    use = function(self, card, area, copier)
        local to_discard = {}
        for k, v in ipairs(G.hand.cards) do
                to_discard[#to_discard+1] = v
        end
        for k, v in ipairs(to_discard) do
            G.hand:add_to_highlighted(v, true)
            G.FUNCS.discard_cards_from_highlighted(nil, true)
            G.hand:remove_from_highlighted(v, true)
        end
    end,

    can_use = function(self, card)
		return G.STATE == G.STATES.SELECTING_HAND
	end,

    rh_credits = {
        idea = {
            "patataofcourse"
        },
        code = {
            "TheAlternateDoctor"
        }
    }
})

SMODS.Consumable({
    key = "ok",
    set = 'Flow',
    loc_txt = {
        name = 'OK',
        text = {
            "Discards and redraws",
            "your entire hand, save for",
            "selected cards"
        }
    },
    atlas = 'flow',
    pos = {
        x = 2,
        y = 0
    },

    use = function(self, card, area, copier)        
        local to_discard = {}
        local highlighted_cards = {}
        for k, v in ipairs(G.hand.cards) do
            if v.highlighted ==false then
                to_discard[#to_discard+1] = v
            else 
                highlighted_cards[#highlighted_cards+1] = v
            end
        end
        for k, v in ipairs(highlighted_cards) do
            G.hand:remove_from_highlighted(v, true)
        end
        for k, v in ipairs(to_discard) do
            G.hand:add_to_highlighted(v, true)
            G.FUNCS.discard_cards_from_highlighted(nil, true)
            G.hand:remove_from_highlighted(v, true)
        end
        G.FUNCS.draw_from_deck_to_hand(#to_discard)
    end,

    can_use = function(self, card)
		return G.STATE == G.STATES.SELECTING_HAND and #G.hand.highlighted > 0
	end,

    rh_credits = {
        idea = {
            "patataofcourse"
        },
        code = {
            "TheAlternateDoctor"
        }
    }
})