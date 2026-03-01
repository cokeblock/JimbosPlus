
SMODS.Joker{ --Eye of Joke
    key = "eyeofjoke",
    config = {
        extra = {
            rah = 1
        }
    },
    loc_txt = {
        ['name'] = 'Eye of Joke',
        ['text'] = {
            [1] = 'gains {X:red,C:white}X0.25{} Mult per {C:attention}flush{} played {C:inactive}(currently{} {X:red,C:white}X#1#{} {C:inactive}Mult){}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 5,
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
        
        return {vars = {card.ability.extra.rah}}
    end,
    
    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
            if next(context.poker_hands["Flush"]) then
                card.ability.extra.rah = (card.ability.extra.rah) + 0.25
                return {
                    Xmult = card.ability.extra.rah
                }
            end
        end
    end
}