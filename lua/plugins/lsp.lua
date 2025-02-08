return {
-- Mason
        {
                'williamboman/mason.nvim',
                config = function()
		require('mason').setup()
                end,
        },

        -- Optional: Mason LSP Configuration
        {
                'williamboman/mason-lspconfig.nvim',
                dependencies = { 'williamboman/mason.nvim' },
                config = function()
                require('mason-lspconfig').setup({
                ensure_installed = { 'lua_ls', 'pyright', 'clangd', 'marksman' }, -- Add your desired LSP servers here
                })
                end,
        },

        -- Optional: LSP configuration (assuming you have nvim-lspconfig installed)
        {
                'neovim/nvim-lspconfig',
                dependencies = { 'williamboman/mason-lspconfig.nvim' },
                config = function()
                        local lspconfig = require('lspconfig')
                        lspconfig.lua_ls.setup{
                                settings = {
                                        Lua = {
                                                diagnostics = {
                                                        globals = {
                                                                "love",
                                                                "vim",
                                                        },
                                                },
                                        },
                                },
                        }
                        lspconfig.pyright.setup{} -- Setup for pyright
                        lspconfig.clangd.setup{
                                filetypes = {"c", "cpp", "arduino", "ino"}
                        }
                        -- lspconfig.arduino_language_server.setup {
                        --         cmd = {
                        --                 "arduino-language-server",
                        --                 "-clangd", "/usr/lib/llvm/19/bin/clangd",
                        --                 "-cli", "/usr/bin/arduino_cli",
                        --                 "-cli-config", "~/[1] Projects/NodeMCUTest/nano/sketch.yaml",
                        --                 "-fqbn", "arduino:avr:nano",
                        --         },
                        --         filetypes = { "arduino", "ino" },
                        --         capabilities = {
                        --                 textDocument = { semanticTokens = vim.NIL },
                        --                 workspace = { semanticTokens = vim.NIL },
                        --         }
                        -- }
                end,
        },
	-- Autocompletion framework
	{
		'hrsh7th/nvim-cmp',
		dependencies = {
			'hrsh7th/cmp-nvim-lsp',   -- LSP source for nvim-cmp
			'hrsh7th/cmp-buffer',     -- Buffer completions
			'hrsh7th/cmp-path',       -- Path completions
                        'saadparwaiz1/cmp_luasnip', -- Snippets source for nvim-cmp
			'frafamadriz/friendly-snippets', -- Snippets source
			'L3MON4D3/LuaSnip',       -- Snippet engine
		},

		config = function()
			local cmp = require('cmp')
			local luasnip = require('luasnip')
                        require("luasnip.loaders.from_vscode").lazy_load()
			cmp.setup {
				snippet = {
					expand = function(args)
						luasnip.lsp_expand(args.body) -- For `luasnip` users
					end,
				},
				mapping = {
					['<Tab>'] = cmp.mapping.select_next_item(),
					['<S-Tab>'] = cmp.mapping.select_prev_item(),
					['<C-Space>'] = cmp.mapping.complete(),
					['<CR>'] = cmp.mapping.confirm { select = true },
				},
				sources = {
					{ name = 'nvim_lsp' },    -- LSP completion
					{ name = 'buffer' },      -- Buffer completion
					{ name = 'path' },        -- Path completion
					{ name = 'luasnip' },     -- Snippet completion
				},
			}
		end,
	},

        {
                'nvim-treesitter/nvim-treesitter',
                build = ':TSUpdate',  -- Automatically install parsers
                config = function()
                require('nvim-treesitter.configs').setup {
                        ensure_installed = { "lua", "python", "javascript", "html", "css" }, -- List of languages
                        highlight = {
                                enable = true,              -- Enable highlighting
                                additional_vim_regex_highlighting = false,
                        },
                indent = {
                        enable = true,              -- Enable indentation
                        },
                }
                end,
        },
}
