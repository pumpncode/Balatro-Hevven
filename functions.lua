-- Editing SMODS calculation method to account for simple tap
if SMODS and SMODS.calculate_individual_effect then
    local scie = SMODS.calculate_individual_effect
    function SMODS.calculate_individual_effect(effect, scored_card, key, amount, from_edition)
        if (key == 'chips' or key == 'h_chips' or key == 'chip_mod') and
            amount and
            G.GAME.current_round.simple_tap then
            -- scored_card then 
            local ret scie(effect, scored_card, "mult", amount, from_edition)
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

-- Adding function to patch for New Record
function rh_flow_check_for_new_record(amt)
    if not G.GAME.current_round.rh_flow_new_record then return end
    if not amt or type(amt) ~= 'number' then return end
    sendDebugMessage("Checking for score, "..G.GAME.round_scores['hand'].amt.." vs "..amt, "rhFlowNewRecord")
    if G.GAME.round_scores['hand'] and math.floor(amt) > G.GAME.round_scores['hand'].amt then
        G.GAME.current_round.rh_flow_new_record_tag = true
        sendDebugMessage("Delivering Rare Tag", "rhFlowNewRecord")
    end
end

function rh_flow_good_parts_save()
    if G.GAME.current_round.rh_flow_good_parts and
    G.GAME.chips/G.GAME.blind.chips >= 0.60 then
        local some_good_parts = pseudorandom(pseudoseed("some_good_parts"))
        if some_good_parts > G.GAME.probabilities.normal/G.GAME.current_round.rh_flow_good_parts_chances then
            return false        
        else
            return true
        end
    end
    return true
end

function rh_saved_run_text()
    if G.GAME.current_round.rh_flow_pity_skip then
        return localize('rh_skip_save')..G.GAME.current_round.rh_flow_pity_skip_host
    elseif G.GAME.current_round.rh_flow_good_parts then
        return localize('rh_good_parts_save')
    else
        return localize('ph_mr_bones')
    end
end

function rh_saved_run_money_text()
    if G.GAME.current_round.rh_flow_pity_skip then
        return ''
    elseif G.GAME.current_round.rh_flow_good_parts then
        return ''
    else
        return localize('$')..config.dollars
    end
end

function rh_saved_run_round_text()
    if G.GAME.current_round.rh_flow_pity_skip then
        return localize('rh_skip_cash_out')
    elseif G.GAME.current_round.rh_flow_good_parts then
        return localize('rh_good_parts_cash_out')
    else
        return localize('b_cash_out')..": "
    end
end