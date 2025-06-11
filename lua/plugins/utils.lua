return {
        -- File Explorer
        {'numToStr/Comment.nvim'},
        { 'jiangmiao/auto-pairs' },
        {'nvim-telescope/telescope.nvim'},
        {
                'kyazdani42/nvim-tree.lua',
                config = function()
                require('nvim-tree').setup()
                -- Set keybindings for opening/closing nvim-tree
                end,
        },

        {
                'junegunn/fzf',  -- For fuzzy file finding
                config = function()
                end,
        },

        {
                "chikko80/error-lens.nvim",
                event = "BufRead",
                dependencies = {
                "nvim-telescope/telescope.nvim"
                },
                opts = {
                -- your options go here
                },
        }

}
