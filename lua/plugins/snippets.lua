return {
        {
		'L3MON4D3/LuaSnip',
		config = function()
			require('luasnip').setup()
		end,
	},

        {
		"rafamadriz/friendly-snippets",
		dependencies = { 'L3MON4D3/LuaSnip' },
	},

	{
		'honza/vim-snippets',
		dependencies = 'L3MON4D3/LuaSnip',
		config = function()
			require("luasnip.loaders.from_vscode").load({ paths = "~/.config/nvim/snippets/" }) -- Load from custom path
		end,
	},

        {
                "nvim-svelte/nvim-svelte-snippets",
		opts = {
			auto_detect = true,
		}
        },
}
