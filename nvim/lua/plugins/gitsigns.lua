return {
    "lewis6991/gitsigns.nvim",
    event = { "BufReadPre", "BufNewFile" },
    opts = {
        signs = {
            add = { text = "┃" },
            change = { text = "┃" },
            delete = { text = "_" },
            topdelete = { text = "‾" },
            changedelete = { text = "~" },
            untracked = { text = "┆" },
        },

        signcolumn = true,
        numhl = false,
        linehl = false,
        word_diff = false,

        watch_gitdir = {
            follow_files = true,
        },

        auto_attach = true,
        attach_to_untracked = false,

        current_line_blame = false,
        current_line_blame_opts = {
            virt_text = true,
            virt_text_pos = "eol",
            delay = 1000,
            ignore_whitespace = false,
        },

        current_line_blame_formatter = "<author>, <author_time:%R> - <summary>",

        sign_priority = 6,
        update_debounce = 100,

        max_file_length = 40000,

        preview_config = {
            style = "minimal",
            relative = "cursor",
            row = 0,
            col = 1,
        },
    },

    config = function(_, opts)
        require("gitsigns").setup(opts)

        local gitsigns = require("gitsigns")

        vim.keymap.set("n", "]c", function()
            if vim.wo.diff then
                vim.cmd.normal({ "]c", bang = true })
            else
                gitsigns.nav_hunk("next")
            end
        end, { desc = "Next git hunk" })

        vim.keymap.set("n", "[c", function()
            if vim.wo.diff then
                vim.cmd.normal({ "[c", bang = true })
            else
                gitsigns.nav_hunk("prev")
            end
        end, { desc = "Prev git hunk" })

        vim.keymap.set("n", "<leader>hs", gitsigns.stage_hunk, { desc = "Stage hunk" })
        vim.keymap.set("n", "<leader>hr", gitsigns.reset_hunk, { desc = "Reset hunk" })
        vim.keymap.set("n", "<leader>hS", gitsigns.stage_buffer, { desc = "Stage buffer" })
        vim.keymap.set("n", "<leader>hR", gitsigns.reset_buffer, { desc = "Reset buffer" })

        vim.keymap.set("n", "<leader>hp", gitsigns.preview_hunk, { desc = "Preview hunk" })
        vim.keymap.set("n", "<leader>hb", gitsigns.blame_line, { desc = "Blame line" })
        vim.keymap.set("n", "<leader>hd", gitsigns.diffthis, { desc = "Diff this" })

        vim.keymap.set("n", "<leader>tb", gitsigns.toggle_current_line_blame, { desc = "Toggle blame" })
        vim.keymap.set("n", "<leader>tw", gitsigns.toggle_word_diff, { desc = "Toggle word diff" })
    end,
}
