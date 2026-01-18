return {
    "neovim/nvim-lspconfig",

    dependencies = {
        "hrsh7th/cmp-nvim-lsp",
    },

    config = function()
        local capabilities = require("cmp_nvim_lsp").default_capabilities()

        -- Helper for root_dir
        local function get_root()
            return vim.fs.dirname(vim.fs.find({ ".git" }, { upward = true })[1] or ".")
        end

        -- Rust Analyzer
        vim.lsp.config('rust_analyzer', {
            capabilities = capabilities,
            root_dir = get_root,
        })

        -- TypeScript / JavaScript
        vim.lsp.config('ts_ls', { -- Thats the new version
            filetypes = { "javascript", "typescript", "javascriptreact", "typescriptreact" },
            capabilities = capabilities,
            root_dir = get_root,
        })

        -- Python
        vim.lsp.config('pyright', {
            capabilities = capabilities,
            root_dir = get_root,
        })

        -- C / C++
        vim.lsp.enable('clangd')
        vim.lsp.config('clangd', {
            cmd = {
                "clangd",
                "--background-index",         -- index project in background
                "--clang-tidy",               -- enable clang-tidy
                "--completion-style=detailed", -- no argument autocompletion
                "--cross-file-rename",        -- optional, if you rename symbols
                "--compile-commands-dir=build",
            },
            filetypes = { "c", "cpp", "objc" },
            capabilities = capabilities,
            root_dir = get_root,
        })

        -- ASM
        vim.lsp.config('asm_lsp', {
            cmd = { "asm-lsp" },
            filetypes = { "s", "S", "asm" },
            capabilities = capabilities,
            root_dir = get_root,
        })

        -- Markdown
        vim.lsp.config('marksman', {
            filetypes = { "md", "markdown", "markdown.mdx" },
            capabilities = capabilities,
            root_dir = get_root,
        })

        -- JSON
        vim.lsp.config('jsonls', {
            capabilities = capabilities,
            root_dir = get_root,
        })

        -- YAML
        vim.lsp.config('yamlls', {
            capabilities = capabilities,
            root_dir = get_root,
        })

        -- Bash
        vim.lsp.config('bashls', {
            capabilities = capabilities,
            root_dir = get_root,
        })

        -- HTML
        vim.lsp.config('html', {
            filetypes = {"html", "tera"},
            capabilities = capabilities,
            root_dir = get_root,
        })

        -- CSS
        vim.lsp.config('cssls', {
            capabilities = capabilities,
            root_dir = get_root,
        })

        -- Lua (for Neovim config)
        vim.lsp.config('lua_ls', {
            capabilities = capabilities,
            settings = {
                Lua = {
                    runtime = {
                        version = "LuaJIT",
                        path = vim.split(package.path, ";"),
                    },
                    diagnostics = {
                        globals = { "vim" },
                    },
                    workspace = {
                        library = vim.api.nvim_get_runtime_file("", true),
                        checkThirdParty = false,
                    },
                    telemetry = { enable = false },
                },
            },
            root_dir = get_root,
        })

        -- TOML
        vim.lsp.config('taplo', {
            capabilities = capabilities,
            root_dir = get_root,
        })
    end
}
