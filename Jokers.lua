SMODS.Atlas({
    key = "jokers", 
    path = "placeholders.png", 
    px = 71,
    py = 95
})

-- Widget (uncommon)
SMODS.Joker({
    key = "widget",
    loc_txt = {
        name = 'Widget',
        text = {
            "Retriggers {C:attention}5th {}played",
            "card of hand {C:attention}#1#{} times"
        }
    },
    cost = 4,
    rarity = 2,
    blueprint_compat = true,
    eternal_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'jokers',
	config = { extra = { retriggers = 2 }, soundSleep = -1, extraTime = 0 },

    calculate = function(self, card, context)
        if context.repetition and context.cardarea == G.play and context.other_card == context.scoring_hand[5] then
            card.ability.soundSleep = 0
            card.ability.extraTime = 0.5*G.SETTINGS.GAMESPEED
            sendDebugMessage("Started calculating with extra time at "..card.ability.extraTime, "RhDebugWidget")
            return {
                message = localize('k_again_ex'),
                repetitions = card.ability.extra.retriggers,
                card = card
            }
        end
    end,
    update = function(self, card, dt)
        if card.ability.soundSleep ~= -1 then
            card.ability.soundSleep = card.ability.soundSleep + dt
        end
        if card.ability.soundSleep >= 4.10+card.ability.extraTime then
            play_sound("rh_widget_piano", 2.0, 0.5)
            play_sound("rh_widget_piano", 1.0, 0.5)
            play_sound("rh_widget_launch", 1.0, 0.5)
            card.ability.soundSleep = -1
        end
    end
})

-- Rap Man (Rare)
SMODS.Joker({
    key = "rapman",
    loc_txt = {
        name = 'Rap Man',
        text = {
            "Retriggers {C:attention}5th {}played",
            "card of hand twice"
        }
    },
    cost = 4,
    rarity = 3,
    blueprint_compat = true,
    eternal_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'jokers',
    pos = {
        x = 1,
        y = 0
    },
	config = { extra = { retriggers = 1 } },

    calculate = function(self, card, context)
        if context.retrigger_joker_check and not context.retrigger_joker and context.other_card ~= self then
			if context.other_card == G.jokers.cards[1] then
				return {
                    message = localize('k_again_ex'),
					repetitions = card.ability.extra.retriggers,
					card = card,
				}
			else
				return nil, true
			end
		end
    end
})