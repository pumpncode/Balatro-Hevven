-- Adding a beat anim to the main menu (juices up the card)
function rh_beat_anim(card)
    if BHevven.config.rh_beat_anim then
        local start_time = love.timer.getTime()
        local actual_time = love.timer.getTime()
        G.E_MANAGER:add_event(Event({
            blocking = false,
            blockable = false,
            func = function()
                if (love.timer.getTime() - start_time) / 0.556 > 1 then
                    start_time = love.timer.getTime()
                    card:juice_up(0.05, 0.05)
                end
                return false
            end
        }))
    end
end

-- Editing SMODS calculation method to account for simple tap
if SMODS and SMODS.calculate_individual_effect then
    local scie = SMODS.calculate_individual_effect
    function SMODS.calculate_individual_effect(effect, scored_card, key, amount, from_edition)
        if (key == 'chips' or key == 'h_chips' or key == 'chip_mod') and
            amount and
            G.GAME.current_round.rh_flow_simple_tap then
            -- scored_card then 
            local ret scie(effect, scored_card, "mult", amount, from_edition)
            if ret then
                return ret
            end
        elseif (key == 'xchips' or key == 'x_chips' or key == 'Xchip_mod') and
            amount and
            G.GAME.current_round.rh_flow_simple_tap then
            -- scored_card then 
            local ret scie(effect, scored_card, "xmult", amount, from_edition)
            if ret then
                return ret
            end
        else
            local ret = scie(effect, scored_card, key, amount, from_edition)
            if ret then
                return ret
            end
        end
    end
end

-- Editing SMODS score_card method to account for Call & Response
if SMODS and SMODS.score_card then
    local scc = SMODS.score_card
    function SMODS.score_card(card, context)
        if card.ability.name == 'm_rh_call_response' then
            sendDebugMessage("Calculating a Call & Response!".. type(context.cardarea), "rhScoreCard")
            local copiable = rh_seek_copiable(card.highlighted or false, card, context.cardarea.cards)
            if copiable then
                -- Keeping old values
                local old_ability = card.ability
                local old_base = card.base
                local old_config = card.config
                -- Setting it to the other card's
                card.ability = copiable.ability
                card.base = copiable.base
                card.config = copiable.config
                -- We calculate!
                local ret = scc(card, context)
                -- We set back 
                card.ability = old_ability
                card.base = old_base
                card.config = old_config
            else
                local ret = scc(card, context)
            end
            if ret then
                return ret
            end
        else
            local ret = scc(card, context)
            if ret then
                return ret
            end
        end
    end
end
-- Editing SMODS calculate_end_of_round_effects method to account for Call & Response
if SMODS and SMODS.calculate_end_of_round_effects then
    local sceore = SMODS.calculate_end_of_round_effects
    function SMODS.calculate_end_of_round_effects(context)
        local call_cards_abilities = {}
        local call_cards_base = {}
        local call_cards_config = {}
        local indexes = {}
        local replacement_cards = {}
        for i, card in ipairs(context.cardarea.cards) do
            if card.ability.name == 'm_rh_call_response' then
                -- Setting abilities to the other card's
                local copiable = rh_seek_copiable(card.highlighted or false, card, context.cardarea.cards)
                if copiable then
                    call_cards_abilities[#call_cards_abilities+1] = card.ability
                    call_cards_base[#call_cards_base+1] = card.base
                    call_cards_config[#call_cards_config+1] = card.config
                    indexes[#indexes+1] = i
                    -- Setting it to the other card's
                    context.cardarea.cards[i].ability = copiable.ability
                    context.cardarea.cards[i].base = copiable.base
                    context.cardarea.cards[i].config = copiable.config
                end
            end
        end
        sendDebugMessage(inspect(call_cards), "rhScoreEoR")
        -- We calculate...
        local ret = sceore(context)
        -- We reassign the right abilities
        for i, index in ipairs(indexes) do
            context.cardarea.cards[index].ability = call_cards_abilities[i]
            context.cardarea.cards[index].base = call_cards_base[i]
            context.cardarea.cards[index].config = call_cards_config[i]
        end
        if ret then
            return ret
        end
    end
end

-- Making a dummy to_big if it doesn't exist, Talisman compat
if not to_big then
    function to_big(number)
        return number
    end
end

-- Adding function to patch for New Record
function rh_flow_check_for_new_record(amt)
    if not G.GAME.current_round.rh_flow_new_record then return end
    sendDebugMessage(type(amt)..".", "rhNewRecord")
    if not amt then return end
    if type(amt) == 'number' or type(amt) == 'table' then
        if to_big(G.GAME.round_scores['hand']) and to_big(math.floor(amt)) > to_big(G.GAME.round_scores['hand'].amt) then
            G.GAME.current_round.rh_flow_new_record_tag = true
            sendDebugMessage("Delivering Rare Tag", "rhFlowNewRecord")
        end
    end
end

function rh_flow_good_parts_save()
    if G.GAME.current_round.rh_flow_good_parts then
        if to_big(G.GAME.chips) - to_big(G.GAME.blind.chips) >= to_big(0) then
            G.GAME.current_round.rh_flow_good_parts_saved = false
            return false
        elseif to_big(G.GAME.chips)/to_big(G.GAME.blind.chips) >= to_big(G.GAME.current_round.rh_flow_good_parts_percentage/100) then
            local some_good_parts = pseudorandom(pseudoseed("some_good_parts"))
            if some_good_parts > G.GAME.probabilities.normal/G.GAME.current_round.rh_flow_good_parts_chances then
                G.GAME.current_round.rh_flow_good_parts_saved = true
                SMODS.saved = rh_saved_run_text()
                return false        
            else
                return true
            end
        end
    end
    return true
end

function rh_saved_run_text()
    if G.GAME.current_round.rh_flow_pity_skip then
        return 'rh_skip_save'..G.GAME.current_round.rh_flow_pity_skip_host
    elseif G.GAME.current_round.rh_flow_good_parts_saved then
        return 'rh_good_parts_save'
    end
end

function rh_saved_run_money_text(dollars)
    if G.GAME.current_round.rh_flow_pity_skip then
        return ''
    elseif G.GAME.current_round.rh_flow_good_parts_saved then
        return ''
    else
        return localize('$')..dollars
    end
end

function rh_saved_run_round_text()
    if G.GAME.current_round.rh_flow_pity_skip then
        return localize('rh_skip_cash_out')
    elseif G.GAME.current_round.rh_flow_good_parts_saved then
        return localize('rh_good_parts_cash_out')
    else
        return localize('b_cash_out')..": "
    end
end

-- So that C&R works
function rh_sort_highlighted(cardarea)
    local sorted = {}
    for k, v in pairs(cardarea.cards) do
        for ki, vi in pairs(cardarea.highlighted) do
            if vi == v then
                table.insert(sorted, v)
            end
        end
    end
    return sorted
end