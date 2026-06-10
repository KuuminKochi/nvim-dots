-- Default keymaps
local map = vim.keymap.set
local opts = { noremap = true, silent = true }
local termux = require("config.termux")

-- ------------------------------------------------------------------
--  Window navigation
-- ------------------------------------------------------------------

-- Ctrl combos (desktop keyboard)
map("n", "<C-h>", "<C-w>h", opts)
map("n", "<C-j>", "<C-w>j", opts)
map("n", "<C-k>", "<C-w>k", opts)
map("n", "<C-l>", "<C-w>l", opts)

-- Leader combos (tablet-friendly, leader = ,)
map("n", "<leader>h", "<C-w>h", opts)
map("n", "<leader>j", "<C-w>j", opts)
map("n", "<leader>k", "<C-w>k", opts)
map("n", "<leader>l", "<C-w>l", opts)

-- Resize windows
map("n", "<C-Up>", "<cmd>resize +2<CR>", opts)
map("n", "<C-Down>", "<cmd>resize -2<CR>", opts)
map("n", "<C-Left>", "<cmd>vertical resize -2<CR>", opts)
map("n", "<C-Right>", "<cmd>vertical resize +2<CR>", opts)

-- Leader resize (tablet-friendly)
map("n", "<leader><Up>", "<cmd>resize +2<CR>", opts)
map("n", "<leader><Down>", "<cmd>resize -2<CR>", opts)
map("n", "<leader><Left>", "<cmd>vertical resize -2<CR>", opts)
map("n", "<leader><Right>", "<cmd>vertical resize +2<CR>", opts)

-- ------------------------------------------------------------------
--  General
-- ------------------------------------------------------------------

-- Better escape from terminal
map("t", "<Esc>", "<C-\\><C-n>", opts)

-- Clear search highlights (Esc or leader+space)
map("n", "<Esc>", "<cmd>nohlsearch<CR>", opts)
map("n", "<leader><space>", "<cmd>nohlsearch<CR>", opts)

-- Quick save / quit
map("n", "<leader>w", "<cmd>write<CR>", opts)
map("n", "<leader>q", "<cmd>quit<CR>", opts)

-- ------------------------------------------------------------------
--  Visual mode
-- ------------------------------------------------------------------

-- Move lines
map("v", "<A-j>", ":m '>+1<CR>gv=gv", opts)
map("v", "<A-k>", ":m '<-2<CR>gv=gv", opts)

-- Better indenting / stay in visual
map("v", "<", "<gv", opts)
map("v", ">", ">gv", opts)

-- Paste without overwriting register
map("x", "<leader>p", [["_dP]], opts)

-- ------------------------------------------------------------------
--  Clipboard (register-aware for Termux)
-- ------------------------------------------------------------------

local yank_reg = termux.opt("+", "*")          -- termux: * register works better
map({ "n", "v" }, "<leader>y", [["]] .. yank_reg .. "y", opts)
map("n", "<leader>Y", [["]] .. yank_reg .. [[Y]], opts)
