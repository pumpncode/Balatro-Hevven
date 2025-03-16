SMODS.Atlas({
	key = "tags_flow",
	path = "tags_flow.png",
	px = 34,
	py = 34,
})


-- Some Good Parts
SMODS.Tag({
    key = "some_good_parts",
    loc_txt = {
        name = 'Some Good Parts',
        text = {
            "Prevents Death if chips scored are at least 60% of required chips",
            "{C:green}#1# in #2#{} chances"
        }
    },
    no_collection = true,
    atlas = "tags_flow",
    
    loc_vars = function(self, info_queue, card)
        return {
            vars= {
                G.GAME and G.GAME.probabilities.normal or 1,
                G.GAME and G.GAME.current_round.rh_flow_good_parts_chances or 8
            }
        }
    end,
	in_pool = function()
		return false
	end,
    apply = function(self, tag, context)
        sendDebugMessage("Tag calculating..."..inspect(context), "RhFlowSomeGoodParts")
		if context.type == "shop_start" then
            sendDebugMessage("Deleting tag!", "RhFlowSomeGoodParts")
            tag:yep("", G.C.SECONDARY_SET.FLOW, function() return true end)
			tag.triggered = true
            return true
		end
	end,
})

-- You
SMODS.Tag({
    key = "you",
    loc_txt = {
        name = 'You',
        text = {
            "Marks a selected card as You.",
            "For the round, this card will",
            "always be selected and played",
            "in every hand"
        }
    },
    no_collection = true,
    atlas = "tags_flow",
	in_pool = function()
		return false
	end,
    apply = function(self, tag, context)
        if context.type == "round_start_bonus" then
            G.hand:add_to_highlighted(G.GAME.current_round.you_card, false)
            G.GAME.current_round.you_card.ability.forced_selection = true
        elseif context.type == "shop_start" then
            sendDebugMessage("Deleting tag!", "RhFlowYou")
            G.GAME.current_round.you_card:remove_sticker("rh_you_sticker")
            G.GAME.current_round.you_card.you = false
            G.GAME.current_round.you_card = nil
            tag:yep("", G.C.SECONDARY_SET.FLOW, function() return true end)
			tag.triggered = true
            return true
		end
	end,
})

