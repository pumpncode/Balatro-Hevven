-- Trio
SMODS.Consumable({
    key = "trio",
    set = 'Tarot',
    cost=3,
    atlas = 'consumables',
    pos = {
        x = 0,
        y = 0
    },

    use = function(self, card, area, copier)
        -- Tarot
        G.E_MANAGER:add_event(Event({trigger = 'after', delay = 0.4, func = function()
            if G.consumeables.config.card_limit > #G.consumeables.cards then
                play_sound('timpani')
                local card_t = {
                    set = "Tarot",
                    area = G.consumeables
                }
                local new_card = SMODS.create_card(card_t)
                new_card:add_to_deck()
                G.consumeables:emplace(new_card)
                card:juice_up(0.3, 0.5)
            end
            return true 
        end }))

        --Planet
        G.E_MANAGER:add_event(Event({trigger = 'after', delay = 0.4, func = function()
            if G.consumeables.config.card_limit > #G.consumeables.cards then
                play_sound('timpani')
                local card_t = {
                    set = "Planet",
                    area = G.consumeables
                }
                local new_card = SMODS.create_card(card_t)
                new_card:add_to_deck()
                G.consumeables:emplace(new_card)
                card:juice_up(0.3, 0.5)
            end
            return true 
        end }))

        --Flow
        G.E_MANAGER:add_event(Event({trigger = 'after', delay = 0.4, func = function()
            if G.consumeables.config.card_limit > #G.consumeables.cards then
                local card_t = {
                    set = "Flow",
                    area = G.consumeables
                }
                local new_card = SMODS.create_card(card_t)
                new_card:add_to_deck()
                G.consumeables:emplace(new_card)
                card:juice_up(0.3, 0.5)
            end
            return true 
        end }))
    end,

    can_use = function (self, card) 
        return G.consumeables.config.card_limit >= #G.consumeables.cards
    end
})

-- Castle
SMODS.Consumable({
    key = "castle",
    set = 'Tarot',
    cost=3,
    atlas = 'consumables',
    pos = {
        x = 1,
        y = 0
    },

    use = function(self, card, area, copier)
        --Flow
        G.E_MANAGER:add_event(Event({trigger = 'after', delay = 0.4, func = function()
            if G.consumeables.config.card_limit > #G.consumeables.cards then
                local card_t = {
                    set = "Flow",
                    area = G.consumeables
                }
                local new_card = SMODS.create_card(card_t)
                new_card:add_to_deck()
                G.consumeables:emplace(new_card)
                card:juice_up(0.3, 0.5)
            end
            return true 
        end }))
    end,

    can_use = function (self, card) 
        return G.consumeables.config.card_limit >= #G.consumeables.cards
    end
})

-- Hevven World
SMODS.Consumable({
    key = "hevven_world",
    set = 'Planet',
    cost=3,
    loc_vars = function(self, info_queue, card)
        return {
            vars= {
                card.ability.extra.hands,
                card.ability.extra.times,
            }
        }
    end,
    config = {extra = {hands=3,times=2}},
    atlas = 'consumables',
    pos = {
        x = 0,
        y = 2
    },

    use = function(self, card, area, copier)
        for i = 1, card.ability.extra.hands do
            local hand = poll_poker_hand({}, "hevven", false)
            update_hand_text(
                { sound = "button", volume = 0.7, pitch = 0.8, delay = 0.3 },
                {
                    handname = localize(hand, "poker_hands"),
                    chips = G.GAME.hands[hand].chips*card.ability.extra.times,
                    mult = G.GAME.hands[hand].mult*card.ability.extra.times,
                    level = G.GAME.hands[hand].level+card.ability.extra.times,
                }
            )
            level_up_hand(card, hand, nil, card.ability.extra.times)
        end
        update_hand_text(
			{ sound = "button", volume = 0.7, pitch = 1.1, delay = 0 },
			{ mult = 0, chips = 0, handname = "", level = "" }
		)
	end,

    can_use = function (self, card)
		return true
	end,
})

