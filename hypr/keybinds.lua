hl.bind("SUPER + F12", hl.dsp.submap("clean"), { description = "Disable keybinds" })

hl.define_submap("clean", function()
    hl.bind("SUPER + F12", hl.dsp.submap("reset"), { description = "Enable keybinds" })
end)

local hs = require("hyprsplit")

for i = 1, 9 do
    hl.bind("SUPER + " .. i, hs.dsp.focus({ workspace = i }), { description = "Focus workspace " .. i })
    hl.bind("SUPER + SHIFT + " .. i, hs.dsp.window.move({ workspace = i, follow = false }), { description = "Move to workspace " .. i })
end
hl.bind("SUPER + 0", hs.dsp.focus({ workspace = 10 }), { description = "Focus workspace 10" })
hl.bind("SUPER + SHIFT + 0", hs.dsp.window.move({ workspace = 10, follow = false }), { description = "Move to workspace 10" })

hl.bind("ALT + space", hl.dsp.exec_cmd("wofi --show drun"), { description = "App runner" })
--hl.bind("ALT + space", hl.dsp.exec_cmd("/home/koofte/.config/rofi/launchers/type-1/launcher.sh"), { description = "App runner" })
hl.bind("ALT + t", hl.dsp.exec_cmd("kitty"), { description = "Terminal" })
hl.bind("SUPER + q", hl.dsp.window.close(), { description = "Kill" })
hl.bind("SUPER + f", hl.dsp.exec_cmd("thunar ~"), { description = "File manager" })
hl.bind("SUPER + w", hl.dsp.exec_cmd("zen-browser"), { description = "Browser" })
hl.bind("SUPER + s", hl.dsp.exec_cmd("steam"), { description = "Stream" })
hl.bind("SUPER + d", hl.dsp.exec_cmd("discord"), { description = "Discord" })
hl.bind("SUPER + h", hl.dsp.exec_cmd("heroic"), { description = "Heroic Launcher" })

hl.bind("ALT + Tab", hl.dsp.exec_raw("cyclenext prev allmonitors"), { description = "Window change" })
hl.bind("ALT + SHIFT + Tab", hl.dsp.exec_raw("cyclenext allmonitors"), { description = "Reverse window change" })
hl.bind("SHIFT + CTRL + w", hl.dsp.exec_raw("focusmonitor +1"), { description = "Switch screens" })
hl.bind("SUPER + m", hl.dsp.exec_raw("movewindow mon:1"), { description = "Move to second monitor" })
hl.bind("SUPER + n", hl.dsp.exec_raw("movewindow mon:0"), { description = "Move to main monitor" })
hl.bind("Print", hl.dsp.exec_cmd('grim -g "$(slurp)" ~/Pictures/screenshot-$(date +%s).png | wl-copy'), { description = "ScreenShot" })

hl.bind("SUPER + ALT + mouse:272", hl.dsp.window.drag(), { mouse = true })
hl.bind("SUPER + ALT + mouse:273", hl.dsp.window.resize(), { mouse = true }) -- and this makes resize instead of floating lol

hl.bind("SUPER + o", hl.dsp.dpms({ action = "enable" }), { description = "Unlock screen" })
hl.bind("SUPER + l", hl.dsp.dpms({ action = "disable" }), { description = "Lock screen" })

hl.bind("ALT + v", hl.dsp.exec_cmd("~/scripts/kft_vertical.sh"), { description = "Vertical mode" }) -- set 2nd monitor to vertical
hl.bind("ALT + h", hl.dsp.exec_cmd("~/scripts/kft_horiz.sh"), { description = "Horizontal mode" }) -- set 2nd monitor to default

hl.bind("ALT + l", hl.dsp.exec_cmd("~/scripts/kft_briht.sh 1 -10"), { description = "Decrease brightness" })
hl.bind("ALT + l", hl.dsp.exec_cmd("~/scripts/kft_briht.sh 3 -10"), { description = "Decrease brightness" })
hl.bind("ALT + o", hl.dsp.exec_cmd("~/scripts/kft_briht.sh 1 10"), { description = "Increase brightness" })
hl.bind("ALT + o", hl.dsp.exec_cmd("~/scripts/kft_briht.sh 3 10"), { description = "Increase brightness" })

hl.bind("ALT + f", hl.dsp.exec_raw("fullscreen 1"), { description = "FULL SCREEN" })
hl.bind("SHIFT + CTRL + f", hl.dsp.window.float({ action = "toggle" }), { description = "Float" })

