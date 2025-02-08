-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
        local lazyrepo = "https://github.com/folke/lazy.nvim.git"
        local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })

if vim.v.shell_error ~= 0 then
        vim.api.nvim_echo({
                { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
                { out, "WarningMsg" },
                { "\nPress any key to exit..." },
        }, true, {})
        vim.fn.getchar()
        os.exit(1)
        end
end

vim.opt.rtp:prepend(lazypath)

-- Make sure to setup `mapleader` and `maplocalleader` before
-- loading lazy.nvim so that mappings are correct.
-- This is also a good place to setup other settings (vim.opt)

vim.g.mapleader = ","
vim.g.maplocalleader = "\\"

-- General Settings
local opt = vim.opt
local keymap = vim.keymap

opt.expandtab = true          -- Use spaces instead of tabs
opt.shiftwidth = 8            -- Shift 8 spaces when indenting
opt.tabstop = 8               -- 1 tab == 8 spaces
opt.softtabstop = 8           -- Number of spaces a <Tab> counts for in insert mode
opt.linebreak = true
opt.number = true             -- Show line numbers
opt.relativenumber = true     -- Show relative line numbers
opt.wrap = true              -- Don't wrap long lines
opt.cursorline = true         -- Highlight the current line
opt.termguicolors = true      -- Enable true color support
opt.clipboard = "unnamedplus" -- Use system clipboard
opt.mouse = "a"               -- Enable mouse support
opt.swapfile = false          -- Disable swap file
opt.undofile = true           -- Persistent undo
opt.ignorecase = true         -- Ignore case in search patterns
opt.smartcase = true          -- Override ignorecase if search contains capitals
opt.hlsearch = true           -- Highlight search matches
opt.incsearch = true          -- Show matches as you type
opt.splitright = true         -- Vertical split to the right
opt.splitbelow = true         -- Horizontal split to the bottom
opt.scrolloff = 8             -- Keep 8 lines visible when scrolling
opt.sidescrolloff = 8         -- Keep 8 columns visible when scrolling horizontally
opt.timeoutlen = 500          -- Time to wait for a mapped sequence to complete
opt.wrap = true               -- Wrap lines
opt.fileencoding = "utf-8"    -- Set default file encoding to UTF-8
opt.updatetime = 300          -- Faster completion
opt.signcolumn = "yes"        -- Always show the sign column to avoid shifting text
opt.colorcolumn = "80"        -- Highlight 80th column


keymap.set('i', 'jk', '<Esc>', { noremap = true, silent = true })
keymap.set('n', '<C-f>', ':NvimTreeToggle<CR>', { noremap = true, silent = true })
keymap.set('n', '<C-p>', ':Files<CR>', { noremap = true, silent = true }) -- Ctrl + P to open files
keymap.set('n', '<A-t>', ':ToggleTerm size=40 direction=float<CR>', { noremap=true, silent = true })
keymap.set('t', '<A-t>', 'exit<CR>exit<CR>', { noremap=true, silent = true })
keymap.set('t', '<A-c>', 'arduino-cli compile --build-path ./build nano.ino<CR>', { noremap=true, silent = true })


-- Setup lazy.nvim
require("lazy").setup({
        spec = {
                { import = "plugins" },
        },
        -- automatically check for plugin updates
        checker = { enabled = true },
})

require("luasnip").filetype_extend("arduino", {"c", "cpp"})
require("luasnip").filetype_extend("svelte", {"html", "javascript", "css"})
require('Comment').setup()
require("toggleterm").setup{}
require("kanagawa").load("wave")
