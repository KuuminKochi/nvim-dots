return {
        { "nvim-tree/nvim-web-devicons", lazy = true },
        { "stevearc/dressing.nvim", event = "VeryLazy" },
        { "rebelot/kanagawa.nvim" },
        {
                '3rd/image.nvim',
                cond = function()
                return vim.fn.has 'win32' ~= 1
                end,

                dependencies = {
                        'leafo/magick',
                },
        },
        {
                'akinsho/nvim-bufferline.lua',
                config = function()
                require('bufferline').setup()
                end,
        },
}
