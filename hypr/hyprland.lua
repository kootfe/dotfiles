hl.monitor({
    output = "HDMI-A-1",
    mode = "preferred",
    position = "1080x840",
    scale = 1
})
hl.monitor({
    output = "HDMI-A-2",
    mode = "preferred",
    position = "0x0",
    scale = 1,
    transform = 1
})

local terminal = "kitty"
local menu = "rofi"
local bar = "waybar"
local wall = "awww-daemon"
local natif = "swaync"

hl.on("hyprland.start", function()
    hl.exec_cmd(bar)
    hl.exec_cmd(wall)
    hl.exec_cmd(natif)
    hl.exec_cmd("nm-applet")
    hl.exec_cmd("fcitx5 -d")
    hl.dispatch(hl.dsp.submap("active"))
end)

hl.config({
    general = {
        gaps_in = 5,
        gaps_out = 10,
        border_size = 2,
        resize_on_border = false,
        allow_tearing = false,
        layout = "dwindle"
    },

    decoration = {
        rounding = 10,
        rounding_power = 2,
        active_opacity = 1.0,
        inactive_opacity = 1.0,
    },
    dwindle = {
        preserve_split = true
    },
    master = {
         new_status = "slave"
    },
    misc = {
        force_default_wallpaper = 0,
        disable_hyprland_logo = true,
        enable_swallow = true
    },
    binds = {
        drag_threshold = 1
    }
})

require("/home/koofte/.config/hypr/keybinds.lua")
local hs = require("hyprsplit")
hs.config({ num_workspaces = 10  })
