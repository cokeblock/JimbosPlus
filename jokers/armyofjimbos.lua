
SMODS.Joker{ --Army of Jimbos
    key = "armyofjimbos",
    config = {
        extra = {
        }
    },
    loc_txt = {
        ['name'] = 'Army of Jimbos',
        ['text'] = {
            [1] = 'creates a {C:attention}joker{} when hand is played'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 7,
        y = 1
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
    
    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
            local created_joker = true
            G.E_MANAGER:add_event(Event({
                func = function()
                    local joker_card = SMODS.add_card({ set = 'Joker', key = 'j_joker' })
                    if joker_card then
                        
                        
                    end
                    
                    return true
                end
            }))
            return {
                message = created_joker and localize('k_plus_joker') or nil
            }
        end
    end
}