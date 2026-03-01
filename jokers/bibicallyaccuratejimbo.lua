
SMODS.Joker{ --Bibically Accurate Jimbo
    key = "bibicallyaccuratejimbo",
    config = {
        extra = {
            square = 1
        }
    },
    loc_txt = {
        ['name'] = 'Bibically Accurate Jimbo',
        ['text'] = {
            [1] = 'if played hand has exactly {C:attention}4 cards{} give {X:red,C:white}X0.44{} Mult',
            [2] = '{C:inactive}(currently{} {X:red,C:white}X#1#{} {C:inactive}Mult){}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 3,
        y = 1
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
        
        return {vars = {card.ability.extra.square}}
    end,
    
    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
            if to_big(#context.scoring_hand) == to_big(4) then
                card.ability.extra.square = (card.ability.extra.square) + 0.44
                return {
                    Xmult = card.ability.extra.square
                }
            end
        end
    end
}