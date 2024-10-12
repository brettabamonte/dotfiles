return {
    {
        "numToStr/Comment.nvim",
        opts = {},
    },
    {
        "lewis6991/gitsigns.nvim",
        opts = {
            signs = {
                add = { text = "+" },
                change = { text = "~" },
                delete = { text = "_" },
                topdelete = { text = "‾" },
                changedelete = { text = "~" },
            },
        },
    },
    {
        "folke/todo-comments.nvim",
        event = "VimEnter",
        dependencies = { "nvim-lua/plenary.nvim" },
        opts = { signs = false },
    },
    {
        "echasnovski/mini.nvim",
        config = function()
            require("mini.ai").setup({
                n_lines = 500
            })

            require("mini.surround").setup()

            require("mini.statusline").setup({
                use_icons = vim.g.have_nerd_font,
            })
        end,
    },
}
