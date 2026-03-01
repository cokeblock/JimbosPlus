
SMODS.Joker{ --Jim
    key = "jim",
    config = {
        extra = {
            xmult0 = 9,
            xchips0 = 5
        }
    },
    loc_txt = {
        ['name'] = 'Jim',
        ['text'] = {
            [1] = 'first scored card gives {X:blue,C:white}X9{} Chips and {X:red,C:white}X5{} Mult'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 8,
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
    
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play  then
            if context.other_card == context.scoring_hand[1] then
                return {
                    Xmult = 9,
                    extra = {
                        x_chips = 5,
                        colour = G.C.DARK_EDITION
                    }
                }
            end
        end
    end
}