return {
    "neovim/nvim-lspconfig",
    dependencies = {
        "hrsh7th/cmp-nvim-lsp",
    },
    config = function()
        local lspconfig = require("lspconfig")
        local capabilities = require("cmp_nvim_lsp").default_capabilities()

        -- Helper for root_dir
        local function get_root()
            return vim.fs.dirname(vim.fs.find({ ".git" }, { upward = true })[1] or ".")
        end

        -- Rust Analyzer
        lspconfig.rust_analyzer.setup({
            capabilities = capabilities,
            root_dir = get_root,
        })

        -- TypeScript / JavaScript
        lspconfig.ts_ls.setup({ -- Thats the new version
            filetypes = { "javascript", "typescript", "javascriptreact", "typescriptreact" },
            capabilities = capabilities,
            root_dir = get_root,
        })

        -- Python
        lspconfig.pyright.setup({
            capabilities = capabilities,
            root_dir = get_root,
        })

        -- C / C++
        lspconfig.clangd.setup({
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
        lspconfig.asm_lsp.setup({
            cmd = { "asm-lsp" },
            filetypes = { "s", "S", "asm" },
            capabilities = capabilities,
            root_dir = get_root,
        })

        -- Markdown
        lspconfig.marksman.setup({
            filetypes = { "md", "markdown", "markdown.mdx" },
            capabilities = capabilities,
            root_dir = get_root,
        })

        -- JSON
        lspconfig.jsonls.setup({
            capabilities = capabilities,
            root_dir = get_root,
        })

        -- YAML
        lspconfig.yamlls.setup({
            capabilities = capabilities,
            root_dir = get_root,
        })

        -- Bash
        lspconfig.bashls.setup({
            capabilities = capabilities,
            root_dir = get_root,
        })

        -- LaTeX
        lspconfig.texlab.setup({
            cmd = { "texlab" },
            filetypes = { "tex", "plaintex" },
            capabilities = capabilities,
            root_dir = get_root,
            settings = {
                texlab = {
                    build = {
                        executable = "latexmk",
                        args = { "-pdf", "-interaction=nonstopmode", "-synctex=1", "%f" },
                        onSave = true,
                        forwardSearchAfter = false,
                    },
                    forwardSearch = {
                        executable = "zathura",
                        args = { "--synctex-forward", "%l:1:%f", "%p" },
                    },
                    lint = {
                        onChange = true,
                    },
                },
            },
        })

        -- HTML
        lspconfig.html.setup({
            capabilities = capabilities,
            root_dir = get_root,
        })

        -- CSS
        lspconfig.cssls.setup({
            capabilities = capabilities,
            root_dir = get_root,
        })

        -- Lua (for Neovim config)
        lspconfig.lua_ls.setup({
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
        lspconfig.taplo.setup({
            capabilities = capabilities,
            root_dir = get_root,
        })

        -- Java 
        lspconfig.jdtls.setup{
            cmd = {
                "/usr/lib/jvm/java-21-openjdk/bin/java",
                "--add-modules=ALL-SYSTEM",
                "-Declipse.application=org.eclipse.jdt.ls.core.id1",
                "-Dosgi.bundles.defaultStartLevel=4",
                "-Declipse.product=org.eclipse.jdt.ls.core.product",
                "-Dlog.level=ALL",
                "-Xms1G",
                "-jar", "/home/koofte/projects/cincl/jdt/plugins/org.eclipse.equinox.launcher_1.7.100.v20251014-1222.jar",
                "-configuration", "/home/koofte/projects/cincl/jdt/config_linux",
                "-data", "/home/koofte/.jdtls-workspace"
            },
            settings = {},
            capabilities = capabilities,
        }

        lspconfig.omnisharp.setup({
            cmd = {
                "/home/koofte/projects/godot/run",
                "--languageserver",
            },
            capabilities = capabilities,
            root_dir = get_root,
        })    end,
    }