-- Ascension
SMODS.Consumable({
    key = "ascension",
    set = 'Spectral',
    cost=4,
    atlas = 'consumables',
    pos = {
        x = 3,
        y = 1
    },
    config = {extra = {base_chance=1, max_chance=4}},
        loc_vars = function(self, info_queue, card)
                    return {
                        vars = {
                            card.ability.extra.base_chance* G.GAME.probabilities.normal,
                            card.ability.extra.max_chance,
                        }
                    }
        end,

    use = function(self, card, area, copier)
        -- Creating Joker pool and selecting a Joker
        self.eligible_editionless_jokers = EMPTY(self.eligible_editionless_jokers)
        for k, v in pairs(G.jokers.cards) do
            if v.ability.set == 'Joker' and (not v.edition) then
                table.insert(self.eligible_editionless_jokers, v)
            end
        end
        local eligible_card = pseudorandom_element(self.eligible_editionless_jokers, pseudoseed("ascension"))

        local chance = pseudorandom(pseudoseed('ascension'), 1, card.ability.extra.max_chance)
        if chance > card.ability.extra.base_chance* G.GAME.probabilities.normal then
            -- Destroy Joker!
            if not eligible_card.ability.eternal then
                G.E_MANAGER:add_event(Event({trigger = 'after', delay = 0.4, func = function()
                    eligible_card:start_dissolve(nil, nil)
                    card:juice_up(0.3, 0.5)
                return true end }))
            end
        else
            -- Add Polychrome!
            G.E_MANAGER:add_event(Event({trigger = 'after', delay = 0.4, func = function()
                eligible_card:set_edition({polychrome = true}, true)
                card:juice_up(0.3, 0.5)
            return true end }))
        end
    end,

    can_use = function (self, card) 
        for k, v in pairs(G.jokers.cards) do
            if v.ability.set == 'Joker' and (not v.edition) then
                return true
            end
        end
        return false
    end
})

-- Anguish
SMODS.Consumable({
    key = "anguish",
    set = 'Spectral',
    cost=4,
    atlas = 'consumables',
    pos = {
        x = 1,
        y = 1
    },
    config = {extra = {antes=1}},
        loc_vars = function(self, info_queue, card)
                    return {
                        vars = {
                            card.ability.extra.antes
                        }
                    }
        end,

    use = function(self, card, area, copier)
        local rightmost = G.jokers.cards[#G.jokers.cards]
        G.E_MANAGER:add_event(Event({
            trigger = "after",
            delay = 0.4,
            func = function()
                play_sound("tarot1")
                card:juice_up(0.3, 0.5)
                return true
            end,
        }))
        G.E_MANAGER:add_event(Event({
            trigger = "after",
            delay = 0.15,
            func = function()
                rightmost:flip()
                play_sound("card1", percent)
                rightmost:juice_up(0.3, 0.3)
                return true
            end,
        }))
        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.1,
            func = function()
                copy_card(G.jokers.cards[1], rightmost)
                return true
            end
        }))
        delay(0.2)
        G.E_MANAGER:add_event(Event({
            trigger = "after",
            delay = 0.15,
            func = function()
                rightmost:flip()
                play_sound("tarot2", percent)
                rightmost:juice_up(0.3, 0.3)
                return true
            end,
        }))
        ease_ante(card.ability.extra.antes)
    end,

    can_use = function (self, card) 
        return #G.jokers.cards > 1
    end
})

-- Endless
SMODS.Consumable({
    key = "endless",
    set = 'Spectral',
    cost=4,
    atlas = 'consumables',
    pos = {
        x = 2,
        y = 1
    },

    use = function(self, card, area, copier)
        card_eval_status_text(card, 'extra', nil, nil, nil, {message = localize('k_duplicated_ex')})
        local chosen_joker = pseudorandom_element(G.jokers.cards, pseudoseed('endless'))
        local card = copy_card(chosen_joker, nil, nil, nil, chosen_joker.edition and chosen_joker.edition.negative)
        card:add_sticker("eternal", true)
        card:add_to_deck()
        G.jokers:emplace(card)
    end,

    can_use = function (self, card) 
        return #G.jokers.cards > 0
    end
})

-- Performer
SMODS.Consumable({
    key = "performer",
    set = 'Tarot',
    cost= 3,
    atlas = 'consumables',
    pos = {
        x = 3,
        y = 0
    },

    use = function(self, card, area, copier)
        add_tag(Tag('tag_rh_random'))
        play_sound('generic1', 0.9 + math.random()*0.1, 0.8)
        play_sound('holo1', 1.2 + math.random()*0.1, 0.4)
    end,

    can_use = function (self, card) 
        return true
    end
})