-- configs.lua
local map = vim.api.nvim_set_keymap

require("nvim-treesitter.configs").setup {
    yati = { enable = true },
    -- ensure_installed = "all",
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
require('treesitter-context').setup()
require('scrollview').setup()

require("filetype").setup({})

-- End
