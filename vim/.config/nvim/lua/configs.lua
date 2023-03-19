-- configs.lua

local map = vim.keymap.set

-- Neovide
-- see ~/.local/share/nvim/neovide-settings.json
--     https://github.com/neovide/neovide/issues/1263#issuecomment-1094628137

map('n', '<D-s>', ':w<CR>') -- Save
map('v', '<D-c>', '"+y') -- Copy
map('n', '<D-v>', '"+P') -- Paste normal mode
map('v', '<D-v>', '"+P') -- Paste visual mode
map('c', '<D-v>', '<C-R>+') -- Paste command mode
map('i', '<D-v>', '<ESC>l"+Pli') -- Paste insert mode
vim.api.nvim_set_option("clipboard", "unnamed")

if vim.g.neovide then
  vim.g.neovide_remember_window_size = true
  vim.g.neovide_remember_window_position = true
  vim.g.neovide_input_use_logo = 1
  vim.g.neovide_input_macos_alt_is_meta = true
  vim.opt.title = true

  vim.api.nvim_command([[
    augroup Neovide
      autocmd BufWritePost * :wshada
    augroup END
    ]])
end

-- Treesitter
require("nvim-treesitter.configs").setup {
  ensure_installed = { "python", "rust", "vim", "json", "svelte", "lua", "markdown", "typescript", "vue", "html" },
  highlight = {
    enable = false,
    additional_vim_regex_highlighting = false,
  },
}

-- Others
vim.o.fillchars = 'eob: ' -- remove ~ sign
require("todo-comments").setup({})
require('pqf').setup()

require('dd').setup({
  timeout = 1000
})

require("filetype").setup({})
require("stickybuf").setup({})
require("tidy").setup({
  filetype_exclude = { "markdown", "diff" },
})
require("indent_blankline").setup {
    show_current_context = true,
}

-- End
