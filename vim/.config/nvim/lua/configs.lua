-- configs.lua

-- Neovide
-- see ~/.local/share/nvim/neovide-settings.json  
--     https://github.com/neovide/neovide/issues/1263#issuecomment-1094628137  
vim.g.neovide_cursor_animation_length = 0.03
vim.g.neovide_cursor_trail_size = 0.75
vim.g.neovide_cursor_vfx_mode = "ripple"
vim.g.neovide_remember_window_size = true
vim.g.neovide_remember_window_position = true
vim.g.neovide_cursor_antialiasing = true
vim.g.neovide_input_use_logo = 1
vim.g.neovide_input_macos_alt_is_meta=true

-- Treesiter
require("nvim-treesitter.configs").setup {
    yati = { enable = true },
    ensure_installed = {"python","rust", "vim", "json", "svelte", "lua", "markdown", "typescript", "css", "html"},
    highlight = {
        enable = true,
        disable = { "vim" },
    },
    rainbow = {
        enable = true,
        extended_mode = true, -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
        max_file_lines = nil -- Do not enable for files with more than n lines, int
    },
    completion = {
        keyword_length = 2,
        completeopt = "menu,menuone,noselect"
  },
}

-- LSP
local lsp = require('lsp-zero')
lsp.preset('recommended')

lsp.set_preferences({
  set_lsp_keymaps = false
})

lsp.on_attach(function(_, bufnr)
    local noremap = {buffer = bufnr, remap = false}
    local bind = vim.keymap.set
    -- LSP actions
    bind('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<cr>', noremap)
    bind('n', 'gh', '<cmd>lua vim.lsp.buf.hover()<cr>', noremap)
    bind('n', 'gr', '<cmd>lua vim.lsp.buf.references()<cr>', noremap)
    -- Diagnostics
    bind('n', 'gl', '<cmd>lua vim.diagnostic.setloclist()<cr>', noremap)
    bind('n', 'gn', '<cmd>lua vim.diagnostic.goto_next()<cr>', noremap)
    bind('n', 'gp', '<cmd>lua vim.diagnostic.goto_prev()<cr>', noremap)
end)
vim.cmd [[autocmd CursorHold,CursorHoldI * lua vim.diagnostic.open_float(nil, {focus=false})]]

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

require'lspconfig'.sumneko_lua.setup {
    settings = {
       Lua = {
          diagnostics = {
            globals = {'vim'}
          }
        },
    }
}

-- Others
vim.o.fillchars = 'eob: ' -- remove ~ sign
require("todo-comments").setup {}
require('pqf').setup()
require('scrollview').setup()
require('wilder').setup()
require('dd').setup({
  timeout = 1000
})

require("filetype").setup({})
require("neogit").setup({
  integrations = {
    diffview = true
  },
})

-- End
