local M = {};

M.setup = function (opts)
    M.option = opts or {}
    M.register_commands()
end

function regcmd(cmnd, func, desc)
    vim.api.nvim_create_user_command(cmnd, func, desc)
end

M.add_project = function ()
    
end

M.register_commands = function ()
    regcmd("PliTest", function ()
        M.add_project()
    end, { desc = "Run projli test func"})


end

M.info = function ()
    print("Made by koofte - A project manager for NeoVim")
end

M.test = function ()
    print(M.option.msg)
end

return M
