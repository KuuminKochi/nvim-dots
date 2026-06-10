-- Termux detection and helpers
local M = {}

M.is_termux = vim.env.TERMUX_VERSION ~= nil

-- Configure clipboard for Termux (uses termux-clipboard-*)
if M.is_termux then
    vim.g.clipboard = {
        name = "termux",
        copy = {
            ["+"] = vim.fn.executable("termux-clipboard-set") == 1 and { "termux-clipboard-set" } or nil,
            ["*"] = vim.fn.executable("termux-clipboard-set") == 1 and { "termux-clipboard-set" } or nil,
        },
        paste = {
            ["+"] = vim.fn.executable("termux-clipboard-get") == 1 and { "termux-clipboard-get" } or nil,
            ["*"] = vim.fn.executable("termux-clipboard-get") == 1 and { "termux-clipboard-get" } or nil,
        },
    }
end

-- Override options
function M.opt(standard, termux_value)
    return M.is_termux and termux_value or standard
end

return M
