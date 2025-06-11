local get_errors = function(bufnr) return vim.diagnostic.get(bufnr, { severity = vim.diagnostic.severity.ERROR }) end
local errors = get_errors(0) -- pass the current buffer; pass nil to get errors for all buffers

vim.api.nvim_create_autocmd('DiagnosticChanged', {
  callback = function()
    errors = get_errors(0)
  end
})

local quotes = {
        'I could be using DeepSeek right now.',
        'The server is busy. Please try again later. 😱',
        'It’s not a bug, it’s a feature. 🐛✨',
        'I wanna play Lethal Company 💥',
        'Hello, I love Cappie.',
        'I couldd be doing math rn. 🔀',
        'If it works, don’t touch it. 🛑',
        'I have to shit, but I\'m coding.',
        'By the way, I copy and pasted example codes.',
        'your mother called, she\'s dead',
        'miside is the greatest game of 2025',
        'i love unemployment',
        'and all it took was to learn lua.',
        'cappie and kind mita is wife shaped',
        'you, me, marry. wife shaped.',
        'i think madame herta is wonderful.',
        'i wonder if i can integrate deepseek',
        'i paid for deepseek.',
        'reasoning models are my saviour.',
        'I should probably update this more.'
}
text = {
        workspace = function(opts)
        local hour = tonumber(os.date('%H'))
        local status = 
        hour >= 22 and '🌙' or
        hour >= 18 and '🌆' or
        hour >= 12 and '🌞' or
        hour >= 5 and '🌅' or '🌙'

        return string.format('%s: %s - Errors: %s', status, opts.filename, #errors)
  end
}

idle = {
        details = function(opts)
                return string.format('Taking a break from %s', opts.workspace)
        end
}

hooks = {
        post_activity = function(_, activity)
                activity.details = quotes[math.random(#quotes)]
        end
}

return {
        {
                "vyfor/cord.nvim",
                build = ":Cord update",
                opts = {
                        hooks = hooks,
                        text = text,
                        idle = idle,
                }
        },
}
