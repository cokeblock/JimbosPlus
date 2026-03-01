SMODS.Atlas({
    key = "modicon", 
    path = "ModIcon.png", 
    px = 34,
    py = 34,
    atlas_table = "ASSET_ATLAS"
})

SMODS.Atlas({
    key = "balatro", 
    path = "balatro.png", 
    px = 333,
    py = 216,
    prefix_config = { key = false },
    atlas_table = "ASSET_ATLAS"
})


SMODS.Atlas({
    key = "CustomJokers", 
    path = "CustomJokers.png", 
    px = 71,
    py = 95, 
    atlas_table = "ASSET_ATLAS"
})

SMODS.Atlas({
    key = "CustomVouchers", 
    path = "CustomVouchers.png", 
    px = 71,
    py = 95, 
    atlas_table = "ASSET_ATLAS"
})

local NFS = require("nativefs")
to_big = to_big or function(a) return a end
lenient_bignum = lenient_bignum or function(a) return a end

local jokerIndexList = {5,17,11,13,15,6,18,20,10,12,16,14,9,2,7,8,3,1,19,4}

local function load_jokers_folder()
    local mod_path = SMODS.current_mod.path
    local jokers_path = mod_path .. "/jokers"
    local files = NFS.getDirectoryItemsInfo(jokers_path)
    for i = 1, #jokerIndexList do
        local file_name = files[jokerIndexList[i]].name
        if file_name:sub(-4) == ".lua" then
            assert(SMODS.load_file("jokers/" .. file_name))()
        end
    end
end


local voucherIndexList = {3,1,2}

local function load_vouchers_folder()
    local mod_path = SMODS.current_mod.path
    local vouchers_path = mod_path .. "/vouchers"
    local files = NFS.getDirectoryItemsInfo(vouchers_path)
    for i = 1, #voucherIndexList do
        local file_name = files[voucherIndexList[i]].name
        if file_name:sub(-4) == ".lua" then
            assert(SMODS.load_file("vouchers/" .. file_name))()
        end
    end
end

load_jokers_folder()
load_vouchers_folder()
SMODS.ObjectType({
    key = "jimbospl_food",
    cards = {
        ["j_gros_michel"] = true,
        ["j_egg"] = true,
        ["j_ice_cream"] = true,
        ["j_cavendish"] = true,
        ["j_turtle_bean"] = true,
        ["j_diet_cola"] = true,
        ["j_popcorn"] = true,
        ["j_ramen"] = true,
        ["j_selzer"] = true
    },
})

SMODS.ObjectType({
    key = "jimbospl_jimbo_plus",
    cards = {
        ["j_jimbospl_armyofjimbos"] = true,
        ["j_jimbospl_bibicallyaccuratejimbo"] = true,
        ["j_jimbospl_blenderjoker"] = true,
        ["j_jimbospl_distantmemory"] = true,
        ["j_jimbospl_emimbo"] = true,
        ["j_jimbospl_eyeofjoke"] = true,
        ["j_jimbospl_imprintedjoker"] = true,
        ["j_jimbospl_jamble"] = true,
        ["j_jimbospl_jim"] = true,
        ["j_jimbospl_jimbocat"] = true,
        ["j_jimbospl_jimbones"] = true,
        ["j_jimbospl_jimno"] = true,
        ["j_jimbospl_nerdjoker"] = true,
        ["j_jimbospl_oddsteven"] = true,
        ["j_jimbospl_onebo"] = true,
        ["j_jimbospl_smooth"] = true,
        ["j_jimbospl_tiredjoker"] = true
    },
})

SMODS.ObjectType({
    key = "jimbospl_jimbospl_jokers",
    cards = {
        ["j_jimbospl_ihaveajokeforyou"] = true,
        ["j_jimbospl_jimboprime"] = true,
        ["j_jimbospl_jimbro"] = true
    },
})


SMODS.current_mod.optional_features = function()
    return {
        cardareas = {} 
    }
end