return {
    descriptions = {
        Joker = {
            j_rh_widget = {
                name = 'Widget',
                text = {
                    "Retrigger {C:attention}5th{} played",
                    "card used in scoring",
                    "{C:attention}#1#{} additional times",
                }
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
                    "After {C:attention}#2#{} rounds,",
                    "sell this card to",
                    "add {C:dark_edition}Negative{} to a random Joker",
                    "{C:inactive}(Currently {C:attention}#1#{C:inactive}/#2#)"
                }
            },
            j_rh_samurai_drummer = {
                name = "Samurai Drummer",
                text = {
                    "{C:blue}+#1#{} Chips per {C:rh_flow}Flow{}",
                    "card used this run",
                    "{C:inactive}(Currently {C:chips}+#2#{C:inactive})",
                }
            },
            j_rh_goat = {
                name = "Goat",
                text = {
                    "Earn a random payout at end of round",
                    "{C:inactive}({C:money}$#1# {C:inactive}/ {C:money}$#2# {C:inactive}/ {C:money}$#3#{C:inactive})",
                }
            },
            j_rh_monkey = {
                name = "Monkey",
                text = {
                    "Retrigger {C:attention}each{} played card"
                }
            },
            j_rh_lockstep = {
                name = 'Double Sided',
                text = {
                    "Played cards with",
                    "{C:attention}#1#{} rank give",
                    "{C:chips}+#2#{} chips, {C:mult}+#3#{} mult when scored,",
                    "parity changes",
                    "at end of round",
                }
            },
            j_rh_munchy_monk = {
                name = 'Munchy Monk',
                text = {
                    "This Joker gains {C:blue}+#1#{} Chips per",
                    "{C:rh_flow}Flow{} card used this run,  {C:red}+#2#{} Mult ",
                    "per {C:tarot}Tarot{} card used this run, and",
                    "{X:mult,C:white} X#3# {} Mult every time a {C:planet}Planet{} card is used",
                    "{C:inactive}(Currently {C:blue}+#4#{} Chips, {C:red}+#5#{} Mult, {X:mult,C:white} X#6# {C:inactive} Mult)",
                }
            },
            j_rh_cosmic_girl = {
                name = 'Cosmic Girl',
                text = {
                    "This Joker gains {C:mult}+#1#{} Mult",
                    "if played hand contains",
                    "a {C:hearts}Hearts{} or {C:diamonds}Diamonds{} {C:attention}#2#{}",
                    "{C:inactive}(Currently {C:red}+#3#{C:inactive} Mult)",
                }
            },
            j_rh_space_gramp = {
                name = 'Space Gramps',
                text = {
                    "This Joker gains {C:mult}+#1#{} Mult",
                    "if played hand contains",
                    "a {C:spades}Spades{} or {C:clubs}Clubs{} {C:attention}#2#{}",
                    "{C:inactive}(Currently {C:red}+#3#{C:inactive} Mult)",
                }
            },
            j_rh_songbird_egg = {
                name = 'Songbird Egg',
                text = {
                    "{C:mult}+#1#{} Mult",
                    "Hatches after using",
                    "#3# {C:rh_flow}Flow Cards",
                    "{C:inactive}(Currently {C:attention}#2#{C:inactive}/#3#)"
                }
            },
            j_rh_songbird_bird = {
                name = 'Songbird',
                text = {
                    "{X:mult,C:white}x#1#{} Mult",
                }
            },
            j_rh_lumbearjack = {
                name = 'Lumbearjack',
                text = {
                    "If {C:attention}first hand{} of round",
                    "has only {C:attention}1{} card,",
                    "destroy it and add",
                    "#1# copies of {C:attention}half",
                    "its rank to deck",
                    "and draw it to {C:attention}hand",
                }
            },
            j_rh_tibby = {
                name = 'Tibby',
                text = {
                    "If {C:attention}first hand{} of round",
                    "has only {C:attention}1{} card,",
                    "give it an {C:enhanced}enhancement{},",
                    "{C:attention}seal{}, or {C:dark_edition}edition{},",
                    "depending on what it has",
                }
            },
        },
        Flow = {
            c_rh_you = {
                name = 'You',
                text = {
                    "Marks a selected card as {C:dark_edition}You{}",
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
                    "Selected card has been marked as {C:dark_edition}You{}",
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
            tag_rh_random = {
                name = 'Random Pack Tag',
                text = {
                    "Gives a free",
                    "{C:attention}random Pack",
                }
            },
            tag_rh_mega_flow = {
                name="Rhythm Tag",
                text={
                    "Gives a free",
                    "{C:rh_flow}Jumbo Flow Pack",
                },
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
                    "All cards in hand gets overwritten",
                    "into an {C:dark_edition}enhancement{}, {C:dark_edition}seal{} and {C:dark_edition}edition{},",
                    "then plays them all"
                }
            },
            c_rh_ascension = {
                name = 'Ascension',
                text = {
                    "{C:green}#1# in #2#{} chance to",
                    "add {C:dark_edition}Polychrome{} to a",
                    "random {C:attention}Joker{},",
                    "otherwise destroys it"
                }
            },
            c_rh_anguish = {
                name = 'Anguish',
                text = {
                    "Convert the rightmost",
                    "{C:attention}Joker{} into",
                    "the leftmost {C:attention}Joker{},",
                    "+#1# ante"
                }
            },
            c_rh_endless = {
                name = 'Endless',
                text = {
                    "{C:attention}Duplicate{} a random Joker,",
                    "and make both of them {C:attention}eternal",
                    "{C:inactive}(Must have room)",
                    "{C:inactive,s:0.9}(Removes {C:dark_edition,s:0.9}Negative{C:inactive,s:0.9} from copy)",
                }
            },
            c_rh_imperfection = {
                name = 'Imperfection',
                text = {
                    "Adds {C:dark_edition}Negative{} to",
                    "{C:attention}#1# random card,",
                    "and enhances it",
                    "into a {C:attention}Stone Card"
                }
            },
        },
        Tarot = {
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
                    "Creates a random {C:tarot}Tarot{}, {C:planet}Planet{}",
                    "and {C:rh_flow}Flow{} card",
                    "{C:inactive}(Must have room)",
                }
            },
            c_rh_performer = {
                name = 'The Performer',
                text = {
                    "Gives a",
                    "{C:attention}Random Pack Tag",
                }
            },
            c_rh_translator = {
                name = 'The Translator',
                text={
                    "Enhances {C:attention}#1#{} selected",
                    "card into a",
                    "{C:attention}Call & Response",
                    "Card",
                },
            },
        },
        Voucher = {
            v_rh_flow_gauge = {
                name = 'Flow Gauge',
                text = {
                    "{C:rh_flow}Flow{} cards appear",
                    "{C:attention}#1#X{} more frequently",
                    "in the shop ",
                },
            },
            v_rh_flow_master = {
                name = 'Flow Master',
                text = {
                    "{C:rh_flow}Flow{} cards appear",
                    "{C:attention}#1#X{} more frequently",
                    "in the shop ",
                },
            },
            v_rh_shopkeeper_deal = {
                name = "Shopkeeper's Deals",
                text = {
                    "{C:rh_flow}Flow{} cards may",
                    "appear in any of",
                    "the {C:attention}Arcana Packs",
                },
            },
            v_rh_gatekeeper_deal = {
                name = "Gatekeeper's Deals",
                text = {
                    "{C:rh_flow}Flow Packs{}",
                    "can appear",
                    "in the shop ",
                },
            },
        },
        Enhanced = {
            m_rh_call_response = {
                name = 'Call & Response',
                text = {
                    'Copies the {C:attention}rank{},',
                    '{C:attention}suit{} and {C:attention}enhancement',
                    'of the card',
                    'on the left' 
                }
            }
        },
        Other = {
            rh_you_sticker = {
                name = 'You',
                text = {
                    "This card will always be {C:attention}selected",
                    "and {C:attention}played{} in {C:attention}every{} hand",
                    "{C:inactive,s:0.9}({C:attention,s:0.9}Sticker{C:inactive,s:0.9} is removed at",
                    "{C:inactive,s:0.9}the end of the round)"
                },
            },
            rh_remix_sticker = {
                name = 'Remix',
                text = {
                    "At end of round, transform",
                    "into another {C:attention}#1#",
                    "#2# {C:attention}#3#",
                },
            },
            p_rh_flow_pack_1 = {
                name = "Flow Pack",
                text = {
                    "Choose {C:attention}#1#{} of",
                    "up to {C:rh_flow}#2# Flow Cards{}",
                },
            },
            p_rh_flow_pack_2 = {
                name = "Flow Pack",
                text = {
                    "Choose {C:attention}#1#{} of",
                    "up to {C:rh_flow}#2# Flow Cards{}",
                },
            },
            p_rh_flow_jumbo = {
                name = "Jumbo Flow Pack",
                text = {
                    "Choose {C:attention}#1#{} of",
                    "up to {C:rh_flow}#2# Flow Cards{}",
                },
            },
            p_rh_flow_mega = {
                name = "Mega Flow Pack",
                text = {
                    "Choose {C:attention}#1#{} of",
                    "up to {C:rh_flow}#2# Flow Cards{}",
                },
            },
            p_rh_legendary = {
                name = "Legendary Buffoon Pack",
                text = {
                    "Choose {C:attention}#1#{} of up to",
                    "{C:attention}#2# {C:legendary,E:1}Legendary{} Joker cards",
                },
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
            rh_skip_save_barista = "Skipped by Barista",
            rh_skip_save_rupert = "Skipped by Rupert",
            rh_skip_cash_out = "Round cleared!",
            rh_good_parts_save = "There were some good parts!",
            rh_good_parts_cash_out = "Round cleared!",
            rh_even = "even", 
            rh_odd = "odd", 
            k_rh_flow_pack = "Flow Pack",
            k_rh_legendary = "Legendary Buffoon Pack",
            k_flow = "Flow",
            b_flow_cards = "Flow Cards",
            rh_language = "Language",
            rh_language_desc = {
                "In which language will",
                "the sfx be played",
                "Note: If the sfx didn't",
                "get translated in that language,",
                "it will default to English."
            },
            rh_language_options = {
                "English",
                "Japanese",
                "French (incomplete)",
                "Spanish (incomplete)"
            },
            rh_beat_anim = "Main Menu Beat Anim",
            rh_beat_anim_desc = {
                "Enables the beat animation",
                "for the card on the title screen",
                "(Requires a restart)"
            },
            rh_remix_sticker_consumeable_word = "consumable",
            rh_remix_sticker_consumeable_link = "of the same",
            rh_remix_sticker_consumeable_type = "type",
            rh_remix_sticker_joker_word = "Joker",
            rh_remix_sticker_joker_link = "of the same",
            rh_remix_sticker_joker_rarity = "rarity",
            rh_lumbearjack_axed = "Axed!",
            k_rh_endless = "Endless Remix",
            k_rh_tibby = "Let's we go!"
        },
        v_dictionary = {
            a_mmoonk = {"+#1# Chips,+#2# Mult,X#3# Mult"},
        },
        v_text={
            ch_c_all_rental={
                "All Jokers are {C:eternal}Rental{}",
            },
            ch_c_no_skip={
                "You are unable to {C:attention}skip",
            },
            ch_c_all_boss={
                "All Blinds are {C:attention}Boss Blinds{}",
            },
        },
		challenge_names = {
			c_rh_second_contact = "Second Contact",
			c_rh_saffron_trial = "Saffron's Trial",
			c_rh_remix_medley = "Remix Medley", -- References the Megamix Challenge Train of the same name
			c_rh_remix_10 = "Remix 10",
		},
        labels = {
            rh_you_sticker = 'YOU',
            rh_remix_sticker = "Remix"
        }
    }
}