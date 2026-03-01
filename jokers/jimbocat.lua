
SMODS.Joker{ --Jimbo & Cat
    key = "jimbocat",
    config = {
        extra = {
            xmult0 = 3,
            chips0 = 75,
            xmult = 2,
            chips = 45
        }
    },
    loc_txt = {
        ['name'] = 'Jimbo & Cat',
        ['text'] = {
            [1] = 'When money is {C:money}$9{} and below apply {X:red,C:white}X2{} Mult and {C:blue}+45{} Chips',
            [2] = 'When money is {C:money}$10{} and above apply {X:red,C:white}X3{} Mult and {C:blue}+75{} Chips'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 2,
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
    
    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
            if to_big(G.GAME.dollars) >= to_big(10) then
                return {
                    Xmult = 3,
                    extra = {
                        chips = 75,
                        colour = G.C.CHIPS
                    }
                }
            elseif to_big(G.GAME.dollars) <= to_big(9) then
                return {
                    Xmult = 2,
                    extra = {
                        chips = 45,
                        colour = G.C.CHIPS
                    }
                }
            end
        end
    end
}