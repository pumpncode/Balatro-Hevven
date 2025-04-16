return {
    descriptions = {
        Joker = {
            j_rh_widget = {
                name = 'Bidule',
                text = {
                    "Déclenche à nouveau la {C:attention}cinquième {}carte",
                    "jouée pour marquer des points",
                    "{C:attention}#1#{} fois supplémentaires",
                }
            },
            j_rh_onion = {
                name = 'Oignon poilu',
                text = {
                    "Lors de la défausse,",
                    "pioche {C:attention}#1#{} carte(s) supplémentaire"
                }
            },
            j_rh_sneaky_spirit = {
                name = "Esprit espiègle",
                text = {
                    "Après {C:attention}2{} manches,",
                    "vendez cette carte pour",
                    "ajouter {C:dark_edition}Négatif{} à un Joker aléatoire",
                    "{C:inactive}(Actuellement {C:attention}#1#{C:inactive}/2)",
                }
            },
            j_rh_samurai_drummer = {
                name = "Samouraï Tom",
                text = {
                    "Jetons {C:blue}+#1#{} par",
                    "carte {C:rh_flow}Rythme{} utilisée",
                    "{C:inactive}(Actuellement {C:blue}+#2#{C:inactive})",
                }
            },
            j_rh_goat = {
                name = "Chèvre",
                text = {
                    "Gagnez une somme aléatoire à la fin de la manche",
                    "{C:inactive}({C:money}#1# $ {C:inactive}/ {C:money}#2# $ {C:inactive}/ {C:money}#3# ${C:inactive})",
                }
            },
            j_rh_monkey = {
                name = "Singe",
                text = {
                    "Déclenche à nouveau {C:attention}toutes{} les cartes"
                }
            },
            j_rh_lockstep = {
                name = 'Double Face',
                text = {
                    "Les cartes jouées",
                    "de valeur {C:attention}#1#{} octroient",
                    "{C:chips}+#2#{} jetons, {C:mult}+#3#{} Multi. lorsque ces cartes marquent des points,",
                    "la parité change",
                    "à la fin de la manche",
                }
            },
            j_rh_munchy_monk = {
                name = 'Avide ascète',
                text = {
                    "{C:blue}+#1#{} Jetons par",
                    "carte {C:rh_flow}Rythme{} utilisée,  {C:red}+#2#{} Multi. ",
                    "par carte de {C:tarot}Tarot{} utilisée, et",
                    "{X:mult,C:white} X#3# {} Multi. chaque fois",
                    "qu'une carte {C:planet}Planète{} est utilisée",
                    "{C:inactive}(Actuellement : {C:blue}+#4#{} Jetons, {C:red}+#5#{} Multi., {X:mult,C:white} X#6# {C:inactive} Multi.)",
                }
            },
            j_rh_cosmic_girl = {
                name = 'Meneuse cosmique',
                text = {
                    "Ce Joker octroie {C:mult}+#1#{} Multi.",
                    "si la main jouée contient",
                    "1 {C:attention}#2#{} de {C:hearts}Cœurs{} ou de {C:diamonds}Carreaux{}",
                    "{C:inactive}(Actuellement : {C:red}+#3#{C:inactive} Multi.)",
                }
            },
            j_rh_space_gramp = {
                name = "Géronte de l'espace",
                text = {
                    "Ce Joker octroie {C:mult}+#1#{} Multi.",
                    "si la main jouée contient",
                    "1 {C:attention}#2#{} de {C:spades}Piques{} ou de {C:clubs}Trèfles{}",
                    "{C:inactive}(Actuellement : {C:red}+#3#{C:inactive} Multi.)",
                }
            }
        },
        Flow = {
            c_rh_you = {
                name = 'Vous',
                text = {
                    "Marque la carte sélectionnée avec {C:dark_edition}Vous{}",
                    "Pour la manche, cette carte sera",
                    "toujours sélectionnée et jouée",
                    "à chaque main"
                }
            },
            c_rh_try_again = {
                name = 'Essayez encore...',
                text = {
                    "Défausse et repioche",
                    "toute votre main"
                }
            },
            c_rh_ok = {
                name = 'OK',
                text = {
                    "Défausse et repioche",
                    "toute votre main, à l'exception",
                    "des cartes sélectionnées"
                }
            },
            c_rh_superb = {
                name = 'Super',
                text = {
                    "Améliore les cartes sélectionnées,",
                    "joue les cartes, et défausse",
                    "le reste de votre main"
                }
            },
            c_rh_perfect = {
                name = 'Parfait',
                text = {
                    "Ecrase l'effet des cartes sélectionnées,",
                    "les joue,",
                    "puis détruit toutes les cartes en main",
                    "{s:0.6,C:green}#1# chance(s) sur #2# {s:0.6,C:inactive} de supprimer l'effet,",
                    "{s:0.6,C:inactive}sinon ajoute {s:0.6,C:dark_edition}Brillant{s:0.6,C:inactive}, {s:0.6,C:dark_edition}Holographique{s:0.6,C:inactive}, ou {s:0.6,C:dark_edition}Polychrome"
                }
            },
            c_rh_simple_tap = {
                name = 'Tactile',
                text = {
                    "Pour la prochaine manche,",
                    "les améliorations, effets,",
                    "et Jokers",
                    "affectant les {C:blue}Jetons{}",
                    "vont affecter le {C:red}Multi.{} à la place"
                }
            },
            c_rh_new_record = {
                name = 'Nouveau Record',
                text = {
                    "Si vous faites un nouveau record de main",
                    "pour cette partie,",
                    "créé un {C:red}Badge Rare",
                    "{C:inactive}(Record actuel: {C:red}#1#{C:inactive})"
                }
            },
            c_rh_pity_skip = {
                name = 'Passe',
                text = {
                    "Passe les blindes non boss sans encaisser",
                    "{s:0.6,C:dark_edition}Avez vous des difficultés avec Singe moins le quart?"
                }
            },
            c_rh_some_good_parts = {
                name = 'Des Bons Passages',
                text = {
                    "Empêche la mort",
                    "si les Jetons marqués",
                    "constituent au minimum {C:attention}#1#%",
                    "des Jetons nécessaires.",
                    "{C:green}#2# chances sur #3#"
                }
            },
            c_rh_extra_life = {
                name = 'Vie Supplémentaire',
                text = {
                    "{C:blue}+#1# main#2#{}, {C:red}+#3# défausse#4#{}"
                }
            },
            c_rh_skill_star = {
                name = 'Etoile Talent',
                text = {
                    "Pour chaque {C:attention}#1#%",
                    "du score requis",
                    "dépassé, gagnez {C:money}#2# ${}",
                    "{C:inactive}({C:money}#3# ${C:inactive} au maximum)"
                }
            },
        },
        Tag = {
            tag_rh_some_good_parts = {
                name = 'Des Bons Passages',
                text = {
                    "Empêche la mort",
                    "si les Jetons marqués",
                    "constituent au minimum {C:attention}#1#%",
                    "des Jetons nécessaires.",
                    "{C:green}#2# chances sur #3#"
                }
            },
            tag_rh_you = {
                name = 'Vous',
                text = {
                    "Marque la carte sélectionnée avec {C:dark_edition}Vous{}",
                    "Pour la manche, cette carte sera",
                    "toujours sélectionnée et jouée",
                    "à chaque main"
                }
            },
            tag_rh_skill_star = {
                name = 'Etoile Talent',
                text = {
                    "Pour chaque {C:attention}#1#%",
                    "du score requis",
                    "dépassé, gagnez {C:money}#2# ${}",
                    "{C:inactive}({C:money}$#3#{C:inactive} au maximum)"
                }
            },
            tag_rh_simple_tap = {
                name = 'Tactile',
                text = {
                    "Pour la prochaine manche,",
                    "les améliorations, effets,",
                    "et Jokers",
                    "affectant les {C:blue}Jetons{}",
                    "vont affecter le {C:red}Multi.{} à la place"
                }
            },
            tag_rh_new_record = {
                name = 'Nouveau Record',
                text = {
                    "Si vous faites un nouveau record de main",
                    "pour cette partie,",
                    "créé un {C:red}Badge Rare",
                    "{C:inactive}(Record actuel: {C:red}#1#{C:inactive})"
                }
            },
        },
        Planet = {
            c_rh_hevven_world = {
                name = 'Paradis du Rythme',
                text = {
                    "Améliore {C:attention}#1#{} mains",
                    "de poker au hasard",
                    "{C:attention}#2#{} fois"
                }                
            }
        },
        Spectral = {
            c_rh_remix = {
                name = 'Remix',
                text = {
                    "Ecrase toutes les cartes en main",
                    "avec une {C:dark_edition}amélioration{}, {C:dark_edition}Sceau{} et {C:dark_edition}édition{},",
                    "puis les joue toutes"
                }
            }
        },
        Tarot = {
            c_rh_castle = {
                name = 'Le Château',
                text = {
                    "Créé une carte {C:rh_flow}Rythme{} au hasard",
                    "{C:inactive}(Selon la place disponible)",
                }
            },
            c_rh_trio = {
                name = 'Le Trio',
                text = {
                    "Créé une carte de {C:tarot}Tarot{} , {C:planet}Planète{}",
                    "et {C:rh_flow}Rythme{} aléatoire",
                    "{C:inactive}(Selon la place disponible)",
                }
            },
        },
        Voucher = {
            v_rh_flow_gauge = {
                name = 'Jauge de Rythme',
                text = {
                    "Les cartes {C:rh_flow}Rythme{} apparaissent",
                    "{C:attention}#1#X{} plus fréquemment",
                    "dans le magasin",
                },
            },
            v_rh_flow_master = {
                name = 'Maître du Rythme',
                text = {
                    "Les cartes {C:rh_flow}Rythme{} apparaissent",
                    "{C:attention}#1#X{} plus fréquemment",
                    "dans le magasin",
                },
            },
            v_rh_shopkeeper_deal = {
                name = "Les affaires du commerçant",
                text = {
                    "Les cartes {C:rh_flow}Rythme{} peuvent",
                    "apparaître dans n'importe quel",
                    "{C:attention}Paquet Arcana",
                },
            },
            v_rh_gatekeeper_deal = {
                name = "Les affaires du gardien",
                text = {
                    "Des {C:rh_flow}Paquets Rythme{}",
                    "peuvent apparaître",
                    "dans le magasin",
                },
            },
        },
        Other = {
            rh_you_sticker = {
                name = 'Vous',
                text = {
                    "Cette carte sera toujours sélectionnée",
                    "et jouée dans toutes les mains"
                },
            },
            p_rh_flow_pack_1 = {
                name = "Paquet Rythmé",
                text = {
                    "Choisissez {C:attention}#1#{} parmi",
                    "{C:attention}#2# cartes {C:rh_flow}Rythme{}",
                },
            },
            p_rh_flow_pack_2 = {
                name = "Paquet Rythmé",
                text = {
                    "Choisissez {C:attention}#1#{} parmi",
                    "{C:attention}#2# cartes {C:rh_flow}Rythme{}",
                },
            },
            p_rh_flow_jumbo = {
                name = "Paquet Jumbo Rythmé",
                text = {
                    "Choisissez {C:attention}#1#{} parmi",
                    "{C:attention}#2# cartes {C:rh_flow}Rythme{}",
                },
            },
            p_rh_flow_mega = {
                name = "Paquet Méga-Rythmé",
                text = {
                    "Choisissez {C:attention}#1#{} parmi",
                    "{C:attention}#2# cartes {C:rh_flow}Rythme{}",
                },
            },
            active_flow = {
                name="Carte Rythme (Active)",
                text={
                    "Seulement {C:attention}1{} peut être",
                    "activée par manche",
                },
            }
        }
    },
    misc = {
        dictionary = {
            rh_skip_save = "Passé par ",
            rh_skip_cash_out = "Manche passée!",
            rh_good_parts_save = "Il y a des bons passages...",
            rh_good_parts_cash_out = "Manche passée!",
            rh_pity_skip_host_barista = "le patron", 
            rh_pity_skip_host_rupert = "Naja",
            rh_even = "paire", 
            rh_odd = "impaire", 
            k_rh_flow_pack = "Paquet Rythmé",
            k_flow = "Rythme",
            b_flow_cards = "Cartes Rythme",
        },
        v_dictionary = {
            a_mmoonk = {"+#1# Jetons,+#2# Mult,X#3# Mult"},
        },
        labels = {
            rh_you_sticker = 'VOUS'
        }
    }
}