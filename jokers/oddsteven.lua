
SMODS.Joker{ --Odd Steven
    key = "oddsteven",
    config = {
        extra = {
            ode = 1,
            chips0 = 31,
            mult0 = 4,
            xmult0 = 1.25
        }
    },
    loc_txt = {
        ['name'] = 'Odd Steven',
        ['text'] = {
            [1] = 'scored {C:blue}odd{} cards give {C:blue}+31{} Chips, scored {C:red}even{} cards give {C:red}+4{} Mult',
            [2] = 'and scored {C:attention}face{} cards give {X:red,C:white}X1.25{} Mult'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 1,
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
        
        return {vars = {card.ability.extra.ode}}
    end,
    
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play  then
            if (function()
                local count = 0
                for _, playing_card in pairs(context.scoring_hand or {}) do
                    if (playing_card:get_id() == 14 or playing_card:get_id() == 3 or playing_card:get_id() == 5 or playing_card:get_id() == 7 or playing_card:get_id() == 9) then
                        count = count + 1
                    end
                end
                return count == #context.scoring_hand
            end)() then
                return {
                    chips = 31
                }
            elseif (function()
                local count = 0
                for _, playing_card in pairs(context.scoring_hand or {}) do
                    if (playing_card:get_id() == 2 or playing_card:get_id() == 4 or playing_card:get_id() == 6 or playing_card:get_id() == 8 or playing_card:get_id() == 10) then
                        count = count + 1
                    end
                end
                return count == #context.scoring_hand
            end)() then
                return {
                    mult = 4
                }
            elseif (function()
                local count = 0
                for _, playing_card in pairs(context.scoring_hand or {}) do
                    if playing_card:is_face() then
                        count = count + 1
                    end
                end
                return count == #context.scoring_hand
            end)() then
                return {
                    Xmult = 1.25
                }
            end
        end
    end
}