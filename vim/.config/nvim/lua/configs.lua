-- configs.lua
local map = vim.api.nvim_set_keymap

-- Treesiter
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

-- LSP
local lsp = require('lsp-zero')
lsp.preset('recommended')

local cmp = require('cmp')
local cmp_default_maps = lsp.defaults.cmp_mappings()
local cmp_map = cmp.mapping
local cmp_option = {behavior = cmp.SelectBehavior.Replace, select = true}
cmp_default_maps['<Down>'] =cmp_map.select_next_item(cmp_option)
cmp_default_maps['<Tab>'] = cmp_map.select_next_item(cmp_option)
cmp_default_maps['<Up>'] = cmp_map.select_prev_item(cmp_option)
cmp_default_maps['<S-Tab>'] = cmp_map.select_prev_item(cmp_option)

lsp.setup_nvim_cmp({
  mapping = cmp_default_maps
})

lsp.setup()

-- Others
require("todo-comments").setup {}
require('pqf').setup()
require('treesitter-context').setup()
require('scrollview').setup()


require("filetype").setup({})

-- End
