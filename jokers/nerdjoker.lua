
SMODS.Joker{ --Nerd Joker
    key = "nerdjoker",
    config = {
        extra = {
            xmult0 = 3.14
        }
    },
    loc_txt = {
        ['name'] = 'Nerd Joker',
        ['text'] = {
            [1] = 'gives {X:red,C:white}X3.14{} Mult when {C:attention}#1#{} is played'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 0,
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
        
        return {vars = {localize((G.GAME.current_round.nerd_hand or 'High Card'), 'poker_hands')}}
    end,
    
    set_ability = function(self, card, initial)
        G.GAME.current_round.nerd_hand = 'High Card'
    end,
    
    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
            if context.scoring_name == G.GAME.current_round.nerd_hand then
                return {
                    Xmult = 3.14
                }
            end
        end
        if context.end_of_round and context.game_over == false and context.main_eval  then
            local nerd_hands = {}
            for handname, _ in pairs(G.GAME.hands) do
                if G.GAME.hands[handname].visible then
                    nerd_hands[#nerd_hands + 1] = handname
                end
            end
            if nerd_hands[1] then
                G.GAME.current_round.nerd_hand = pseudorandom_element(nerd_hands, pseudoseed('nerd' .. G.GAME.round_resets.ante))
            end
        end
    end
}