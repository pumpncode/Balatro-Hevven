SMODS.Atlas({
    key = "vouchers", 
    path = "vouchers.png", 
    px = 71,
    py = 95
})

SMODS.Voucher({
    key = "flow_gauge",
    loc_txt = {
        name = 'Flow Gauge',
        text = {
            "Flow Cards appear",
            "#1#x more frequently",
            "in the shop ",
        },
    },
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.multiplier
            }
        }
    end,
    atlas = 'vouchers',
    pos = {
        x = 0,
        y = 0
    },
    config = { extra = { multiplier = 2 }},
    redeem = function(self, card)
        G.GAME.flow_rate = G.GAME.flow_rate * card.ability.extra.multiplier
    end
})

SMODS.Voucher({
    key = "flow_master",
    loc_txt = {
        name = 'Flow Master',
        text = {
            "Flow Cards appear",
            "#1#x more frequently",
            "in the shop ",
        },
    },
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.multiplier
            }
        }
    end,
    atlas = 'vouchers',
    pos = {
        x = 0,
        y = 1
    },
    config = { extra = { multiplier = 4 }},
    requires = {"v_rh_flow_gauge"},
    redeem = function(self, card)
        G.GAME.flow_rate = G.GAME.flow_rate * card.ability.extra.multiplier
    end
})