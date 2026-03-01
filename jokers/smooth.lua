
SMODS.Joker{ --Smooth
    key = "smooth",
    config = {
        extra = {
            xmult0 = 4
        }
    },
    loc_txt = {
        ['name'] = 'Smooth',
        ['text'] = {
            [1] = '{X:red,C:white}X4{} Mult'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 8,
        y = 1
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
            return {
                Xmult = 4
            }
        end
    end
}