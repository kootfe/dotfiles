return {
    "vyfor/cord.nvim",
    build = ":Cord update",
    config = function()
        require("cord").setup({
            hooks = {
                pre_activity = function(opts)
                    local path = opts.workspace or ""


                    if path:find("__ignore_drpc") then
                        opts.filename = "Can't get the filename!"
                        opts.workspace = "Can't get the workspace!"
                        opts.type = ""
                        opts.icon = ""
                        opts.text = ""
                        opts.timestamp = ""
                        opts.filetype = ""
                        opts.name = ""
                        opts.buftype = ""
                        opts.repo_url = ""
                        opts.tooltip = ""
                        opts.workspace_dir = ""
                        opts.is_idle = ""
                        opts.is_focused = ""
                        opts.buttons = {
                            {
                                label = "Press Me",
                                url = "https://youtu.be/e4wluxrjgy4?si=h91j72ua8budct2-"
                            },
                        }
                        return
                    end
                    opts.buttons = {
                        {
                            label = opts.repo_url and "repo" or "web",
                            url = opts.repo_url or "https://youtu.be/e4wluxrjgy4?si=h91j72ua8budct2-"
                        }
                    }
                end,
            },
        })
    end,
}
