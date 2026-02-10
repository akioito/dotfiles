-- configs.lua

local map = vim.keymap.set

map("n", "U", "<C-R>", { desc = "Redo last change" })

if vim.g.neovide then
  local function save() vim.cmd.write() end
  local function copy() vim.cmd([[normal! "+y]]) end
  local function paste() vim.api.nvim_paste(vim.fn.getreg("+"), true, -1) end

  vim.keymap.set({ "n", "i", "v" }, "<D-s>", save, { desc = "Save" })
  vim.keymap.set("v", "<D-c>", copy, { silent = true, desc = "Copy" })
  vim.keymap.set({ "n", "i", "v", "c", "t" }, "<D-v>", paste, { silent = true, desc = "Paste" })
end

-- Text-to-speech
vim.keymap.set('v', '<M-s>', function()
  vim.cmd('normal! "xy')
  local text = vim.fn.getreg('x')
  vim.fn.jobstart({ 'say', '-v', 'Kyoko', text })
end, { silent = true, desc = 'Speak selection with Kyoko voice' })

vim.api.nvim_set_option("clipboard", "unnamed")

vim.opt.title = true
vim.opt.termguicolors = true

if vim.g.neovide then
  vim.g.neovide_remember_window_size = true
  vim.g.neovide_remember_window_position = true
  vim.g.neovide_input_use_logo = 1
  vim.g.neovide_input_macos_option_key_is_meta = 'both'
  vim.g.neovide_hide_mouse_when_typing = true
  vim.g.neovide_refresh_rate = 120
  vim.g.neovide_no_idle = true
  vim.g.neovide_cursor_antialiasing = true

  -- turn off all animations
  -- vim.g.neovide_position_animation_length = 0
  -- vim.g.neovide_cursor_animation_length = 0.00
  vim.g.neovide_cursor_trail_size = 0
  vim.g.neovide_cursor_animate_in_insert_mode = false
  vim.g.neovide_cursor_animate_command_line = false
  vim.g.neovide_scroll_animation_far_lines = 0
  vim.g.neovide_scroll_animation_length = 0.00
end

-- Cursor blink (blinkwait-blinkon-blinkoff in milliseconds)
vim.opt.guicursor = table.concat({
  "n-v-c:block-Cursor/lCursor",
  "i-ci-ve:ver35-Cursor/lCursor",
  "r-cr:hor20-Cursor/lCursor",
  "o:hor50-Cursor/lCursor",
  "a:blinkwait700-blinkon400-blinkoff250-Cursor/lCursor",
  "sm:block-blinkwait175-blinkon150-blinkoff150-Cursor/lCursor",
}, ",")

-- Others
vim.o.fillchars = 'eob: ' -- remove ~ sign
require("todo-comments").setup({})
require('pqf').setup()

require("tidy").setup({
  filetype_exclude = { "markdown", "diff" },
})

-- End
