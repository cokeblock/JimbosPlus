
SMODS.Joker{ --Tired Joker
    key = "tiredjoker",
    config = {
        extra = {
            btr = 1
        }
    },
    loc_txt = {
        ['name'] = 'Tired Joker',
        ['text'] = {
            [1] = 'played {C:attention}high cards{} add 0.1 to all probabilities {C:inactive}(currently{} {C:red}#1#{}{C:inactive}){}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 7,
        y = 0
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 6,
    rarity = 3,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    pools = { ["jimbospl_jimbo_plus"] = true },
    
    loc_vars = function(self, info_queue, card)
        
        return {vars = {card.ability.extra.btr}}
    end,
    
    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
            if next(context.poker_hands["High Card"]) then
                card.ability.extra.btr = (card.ability.extra.btr) + 0.1
            end
        end
        if context.mod_probability  then
            local numerator, denominator = context.numerator, context.denominator
            numerator = numerator + (card.ability.extra.btr)
            return {
                numerator = numerator, 
                denominator = denominator
            }
        end
    end
}