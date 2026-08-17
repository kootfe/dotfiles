--[[
hl.monitor({
    output = "HDMI-A-1",
    mode = "preferred",
    position = "0x0",
    scale = 1,
}) ]]--

hl.monitor({
    output = "eDP-1",
    mode = "preferred",
    position = "0x0",
    scale = 1,
})

terminal = "kitty"
menu = "wofi"
bar = "waybar"
wall = "awww-daemon"
natif = "Swaync"

hl.on("hyprland.start", function()
	hl.exec_cmd(wall)
	hl.exec_cmd(bar)
	hl.exec_cmd("nm-aplet")
--  hl.exec_cmd("hyprpm reload")
	hl.exec_cmd(natif)
end)

hl.config({
	general = {
		gaps_in = 5,
		gaps_out = 10,
		border_size = 2,
		["col.active_border"] = "rgba(aaaaaaaa)",
		["col.inactive_border"] = "rgba(595959aa)",
		resize_on_border = false,
		allow_tearing = false,
		layout = "dwindle",
	},

	decoration = {
		rounding = 10,
		rounding_power = 2,
		active_opacity = 1.0,
		inactive_opacity = 1.0,
	},

	dwindle = {
		preserve_split = true,
	},

	master = {
		new_status = "slave",
	},

	misc = {
		force_default_wallpaper = 0,
		disable_hyprland_logo = true,
		enable_swallow = true,
	},

    input = {
    },

	binds = {
		drag_threshold = 1,
	},

})

hl.device({
    name = "logi-m196-mouse",
    sensitivity = 1.0,
})

require("keybinds")
local hs = require("hyprsplit")
hs.config({ num_workspaces = 10 })

