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

vim.g.mapleader = ","
vim.g.maplocalleader = "\\"

-- Setup lazy.nvim
local is_termux = vim.env.TERMUX_VERSION ~= nil
require("lazy").setup({
        spec = {
                { import = "plugins" },
        },
        -- automatically check for plugin updates (disable on mobile to save battery/data)
        checker = { enabled = not is_termux },
        -- longer timeout for slow mobile connections
        install = { missing = true, timeout = is_termux and 120 or 60 },
})
