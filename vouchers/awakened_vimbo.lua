
SMODS.Voucher {
    key = 'awakened_vimbo',
    pos = { x = 2, y = 0 },
    config = { 
        extra = {
            item_rate0 = 10
        } 
    },
    loc_txt = {
        name = 'Awakened Vimbo',
        text = {
            [1] = 'adds 10 weight to {C:rare}rare{} {C:attention}jokers{}'
        },
        unlock = {
            [1] = 'Unlocked by default.'
        }
    },
    cost = 10,
    unlocked = true,
    discovered = true,
    no_collection = false,
    can_repeat_soul = false,
    requires = {'v_vimbo'},
    atlas = 'CustomVouchers',
    
    soul_pos = {
        x = 3,
        y = 0
    }, redeem = function(self, card)
        return {
            
            G.E_MANAGER:add_event(Event({
                func = function()
                    G.GAME.rare_mod = G.GAME.rare_mod + 10               
                    return true
                end
            }))
        }
    end
}