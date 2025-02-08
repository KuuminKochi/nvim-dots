return {
        -- File Explorer
        {'akinsho/toggleterm.nvim', version = "*", config = true},
        {'numToStr/Comment.nvim'},
        { 'jiangmiao/auto-pairs' },
        {
                'kyazdani42/nvim-tree.lua',
                config = function()
                require('nvim-tree').setup()
                -- Set keybindings for opening/closing nvim-tree
                end,
        },

        {
                'junegunn/fzf.vim',  -- For fuzzy file finding
                config = function()
                end,
        },

}
