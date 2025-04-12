return {
    descriptions = {
        Joker = {
            j_rh_widget = {
                
            },
            j_rh_onion = {
                name = 'Hairy Onion',
                text = {
                    "On discard, draw {C:attention}#1#{} extra card(s)"
                }
            },
            j_rh_sneaky_spirit = {
                name = "Sneaky Spirit",
                text = {
                    "After {C:attention}2{} rounds,",
                    "sell this card to add {C:dark_edition}Negative{}",
                    "to a random Joker",
                    "{C:inactive}#1#/2{}"
                }
            },
            j_rh_samurai_drummer = {
                name = "Samurai Drummer",
                text = {
                    "This Joker gains {C:blue}+#1#{} Chips every time a",
                    "{C:rh_flow}Flow{} card is used.",
                    "{C:inactive}(Currently {C:blue}+#2#{} Chips)"
                }
            }
        },
        Flow = {
            c_rh_you = {
                name = 'You',
                text = {
                    "Marks a selected card as {C:dark_edition}You{}",
                    "For the round, this card will",
                    "always be selected and played",
                    "in every hand"
                }
            },
            c_rh_try_again = {
                name = 'Try Again',
                text = {
                    "Discards and redraws",
                    "your entire hand"
                }
            },
            c_rh_ok = {
                name = 'OK',
                text = {
                    "Discards and redraws",
                    "your entire hand, save for",
                    "selected cards"
                }
            },
            c_rh_superb = {
                name = 'Superb',
                text = {
                    "Enhances selected cards,",
                    "plays them, and discards",
                    "the rest of your hand"
                }
            },
            c_rh_perfect = {
                name = 'Perfect',
                text = {
                    "Overwrite the edition of",
                    "and play the selected cards,",
                    "then destroy all cards held in hand",
                    "{s:0.6,C:green}#1# in #2# {s:0.6,C:inactive}chances to blank out the edition,",
                    "{s:0.6,C:inactive}otherwise adds {s:0.6,C:dark_edition}Foil{s:0.6,C:inactive}, {s:0.6,C:dark_edition}Holographic{s:0.6,C:inactive}, or {s:0.6,C:dark_edition}Polychrome"
                }
            },
            c_rh_simple_tap = {
                name = 'Simple Tap',
                text = {
                    "For the next round,",
                    "enhancements, editions,",
                    "and Jokers",
                    "affecting {C:blue}Chips{}",
                    "will affect {C:red}Mult{} instead"
                }
            },
            c_rh_new_record = {
                name = 'New Record',
                text = {
                    "If you get a new hand record for this run",
                    "after using this card this round,",
                    "create a {C:red}Rare Tag",
                    "{C:inactive}(Current record: {C:red}#1#{C:inactive})"
                }
            },
            c_rh_pity_skip = {
                name = 'Pity Skip',
                text = {
                    "Skip non-boss blind without cashing out",
                    "{s:0.6,C:dark_edition}Have you been having difficulties with Monkey Watch?"
                }
            },
            c_rh_some_good_parts = {
                name = 'Some Good Parts',
                text = {
                    "Prevents Death",
                    "if chips scored",
                    "are at least {C:attention}#1#%",
                    "of required chips",
                    "{C:green}#2# in #3#{} chances"
                }
            },
            c_rh_extra_life = {
                name = 'Extra Life',
                text = {
                    "{C:blue}+#1# hand#2#{}, {C:red}+#3# discard#4#{}"
                }
            },
            c_rh_skill_star = {
                name = 'Skill Star',
                text = {
                    "For every {C:attention}#1#%",
                    "of required score",
                    "exceeded, gain {C:money}$#2#{}",
                    "{C:inactive}(Max of {C:money}$#3#{C:inactive})"
                }
            },
        },
        Tag = {
            tag_rh_some_good_parts = {
                name = 'Some Good Parts',
                text = {
                    "Prevents Death",
                    "if chips scored",
                    "are at least {C:attention}#1#%",
                    "of required chips",
                    "{C:green}#2# in #3#{} chances"
                }
            },
            tag_rh_you = {
                name = 'You',
                text = {
                    "Marks a selected card as {C:dark_edition}You{}.",
                    "For the round, this card will",
                    "always be selected and played",
                    "in every hand"
                }
            },
            tag_rh_skill_star = {
                name = 'Skill Star',
                text = {
                    "For every {C:attention}#1#%",
                    "of required score",
                    "exceeded, gain {C:money}$#2#{}",
                    "{C:inactive}(Max of {C:money}$#3#{C:inactive})"
                }
            },
            tag_rh_simple_tap = {
                name = 'Simple Tap',
                text = {
                    "For the next round,",
                    "enhancements, editions,",
                    "and Jokers",
                    "affecting {C:blue}Chips{}",
                    "will affect {C:red}Mult{} instead"
                }
            },
            tag_rh_new_record = {
                name = 'New Record',
                text = {
                    "If you get a new hand record for this run",
                    "after using this card this round,",
                    "create a {C:red}Rare Tag",
                    "{C:inactive}(Current record: {C:red}#1#{C:inactive})"
                }
            },
        },
        Planet = {
            c_rh_hevven_world = {
                name = 'Rhythm Hevven',
                text = {
                    "Upgrade {C:attention}#1#{} random",
                    "poker hands {C:attention}#2#{} times"
                }                
            }
        },
        Spectral = {
            c_rh_remix = {
                name = 'Remix',
                text = {
                    "All suits transform into an",
                    "{C:dark_edition}enhancement, {C:dark_edition}seal{} or {C:dark_edition}edition{},",
                    "destroys all jokers,",
                    "{C:red}-1{} Joker slot"
                }
            }
        },
        Tarot = {
            c_rh_translator = {
                name = 'The Translator',
                text = {
                    "Add {C:dark_edition}Negative{} to a random",
                    "card in your hand"
                }
            },
            c_rh_castle = {
                name = 'The Castle',
                text = {
                    "Creates a random {C:rh_flow}Flow{} card",
                    "{C:inactive}(Must have room)",
                }
            },
            c_rh_trio = {
                name = 'The Trio',
                text = {
                    "Creates a random {C:planet}Planet{}, {C:tarot}Tarot{}",
                    "and {C:rh_flow}Flow{} card",
                    "{C:inactive}(Must have room)",
                }
            },
        },
        Other = {
            rh_you_sticker = {
                name = 'You',
                text = {
                    "This card will always be selected",
                    "and played in every hand"
                },
                label = 'YOU',
            },
            active_flow = {
                name="Flow Card (Active)",
                text={
                    "Only {C:attention}1{} active",
                    "per round",
                },
            }
        }
    },
    misc = {
        dictionary = {
            rh_skip_save = "Skipped by ",
            rh_skip_cash_out = "Round cleared!",
            rh_good_parts_save = "There were some good parts!",
            rh_good_parts_cash_out = "Round cleared!",
            rh_pity_skip_host_barista = "Barista", 
            rh_pity_skip_host_rupert = "Rupert",
            rh_even = "even", 
            rh_odd = "odd", 
            k_rh_flow_pack = "Flow Pack"
        },
        v_dictionary = {
            a_mmoonk = {"+#1# Chips,+#2# Mult,X#3# Mult"},
        }
    }
}