-- configs.lua

local map = vim.keymap.set

-- Neovide
-- see ~/.local/share/nvim/neovide-settings.json
--     https://github.com/neovide/neovide/issues/1263#issuecomment-1094628137

map('n', '<D-s>', ':w<CR>')      -- Save
map('v', '<D-c>', '"+y')         -- Copy
map('n', '<D-v>', '"+P')         -- Paste normal mode
map('v', '<D-v>', '"+P')         -- Paste visual mode
map('c', '<D-v>', '<C-R>+')      -- Paste command mode
map('i', '<D-v>', '<ESC>l"+Pli') -- Paste insert mode
map("n", "U", "<C-R>", { desc = "Redo last change" })

vim.api.nvim_set_option("clipboard", "unnamed")

vim.opt.title = true
vim.opt.termguicolors = true

if vim.g.neovide then
  vim.g.neovide_remember_window_size = true
  vim.g.neovide_remember_window_position = true
  vim.g.neovide_input_use_logo = 1
  vim.g.neovide_input_macos_option_key_is_meta = 'both'
  vim.g.neovide_cursor_animation_length = 0
end

-- Others
vim.o.fillchars = 'eob: ' -- remove ~ sign
require("todo-comments").setup({})
require('pqf').setup()

require("tidy").setup({
  filetype_exclude = { "markdown", "diff" },
})

-- End
