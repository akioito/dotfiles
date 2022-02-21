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

require('lspconfig').pyright.setup{}

local nvim_lsp = require('lspconfig')

local lsp_installer = require("nvim-lsp-installer")
lsp_installer.on_server_ready(function(server)
    local opts = {}
    opts.capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
    server:setup(opts)
    vim.cmd [[ do User LspAttachBuffers ]]
end)

local cmp = require('cmp')

local t = function(str)
    return vim.api.nvim_replace_termcodes(str, true, true, true)
end

local check_back_space = function()
    local col = vim.fn.col(".") - 1
    return col == 0 or vim.fn.getline("."):sub(col, col):match("%s") ~= nil
end

cmp.setup {
    -- https://github.com/hrsh7th/nvim-cmp/wiki/Example-mappings
    formatting = {
        format = function(entry, vim_item)
            -- fancy icons and a name of kind
            vim_item.kind = require("lspkind").presets.default[vim_item.kind] ..
                                " " .. vim_item.kind
            -- set a name for each source
            vim_item.menu = ({
                buffer = "[Buffer]",
                nvim_lsp = "[LSP]",
                nvim_lua = "[Lua]",
                path = "[Path]",
                emoji = "[Emoji]"
            })[entry.source.name]
            return vim_item
        end
    },
    sources = {
        {name = 'buffer'}, 
        {name = 'nvim_lsp'}, 
        {name = "nvim_lua"}, 
        {name = "path"},
        {name = 'cmdline'},
        {name = 'fish'}
    },    
    mapping = {
        ['<Up>'] = cmp.mapping.select_prev_item(),
        ['<Down>'] = cmp.mapping.select_next_item(),
        ['<C-d>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<C-e>'] = cmp.mapping.close(),
        ['<CR>'] = cmp.mapping.confirm({
            behavior = cmp.ConfirmBehavior.Insert,
            select = true
        }),
        ["<Tab>"] = cmp.mapping(function(fallback)
          -- This little snippet will confirm with tab, and if no entry is selected, will confirm the first item
          if cmp.visible() then
            local entry = cmp.get_selected_entry()
        if not entry then
          cmp.select_next_item({ behavior = cmp.SelectBehavior.Select })
        else
          cmp.confirm()
        end
          else
            fallback()
          end
        end, {"i","s","c",}),
    },
    snippet = {expand = function(args) vim.fn["UltiSnips#Anon"](args.body) end},
    completion = {completeopt = 'menu,menuone,noinsert'}
}

require('rust-tools').setup({})
require("better_escape").setup({})

-- End
