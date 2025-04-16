SMODS.Atlas({
	key = "tags_flow",
	path = "tags.png",
	px = 34,
	py = 34,
})


-- Some Good Parts
SMODS.Tag({
    key = "some_good_parts",
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
                G.GAME and G.GAME.current_round.rh_flow_good_parts_percentage or 60,
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
        if context.type == "shop_start" then
            sendDebugMessage("Deleting tag!", "RhFlowYou")
            tag:yep("", G.C.SECONDARY_SET.FLOW, function() return true end)
			tag.triggered = true
            return true
		end
	end,
})

-- Skill Star
SMODS.Tag({
    key = "skill_star",
    loc_vars = function(self, info_queue, card)
        return {
            vars= {
                G.GAME.current_round.skill_star and G.GAME.current_round.skill_star.percentage or 5,
                G.GAME.current_round.skill_star and G.GAME.current_round.skill_star.base_money or 1,
                G.GAME.current_round.skill_star and G.GAME.current_round.skill_star.max_money or 40
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
            local percentage = ((to_big(G.GAME.chips)/to_big(G.GAME.blind.chips))-1)*100
            local base_dollar = to_big(math.floor(percentage/G.GAME.current_round.skill_star.percentage*G.GAME.current_round.skill_star.base_money))
            if base_dollar > to_big(G.GAME.current_round.skill_star.max_money) then
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
		if context.type == "shop_start" then
            tag:yep("", G.C.SECONDARY_SET.FLOW, function() return true end)
			tag.triggered = true
            return true
		end
	end,
})

-- New Record
SMODS.Tag({
    key = "new_record",
    no_collection = false,
    discovered = true,
    atlas = "tags_flow",
    pos = {
        x = 1,
        y = 0
    },
    loc_vars = function(self, info_queue, card)
        return {
            vars = {G.GAME.current_round.rh_flow_new_record_to_beat or 0}
        }
    end,
	in_pool = function()
		return false
	end,
    apply = function(self, tag, context)
		if context.type == "eval" then
                tag:yep("", G.C.SECONDARY_SET.FLOW, function() 
                    if G.GAME.current_round.rh_flow_new_record_tag then
                        add_tag(Tag('tag_rare'))
                        play_sound('generic1', 0.9 + math.random()*0.1, 0.8)
                        play_sound('holo1', 1.2 + math.random()*0.1, 0.4)
                    end 
                    return true
                end)
			tag.triggered = true
            -- return true
		end
	end,
})
