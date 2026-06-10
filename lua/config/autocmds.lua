-- Auto commands
local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

-- General settings
local user_group = augroup("user_cmds", { clear = true })

-- Resize splits when window resized
autocmd("VimResized", {
    group = user_group,
    command = "tabdo wincmd =",
})

-- Highlight on yank
autocmd("TextYankPost", {
    group = user_group,
    callback = function()
        vim.highlight.on_yank({ higroup = "IncSearch", timeout = 200 })
    end,
})

-- Return to last edit position
autocmd("BufReadPost", {
    group = user_group,
    callback = function()
        local mark = vim.api.nvim_buf_get_mark(0, '"')
        local lcount = vim.api.nvim_buf_line_count(0)
        if mark[1] > 0 and mark[1] <= lcount then
            pcall(vim.api.nvim_win_set_cursor, 0, mark)
        end
    end,
})

-- Disable auto comment on newline
autocmd("BufEnter", {
    group = user_group,
    pattern = "*",
    command = "set formatoptions-=cro",
})

-- Fix conceallevel for markdown
autocmd("FileType", {
    group = user_group,
    pattern = "markdown",
    command = "setlocal conceallevel=0",
})
