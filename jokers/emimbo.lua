
SMODS.Joker{ --Emimbo
    key = "emimbo",
    config = {
        extra = {
            emo = 2,
            odds = 10
        }
    },
    loc_txt = {
        ['name'] = 'Emimbo',
        ['text'] = {
            [1] = '{C:green}1 in 10{} chance to kill itself when hand is played, if not add {C:red}+2{} Mult',
            [2] = '{C:inactive}(currently{} {C:red}+#1#{} {C:inactive}Mult){}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 0,
        y = 0
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 4,
    rarity = 1,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    pools = { ["jimbospl_jimbo_plus"] = true },
    
    loc_vars = function(self, info_queue, card)
        
        local new_numerator, new_denominator = SMODS.get_probability_vars(card, 1, card.ability.extra.odds, 'j_jimbospl_emimbo') 
        return {vars = {card.ability.extra.emo, new_numerator, new_denominator}}
    end,
    
    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
            if true then
                card.ability.extra.emo = (card.ability.extra.emo) + 2
                return {
                    mult = card.ability.extra.emo
                    ,
                    func = function()
                        if SMODS.pseudorandom_probability(card, 'group_0_6e59ae9b', 1, card.ability.extra.odds, 'j_jimbospl_emimbo', false) then
                            local target_joker = card
                            
                            if target_joker then
                                target_joker.getting_sliced = true
                                G.E_MANAGER:add_event(Event({
                                    func = function()
                                        target_joker:start_dissolve({G.C.RED}, nil, 1.6)
                                        return true
                                    end
                                }))
                                card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "Destroyed!", colour = G.C.RED})
                            end
                            
                        end
                        return true
                    end
                }
            end
        end
    end
}