-- General Neovim options
local opt = vim.opt

-- Termux detection
local termux = require("config.termux")

-- Line numbers
opt.number = true
opt.relativenumber = termux.opt(true, false) -- relative numbers waste on small screens

-- Tabs & indentation
opt.tabstop = 4
opt.shiftwidth = 4
opt.softtabstop = 4
opt.expandtab = true
opt.smartindent = true
opt.wrap = false

-- Search
opt.hlsearch = true
opt.incsearch = true
opt.ignorecase = true
opt.smartcase = true

-- Cursor
opt.cursorline = true

-- Appearance
opt.termguicolors = true
opt.background = "dark"
opt.signcolumn = termux.opt("yes", "auto")     -- save column on tablet

-- Backspace
opt.backspace = "indent,eol,start"

-- Clipboard
opt.clipboard:append(termux.opt("unnamedplus", "unnamed")) -- termux: use * register

-- Split windows
opt.splitright = true
opt.splitbelow = true

-- Swap & backup
opt.swapfile = false
opt.backup = false
opt.undofile = true

-- Timeouts
opt.timeoutlen = 500

-- Scroll (less aggressive on tablet to keep more context visible)
opt.scrolloff = termux.opt(8, 4)
opt.sidescrolloff = termux.opt(8, 4)

-- Complete options
opt.completeopt = "menu,menuone,noselect"

-- Display
opt.showmode = false

-- Reduce update time on mobile (less CPU)
opt.updatetime = termux.opt(300, 500)
