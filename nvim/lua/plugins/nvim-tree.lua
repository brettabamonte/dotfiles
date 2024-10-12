return {
    {
        "nvim-tree/nvim-tree.lua",
        config = function()
            local function default_mappings(bufnr)
                local api = require("nvim-tree.api")

                --default mappings
                api.config.mappings.default_on_attach(bufnr)
            end
            require("nvim-tree").setup({
                on_attach = default_mappings,
                renderer = {
                    icons = {
                        web_devicons = {
                            file = {
                                enable = true,
                                color = true,
                            },
                            folder = {
                                enable = true,
                                color = true,
                            },
                        },
                    },
                },
            })
            --custom global mappings
            local api = require("nvim-tree.api")
            vim.keymap.set("n", "<Leader>fe", api.tree.toggle, { desc = "Toggle File Explorer" })
        end,
    }
}
