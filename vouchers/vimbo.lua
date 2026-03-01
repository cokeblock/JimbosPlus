
SMODS.Voucher {
    key = 'vimbo',
    pos = { x = 0, y = 0 },
    config = { 
        extra = {
            item_rate0 = 10
        } 
    },
    loc_txt = {
        name = 'Vimbo',
        text = {
            [1] = 'adds 10 weight to {C:uncommon}uncommon{} {C:attention}jokers{}'
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
    atlas = 'CustomVouchers',
    
    soul_pos = {
        x = 1,
        y = 0
    }, redeem = function(self, card)
        return {
            
            G.E_MANAGER:add_event(Event({
                func = function()
                    G.GAME.uncommon_mod = G.GAME.uncommon_mod + 10               
                    return true
                end
            }))
        }
    end
}