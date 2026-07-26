hl.bind("SUPER + F12", hl.dsp.submap("active"))

hl.define_submap("active", function()
    hl.bind("SUPER + F12", hl.dsp.submap("reset"))
    hl.bind("SUPER + q", hl.dsp.window.close())
    hl.bind("SUPER + ALT + q", hl.dsp.window.kill())
    hl.bind("SUPER + w", hl.dsp.exec_cmd("zen-browser"))
    hl.bind("ALT + t", hl.dsp.exec_cmd("kitty"))
    hl.bind("ALT + space", hl.dsp.exec_cmd("/home/koofte/.config/rofi/launchers/type-1/launcher.sh"))
    hl.bind("SUPER + f", hl.dsp.exec_cmd("thunar ~"))
    hl.bind("print", hl.dsp.exec_cmd(""))

    hl.bind("ALT + mouse:272", hl.dsp.window.drag())
    hl.bind("ALT + mouse:273", hl.dsp.window.resize())
    hl.bind("SHIFT + CTRL + f", hl.dsp.window.float())
    hl.bind("ALT + f", hl.dsp.window.fullscreen())

    hl.bind("ALT + v", hl.dsp.exec_cmd("/home/koofte/scripts/kft_vertical.sh"))
    hl.bind("ALT + h", hl.dsp.exec_cmd("/home/koofte/scripts/kft_horiz.sh"))
    hl.bind("SUPER + d", hl.dsp.exec_cmd("discord"))
    local hs = require("hyprsplit")
    for i = 1, 10 do
        local key = i % 10
        hl.bind("SUPER + " .. key, hs.dsp.focus({ workspace = i }))
        hl.bind("SUPER + SHIFT + " .. key, hs.dsp.window.move({ workspace = i, follow = false }))
    end
    hl.bind("SUPER + g", hs.dsp.grab_rogue_windows())
end)
