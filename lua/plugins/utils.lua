return {
        {
                'windwp/nvim-autopairs',
                event = "InsertEnter",
                config = function()
                        require('nvim-autopairs').setup({})
                end
        },
        {
                'nvim-telescope/telescope.nvim',
                dependencies = { 'nvim-lua/plenary.nvim' },
                config = function()
                        require('telescope').setup({
                            defaults = {
                                borderchars = { "─", "│", "─", "│", "┌", "┐", "┘", "└" },
                            }
                        })
                end
        },
}
