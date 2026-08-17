local jdtls = require("jdtls")

local root_dir = require("jdtls.setup").find_root({ "pom.xml", "build.gradle", "build.gradle.kts", ".git" })
if not root_dir then
    return
end

local project_name = vim.fn.fnamemodify(root_dir, ":p:h:t")
local workspace_dir = vim.fn.stdpath("data") .. "/jdtls-workspace/" .. project_name

local config = {
    cmd = { "jdtls", "-data", workspace_dir },

    root_dir = root_dir,

    settings = {
        java = {
            configuration = {
                runtimes = {
                    { name = "JavaSE-17", path = "/usr/lib/jvm/java-17-openjdk/" },
                    { name = "JavaSE-21", path = "/usr/lib/jvm/java-21-openjdk/" },
                },
            },
            eclipse = { downloadSources = true },
            maven = { downloadSources = true },
            implementationsCodeLens = { enabled = true },
            referencesCodeLens = { enabled = true },
            signatureHelp = { enabled = true },
            format = { enabled = true },
        },
    },

    on_attach = function(_, bufnr)
        local opts = { noremap = true, silent = true, buffer = bufnr }
        vim.keymap.set("n", "<leader>jo", jdtls.organize_imports, opts)
        vim.keymap.set("n", "<leader>jv", jdtls.extract_variable, opts)
        vim.keymap.set("n", "<leader>jc", jdtls.extract_constant, opts)
        vim.keymap.set("v", "<leader>jm", function()
            jdtls.extract_method(true)
        end, opts)
        vim.keymap.set("n", "<leader>jt", jdtls.test_class, opts)
        vim.keymap.set("n", "<leader>jn", jdtls.test_nearest_method, opts)

        pcall(jdtls.setup_dap, { hotcodereplace = "auto" })
    end,
}

jdtls.start_or_attach(config)
