-- lua/lsp/init.lua
local cmp_capabilities = require("cmp_nvim_lsp").default_capabilities()

local function on_attach(client, bufnr)
    local bufmap = function(mode, lhs, rhs, opts)
        opts = opts or {}
        opts.buffer = bufnr
        vim.keymap.set(mode, lhs, rhs, opts)
    end

    if client.supports_method("textDocument/formatting") then
        vim.api.nvim_create_autocmd("BufWritePre", {
            buffer = bufnr,
            callback = function()
                vim.lsp.buf.format({ bufnr = bufnr, timeout_ms = 1000 })
            end,
        })
    end
end

local servers = {
    clangd = {
        cmd = { "clangd", "--background-index" },
        filetypes = { "c", "cpp", "objc", "objcpp" },
        root_dir = function(fname)
            return vim.fs.find({".git","compile_commands.json"}, { upward = true, path = vim.fs.dirname(fname) })[1]
                or vim.loop.cwd()
        end
    },
    rust_analyzer = {
        cmd = { "rust-analyzer" },
        filetypes = { "rust" },
        root_dir = function(fname)
            return vim.fs.find({"Cargo.toml"}, { upward = true, path = vim.fs.dirname(fname) })[1]
                or vim.loop.cwd()
        end
    },
    tsserver = {
        cmd = { "typescript-language-server", "--stdio" },
        filetypes = { "javascript", "typescript", "javascriptreact", "typescriptreact" },
        root_dir = function(fname)
            return vim.fs.find({ "package.json" }, { upward = true, path = vim.fs.dirname(fname) })[1]
                or vim.loop.cwd()
        end
    },
    asm_lsp = {
        cmd = { "asm-lsp" },
        filetypes = { "asm", "s", "S" },
        root_dir = function() return vim.loop.cwd() end
    }
}

-- Register servers in vim.lsp.config
for name, cfg in pairs(servers) do
   for name, cfg in pairs(servers) do
    vim.lsp.config(name, cfg)
    vim.lsp.enable(name)
end

-- Optional: automatically start LSP for current buffer
for name, cfg in pairs(servers) do
    local ft = vim.bo.filetype
    if vim.tbl_contains(cfg.filetypes, ft) then
        vim.lsp.start({
            name = name,
            cmd = cfg.cmd,
            root_dir = cfg.root_dir(vim.api.nvim_buf_get_name(0)),
            capabilities = cmp_capabilities,
            on_attach = on_attach,
            filetypes = cfg.filetypes,
        })
    end
end

