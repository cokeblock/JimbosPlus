
SMODS.Joker{ --JimNo
    key = "jimno",
    config = {
        extra = {
            no = 1
        }
    },
    loc_txt = {
        ['name'] = 'JimNo',
        ['text'] = {
            [1] = 'gains {X:red,C:white}xmult{} the fewer remaining {C:attention}hands{} there are'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 4,
        y = 0
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 5,
    rarity = 2,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    pools = { ["jimbospl_jimbo_plus"] = true },
    
    loc_vars = function(self, info_queue, card)
        
        return {vars = {card.ability.extra.no}}
    end,
    
    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
            if to_big(G.GAME.current_round.hands_left) == to_big(3) then
                card.ability.extra.no = (card.ability.extra.no) + 1
                return {
                    Xmult = card.ability.extra.no
                }
            elseif to_big(G.GAME.current_round.hands_left) == to_big(2) then
                card.ability.extra.no = (card.ability.extra.no) + 2
                return {
                    Xmult = card.ability.extra.no
                }
            elseif to_big(G.GAME.current_round.hands_left) == to_big(1) then
                card.ability.extra.no = (card.ability.extra.no) + 3
                return {
                    Xmult = card.ability.extra.no
                }
            elseif to_big(G.GAME.current_round.hands_left) == to_big(0) then
                card.ability.extra.no = (card.ability.extra.no) + 4
                return {
                    Xmult = card.ability.extra.no
                }
            end
        end
        if context.after and context.cardarea == G.jokers  then
            return {
                func = function()
                    card.ability.extra.no = 1
                    return true
                end
            }
        end
    end
}