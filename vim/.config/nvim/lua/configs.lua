-- configs.lua
local map = vim.api.nvim_set_keymap

require("nvim-treesitter.configs").setup {
    yati = { enable = true },
    ensure_installed = "maintained",
    highlight = {
        enable = true,
        disable = { "vim" },
    },
    rainbow = {
        enable = true,
        extended_mode = true, -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
        max_file_lines = nil -- Do not enable for files with more than n lines, int
    }
}

require("todo-comments").setup {}
require('pqf').setup()

require('hop').setup()   
    map('n', 'f', "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.AFTER_CURSOR, current_line_only = true })<cr>", {})
    map('n', 'F', "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.BEFORE_CURSOR, current_line_only = true })<cr>", {})
    map('o', 'f', "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.AFTER_CURSOR, current_line_only = true, inclusive_jump = true })<cr>", {})
    map('o', 'F', "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.BEFORE_CURSOR, current_line_only = true, inclusive_jump = true })<cr>", {})
    map('',  't', "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.AFTER_CURSOR, current_line_only = true })<cr>", {})
    map('',  'T', "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.BEFORE_CURSOR, current_line_only = true })<cr>", {})

require('hlargs').setup {
  color = "#FA58B6",
  excluded_filetypes = {},
  paint_arg_declarations = true,
  paint_arg_usages = true,
  performance = {
    parse_delay = 1,
    max_iterations = 400
  }
}
require('hlargs').enable()
require("better_escape").setup({})

-- End
