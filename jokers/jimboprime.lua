
SMODS.Joker{ --Jimbo Prime
    key = "jimboprime",
    config = {
        extra = {
            prime = 1
        }
    },
    loc_txt = {
        ['name'] = 'Jimbo Prime',
        ['text'] = {
            [1] = 'gains {X:red,C:white}X0.5{} Mult per {C:attention}joker{} bought',
            [2] = '{C:inactive}(currently{} {X:red,C:white}X#1#{} {C:inactive}Mult){}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 3,
        y = 0
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 20,
    rarity = 4,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    pools = { ["jimbospl_jimbospl_jokers"] = true },
    in_pool = function(self, args)
        return (
            not args 
            or args.source ~= 'sho' 
            or args.source == 'buf' or args.source == 'jud' or args.source == 'rif' or args.source == 'rta' or args.source == 'sou' or args.source == 'uta' or args.source == 'wra'
        )
        and true
    end,
    
    loc_vars = function(self, info_queue, card)
        
        return {vars = {card.ability.extra.prime}}
    end,
    
    calculate = function(self, card, context)
        if context.buying_card  then
            return {
                func = function()
                    card.ability.extra.prime = (card.ability.extra.prime) + 0.5
                    return true
                end
            }
        end
        if context.cardarea == G.jokers and context.joker_main  then
            return {
                Xmult = card.ability.extra.prime
            }
        end
    end
}