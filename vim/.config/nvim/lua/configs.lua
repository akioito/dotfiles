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
vim.api.nvim_set_option("clipboard", "unnamed")

vim.opt.title = true

if vim.g.neovide then
  vim.g.neovide_remember_window_size = true
  vim.g.neovide_remember_window_position = true
  vim.g.neovide_input_use_logo = 1
  vim.g.neovide_input_macos_alt_is_meta = true
end

-- Treesitter
if not vim.g.vscode then
  require("nvim-treesitter.configs").setup {
    ensure_installed = { "python", "rust", "vim", "json", "svelte", "lua", "markdown", "typescript", "vue", "html" },
    highlight = {
      enable = true,
      additional_vim_regex_highlighting = false,
    },
    matchup = {
      enable = true,
    },
  }
end

-- LSP
require("mason").setup({
  ui = {
    icons = {
      package_installed = "✓",
      package_pending = "➜",
      package_uninstalled = "✗"
    }
  }
})
require("mason-lspconfig").setup({})
local lsp = require('lsp-zero')
lsp.preset('recommended')

lsp.set_preferences({
  set_lsp_keymaps = false
})

lsp.on_attach(function(client, bufnr)
  local noremap = { buffer = bufnr, remap = false }
  -- LSP actions
  map('n', 'md', '<cmd>lua vim.lsp.buf.definition()<cr>', noremap)
  map('n', 'gh', '<cmd>lua vim.lsp.buf.hover()<cr>', noremap)
  map('n', 'mr', '<cmd>lua vim.lsp.buf.references()<cr>', noremap)
  -- Diagnostics
  map('n', 'gl', '<cmd>lua vim.diagnostic.setloclist()<cr>', noremap)
  map('n', 'gn', '<cmd>lua vim.diagnostic.goto_next()<cr>', noremap)
  map('n', 'gp', '<cmd>lua vim.diagnostic.goto_prev()<cr>', noremap)
  if client.supports_method('textDocument/documentHighlight') then
    vim.api.nvim_exec([[
      augroup lsp_document_highlight
          autocmd! * <buffer>
          autocmd CursorHold  <buffer> lua vim.lsp.buf.document_highlight()
          autocmd InsertEnter <buffer> lua vim.lsp.buf.clear_references()
          autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
      augroup END
      ]], false)
  end
  vim.diagnostic.config {
    update_in_insert = false,
  }
end)
vim.cmd [[autocmd CursorHold,CursorHoldI * lua vim.diagnostic.open_float(nil, {focus=false})]]

local cmp = require('cmp')
local cmp_default_maps = lsp.defaults.cmp_mappings()
local cmp_map = cmp.mapping
local cmp_option = { behavior = cmp.SelectBehavior.Replace, select = true }
cmp_default_maps['<Down>'] = cmp_map.select_next_item(cmp_option)
cmp_default_maps['<Tab>'] = cmp_map.select_next_item(cmp_option)
cmp_default_maps['<Up>'] = cmp_map.select_prev_item(cmp_option)
cmp_default_maps['<S-Tab>'] = cmp_map.select_prev_item(cmp_option)
cmp_default_maps['<CR>'] = cmp.mapping.confirm({
  behavior = cmp.ConfirmBehavior.Replace,
  select = false,
})

lsp.setup_nvim_cmp({
  sources = {
    { name = 'codeium' },

    { name = 'nvim_lsp' },
    { name = 'buffer' },
    { name = 'path' },
    { name = 'nvim_lsp_signature_help' },
  },
  mapping = cmp_default_maps
})
lsp.format_on_save({
  servers = {
    ['lua_ls'] = { 'lua' },
    -- ['rust_analyzer'] = {'rust'},
  }
})
lsp.nvim_workspace()
lsp.setup()

require("codeium").setup({})

require("null-ls").setup()
require("mason-null-ls").setup({
  automatic_setup = true,
})
-- Others
vim.o.fillchars = 'eob: ' -- remove ~ sign
require("todo-comments").setup({})
require('pqf').setup()

require("stickybuf").setup({})
require("tidy").setup({
  filetype_exclude = { "markdown", "diff" },
})
require("indent_blankline").setup {
  show_current_context = true,
}
require("treesitter-context").setup({})
vim.cmd([[ let g:neo_tree_remove_legacy_commands = 1 ]])
require("neo-tree").setup {
  buffers = {
    follow_current_file = true, -- This will find and focus the file in the active buffer every
    -- time the current file is changed while the tree is open.
    group_empty_dirs = true,    -- when true, empty folders will be grouped together
    show_unloaded = true,
  },
}
require 'hop'.setup { keys = 'etovxqpdygfblzhckisuran' }
map('n', 'f', '<cmd>HopWord<cr>')
if not vim.g.vscode then
  require("scrollbar").setup({
    handle = {
      blend = 0,
      color = '#7c7c7c',
    },
  })
end
require('toggle_lsp_diagnostics').init()

-- End
