-- configs.lua

local map = vim.keymap.set

local hl = function(group, opts)
    opts.default = true
    vim.api.nvim_set_hl(0, group, opts)
end

-- feat!: remove obsolete TS* highlight groups
https://github.com/nvim-treesitter/nvim-treesitter/commit/42ab95d5e11f247c6f0c8f5181b02e816caa4a4f#commitcomment-87014462

-- Misc {{{
hl('@comment', {link = 'Comment'})
-- hl('@error', {link = 'Error'})
hl('@none', {bg = 'NONE', fg = 'NONE'})
hl('@preproc', {link = 'PreProc'})
hl('@define', {link = 'Define'})
hl('@operator', {link = 'Operator'})
-- }}}

-- Punctuation {{{
hl('@punctuation.delimiter', {link = 'Delimiter'})
hl('@punctuation.bracket', {link = 'Delimiter'})
hl('@punctuation.special', {link = 'Delimiter'})
-- }}}

-- Literals {{{
hl('@string', {link = 'String'})
hl('@string.regex', {link = 'String'})
hl('@string.escape', {link = 'SpecialChar'})
hl('@string.special', {link = 'SpecialChar'})

hl('@character', {link = 'Character'})
hl('@character.special', {link = 'SpecialChar'})

hl('@boolean', {link = 'Boolean'})
hl('@number', {link = 'Number'})
hl('@float', {link = 'Float'})
-- }}}

-- Functions {{{
hl('@function', {link = 'Function'})
hl('@function.call', {link = 'Function'})
hl('@function.builtin', {link = 'Special'})
hl('@function.macro', {link = 'Macro'})

hl('@method', {link = 'Function'})
hl('@method.call', {link = 'Function'})

hl('@constructor', {link = 'Special'})
hl('@parameter', {link = 'Identifier'})
-- }}}

-- Keywords {{{
hl('@keyword', {link = 'Keyword'})
hl('@keyword.function', {link = 'Keyword'})
hl('@keyword.operator', {link = 'Keyword'})
hl('@keyword.return', {link = 'Keyword'})

hl('@conditional', {link = 'Conditional'})
hl('@repeat', {link = 'Repeat'})
hl('@debug', {link = 'Debug'})
hl('@label', {link = 'Label'})
hl('@include', {link = 'Include'})
hl('@exception', {link = 'Exception'})
-- }}}

-- Types {{{
hl('@type', {link = 'Type'})
hl('@type.builtin', {link = 'Type'})
hl('@type.qualifier', {link = 'Type'})
hl('@type.definition', {link = 'Typedef'})

hl('@storageclass', {link = 'StorageClass'})
hl('@attribute', {link = 'PreProc'})
hl('@field', {link = 'Identifier'})
hl('@property', {link = 'Identifier'})
-- }}}

-- Identifiers {{{
hl('@variable', {link = 'Normal'})
hl('@variable.builtin', {link = 'Special'})

hl('@constant', {link = 'Constant'})
hl('@constant.builtin', {link = 'Special'})
hl('@constant.macro', {link = 'Define'})

hl('@namespace', {link = 'Include'})
hl('@symbol', {link = 'Identifier'})
-- }}}

-- Text {{{
hl('@text', {link = 'Normal'})
hl('@text.strong', {bold = true})
hl('@text.emphasis', {italic = true})
hl('@text.underline', {underline = true})
hl('@text.strike', {strikethrough = true})
hl('@text.title', {link = 'Title'})
hl('@text.literal', {link = 'String'})
hl('@text.uri', {link = 'Underlined'})
hl('@text.math', {link = 'Special'})
hl('@text.environment', {link = 'Macro'})
hl('@text.environment.name', {link = 'Type'})
hl('@text.reference', {link = 'Constant'})

hl('@text.todo', {link = 'Todo'})
hl('@text.note', {link = 'SpecialComment'})
hl('@text.warning', {link = 'WarningMsg'})
hl('@text.danger', {link = 'ErrorMsg'})
-- }}}

-- Tags {{{
hl('@tag', {link = 'Tag'})
hl('@tag.attribute', {link = 'Identifier'})
hl('@tag.delimiter', {link = 'Delimiter'})
-- }}}

-- Neovide
-- see ~/.local/share/nvim/neovide-settings.json
--     https://github.com/neovide/neovide/issues/1263#issuecomment-1094628137
if vim.g.neovide then
  map('n', '<D-s>', ':w<CR>') -- Save
  map('v', '<D-c>', '"+y') -- Copy
  map('n', '<D-v>', '"+P') -- Paste normal mode
  map('v', '<D-v>', '"+P') -- Paste visual mode
  map('c', '<D-v>', '<C-R>+') -- Paste command mode
  map('i', '<D-v>', '<ESC>+Pi') -- Paste insert mode
  vim.api.nvim_set_option("clipboard", "unnamed")

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

-- Treesiter
require("nvim-treesitter.configs").setup {
  ensure_installed = { "python", "rust", "vim", "json", "svelte", "lua", "markdown", "typescript", "css", "html" },
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

lsp.on_attach(function(_, bufnr)
  local noremap = { buffer = bufnr, remap = false }
  -- LSP actions
  map('n', 'md', '<cmd>lua vim.lsp.buf.definition()<cr>', noremap)
  map('n', 'gh', '<cmd>lua vim.lsp.buf.hover()<cr>', noremap)
  map('n', 'mr', '<cmd>lua vim.lsp.buf.references()<cr>', noremap)
  -- Diagnostics
  map('n', 'gl', '<cmd>lua vim.diagnostic.setloclist()<cr>', noremap)
  map('n', 'gn', '<cmd>lua vim.diagnostic.goto_next()<cr>', noremap)
  map('n', 'gp', '<cmd>lua vim.diagnostic.goto_prev()<cr>', noremap)
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

lsp.setup_nvim_cmp({
  mapping = cmp_default_maps
})

lsp.configure('pylsp', {
  settings = {
    pylsp = {
      plugins = {
        flake8 = { enabled = true },
        pycodestyle = { enabled = false },
        pyflakes = { enabled = false },
        pylint = { enabled = false },
        mccabe = { enabled = false },
      },
    },
  },
})

lsp.configure('sumneko_lua', {
  settings = {
    Lua = {
      diagnostics = {
        globals = { 'vim' }
      }
    },
  }
})

lsp.setup()

-- Others
vim.o.fillchars = 'eob: ' -- remove ~ sign
require("todo-comments").setup({})
require('pqf').setup()
require('scrollview').setup()

local wilder = require('wilder')
wilder.setup({ modes = { ':', '/', '?' } })
wilder.set_option('renderer', wilder.popupmenu_renderer({
  highlighter = wilder.basic_highlighter(),
}))

require('dd').setup({
  timeout = 1000
})

require("filetype").setup({})
require("stickybuf").setup({})
require("tidy").setup({
  filetype_exclude = { "markdown", "diff" },
})

-- End
