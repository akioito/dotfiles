-- configs.lua

local map = vim.keymap.set

-- Neovide
-- see ~/.local/share/nvim/neovide-settings.json  
--     https://github.com/neovide/neovide/issues/1263#issuecomment-1094628137  
if vim.g.neovide then
  map('n', '<D-s>', ':w<CR>')  -- Save
  map('v', '<D-c>', '"+y')     -- Copy
  map('n', '<D-v>', '"+P')     -- Paste normal mode
  map('v', '<D-v>', '"+P')     -- Paste visual mode
  map('c', '<D-v>', '<C-R>+')  -- Paste command mode
  map('i', '<D-v>', '<C-R>+')  -- Paste insert mode

  vim.g.neovide_remember_window_size = true
  vim.g.neovide_remember_window_position = true
  vim.g.neovide_input_use_logo = 1
  vim.g.neovide_input_macos_alt_is_meta=true
  vim.opt.title=true

  vim.api.nvim_command([[
    augroup Neovide
      autocmd BufWritePost * :wshada
    augroup END
    ]])
end

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
    -- LSP actions
    map('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<cr>', noremap)
    map('n', 'gh', '<cmd>lua vim.lsp.buf.hover()<cr>', noremap)
    map('n', 'gr', '<cmd>lua vim.lsp.buf.references()<cr>', noremap)
    -- Diagnostics
    map('n', 'gl', '<cmd>lua vim.diagnostic.setloclist()<cr>', noremap)
    map('n', 'gn', '<cmd>lua vim.diagnostic.goto_next()<cr>', noremap)
    map('n', 'gp', '<cmd>lua vim.diagnostic.goto_prev()<cr>', noremap)
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
