return {
    -- Mason for managing LSPs and tools
    {
        'williamboman/mason.nvim',
        config = function()
            require('mason').setup()
        end,
    },
    {
        'williamboman/mason-lspconfig.nvim',
        dependencies = { 'williamboman/mason.nvim' },
        config = function()
            require('mason-lspconfig').setup({
                ensure_installed = { 'lua_ls', 'pyright', 'clangd', 'html', 'cssls', 'marksman' },
                automatic_enable = true,
            })
        end,
    },

    -- LSP Configuration
    {
        'neovim/nvim-lspconfig',
        dependencies = { 'williamboman/mason-lspconfig.nvim' },
        config = function()
            -- Native diagnostic configuration
            vim.diagnostic.config({
                virtual_text = vim.env.TERM ~= "linux",  -- Inline text for GUI only
                float = { border = "rounded" },          -- Floating windows for all
                signs = true,
                underline = true,
                update_in_insert = false,
                severity_sort = true,
            })

            -- Diagnostic signs
            local signs = { Error = "✘", Warn = "▲", Hint = "⚑", Info = "ℹ" }
            for type, icon in pairs(signs) do
                local hl = "DiagnosticSign" .. type
                vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
            end

            -- Global LSP capabilities for nvim-cmp
            vim.lsp.config('*', {
                capabilities = require('cmp_nvim_lsp').default_capabilities(),
            })

            -- Server-specific overrides (merges with nvim-lspconfig defaults)
            vim.lsp.config('lua_ls', {
                settings = {
                    Lua = {
                        diagnostics = { globals = { "vim" } },
                    },
                },
            })

            vim.lsp.config('clangd', {
                cmd = { "clangd", "--compile-commands-dir=." },
                filetypes = { "c", "cpp" },
            })

            -- LSP Mappings (applied when LSP attaches)
            vim.api.nvim_create_autocmd('LspAttach', {
                group = vim.api.nvim_create_augroup('UserLspConfig', {}),
                callback = function(ev)
                    local opts = { buffer = ev.buf }
                    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
                    vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
                    vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
                    vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts)
                    vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, opts)
                end,
            })
        end,
    },

    -- Autocompletion
    {
        'hrsh7th/nvim-cmp',
        dependencies = {
            'hrsh7th/cmp-nvim-lsp',
            'hrsh7th/cmp-buffer',
            'hrsh7th/cmp-path',
            'saadparwaiz1/cmp_luasnip',
            'L3MON4D3/LuaSnip',
        },
        config = function()
            local cmp = require('cmp')
            local luasnip = require('luasnip')
            require("luasnip.loaders.from_vscode").lazy_load()

            cmp.setup {
                snippet = {
                    expand = function(args)
                        luasnip.lsp_expand(args.body)
                    end,
                },
                mapping = cmp.mapping.preset.insert({
                    ['<Tab>'] = cmp.mapping.select_next_item(),
                    ['<S-Tab>'] = cmp.mapping.select_prev_item(),
                    ['<C-Space>'] = cmp.mapping.complete(),
                    ['<CR>'] = cmp.mapping.confirm { select = true },
                }),
                sources = {
                    { name = 'nvim_lsp' },
                    { name = 'luasnip' },
                    { name = 'buffer' },
                    { name = 'path' },
                },
            }
        end,
    },

    -- Treesitter
    {
        'nvim-treesitter/nvim-treesitter',
        build = ':TSUpdate',
        config = function()
            require('nvim-treesitter.configs').setup {
                ensure_installed = { "lua", "python", "javascript", "html", "css", "c", "cpp", "markdown" },
                highlight = { enable = true },
                indent = { enable = true },
            }
        end,
    },
}
