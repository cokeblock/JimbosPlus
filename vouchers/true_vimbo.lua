
SMODS.Voucher {
    key = 'true_vimbo',
    pos = { x = 4, y = 0 },
    config = { 
        extra = {
            item_rate0 = 10
        } 
    },
    loc_txt = {
        name = 'True Vimbo',
        text = {
            [1] = 'adds 10 weight to {C:legendary}legendary{} {C:attention}jokers{}'
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
    requires = {'v_awakened_vimbo'},
    atlas = 'CustomVouchers',
    
    soul_pos = {
        x = 5,
        y = 0
    }, redeem = function(self, card)
        return {
            
            G.E_MANAGER:add_event(Event({
                func = function()
                    G.GAME.legendary_mod = G.GAME.legendary_mod + 10               
                    return true
                end
            }))
        }
    end
}