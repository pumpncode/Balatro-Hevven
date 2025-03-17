SMODS.Atlas({
	key = "tags_flow",
	path = "tags.png",
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
    no_collection = false,
    discovered = true,
    atlas = "tags_flow",
    pos = {
        x = 4,
        y = 0
    },
    
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
    no_collection = false,
    discovered = true,
    atlas = "tags_flow",
    pos = {
        x = 5,
        y = 0
    },
	in_pool = function()
		return false
	end,
    apply = function(self, tag, context)
        sendDebugMessage("Tag calculating..."..inspect(context), "RhFlowYou")
        if context.type == "round_start_bonus" then
            G.hand:add_to_highlighted(G.GAME.current_round.you_card, false)
            G.GAME.current_round.you_card.ability.forced_selection = true
        elseif context.type == "eval" then
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

-- Skill Star
SMODS.Tag({
    key = "skill_star",
    loc_txt = {
        name = 'Skill Star',
        text = {
            "For every #1#% of required score",
            "exceeded, gain $#2#",
            "(Max of $#3#)"
        }
    },
    loc_vars = function(self, info_queue, card)
        return {
            vars= {
                G.GAME.current_round.skill_star.percentage,
                G.GAME.current_round.skill_star.base_money,
                G.GAME.current_round.skill_star.max_money
            }
        }
    end,
    no_collection = false,
    discovered = true,
    atlas = "tags_flow",
    pos = {
        x = 3,
        y = 0
    },
	in_pool = function()
		return false
	end,
    apply = function(self, tag, context)
        sendDebugMessage("Tag calculating..."..inspect(context), "RhFlowSkillStar")
        if context.type == "eval" then
            local percentage = ((G.GAME.chips/G.GAME.blind.chips)-1)*100
            local base_dollar = math.floor(percentage/G.GAME.current_round.skill_star.percentage*G.GAME.current_round.skill_star.base_money)
            if base_dollar > G.GAME.current_round.skill_star.max_money then
                base_dollar = G.GAME.current_round.skill_star.max_money
            end
            sendDebugMessage("Deleting tag!", "RhFlowSkillStar")
            tag:yep('+', G.C.GOLD, function() return true end)
			tag.triggered = true
            return {
                dollars = base_dollar,
                condition = "Got a Skill Star",
                pos = self.pos,
                tag = self
            }
		end
	end,
})

-- Simple Tap
SMODS.Tag({
    key = "simple_tap",
    loc_txt = {
        name = 'Simple Tap',
        text = {
            "Skip non-boss blind without cashing out",
            "{s:0.6}Have you been having difficulties with Monkey Watch?"
        }
    },
    no_collection = false,
    discovered = true,
    atlas = "tags_flow",
    pos = {
        x = 2,
        y = 0
    },
	in_pool = function()
		return false
	end,
    apply = function(self, tag, context)
		if context.type == "eval" then
            tag:yep("", G.C.SECONDARY_SET.FLOW, function() return true end)
			tag.triggered = true
            return true
		end
	end,
})

-- New Record
SMODS.Tag({
    key = "new_record",
    loc_txt = {
        name = 'New Record',
        text = {
            "If you get a new hand record for this run",
            "after using this card this round,",
            "create a {C:red}Rare Tag",
            "{C:inactive}(Current record: {C:red}#1#{C:inactive})"
        }
    },
    no_collection = false,
    discovered = true,
    atlas = "tags_flow",
    pos = {
        x = 1,
        y = 0
    },
	in_pool = function()
		return false
	end,
    apply = function(self, tag, context)
		if context.type == "eval" then
            tag:yep("", G.C.SECONDARY_SET.FLOW, function() return true end)
			tag.triggered = true
            return true
		end
	end,
})
