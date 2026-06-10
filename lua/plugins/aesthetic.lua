return {
    {
        "ellisonleao/gruvbox.nvim",
        priority = 1000,
        config = function()
            local is_termux = vim.env.TERMUX_VERSION ~= nil
            require("gruvbox").setup({
                terminal_colors = true,
                undercurl = false,
                underline = false,
                bold = true,
                italic = {
                    strings = false,
                    emphasis = false,
                    comments = false,
                    operators = false,
                    folds = false,
                },
                strikethrough = false,
                invert_selection = true,
                invert_signs = false,
                invert_tabline = false,
                invert_intend_guides = false,
                inverse = true,
                contrast = is_termux and "medium" or "hard", -- softer contrast on mobile
                palette_overrides = {},
                overrides = {},
                dim_inactive = false,
                transparent_mode = is_termux, -- transparent looks better in Termux
            })
            vim.cmd("colorscheme gruvbox")
        end,
    },
}
