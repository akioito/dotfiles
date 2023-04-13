-- highlight_groups.lua

local hl = function(group, opts)
    opts.default = true
    vim.api.nvim_set_hl(0, group, opts)
end

-- feat!: remove obsolete TS* highlight groups
-- https://github.com/nvim-treesitter/nvim-treesitter/commit/42ab95d5e11f247c6f0c8f5181b02e816caa4a4f#commitcomment-87014462

-- Misc {{{
hl('@comment', {link = 'Comment'})
hl('@error', {link = 'Error'})
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
hl('@string.regex', {link = 'StringRegex'})
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
hl('@function.call', {link = 'FunctionCall'})
hl('@function.builtin', {link = 'FunctionBuiltin'})
hl('@function.macro', {link = 'FunctionMacro'})

hl('@method', {link = 'Method'})
hl('@method.call', {link = 'MethodCall'})

hl('@constructor', {link = 'Constructor'})
hl('@parameter', {link = 'Identifier'})
-- }}}

-- Keywords {{{
hl('@keyword', {link = 'Keyword'})
hl('@keyword.function', {link = 'KeywordFunction'})
hl('@keyword.operator', {link = 'KeywordOperator'})
hl('@keyword.return', {link = 'KeywordReturn'})

hl('@conditional', {link = 'Conditional'})
hl('@repeat', {link = 'Repeat'})
hl('@debug', {link = 'Debug'})
hl('@label', {link = 'Label'})
hl('@include', {link = 'Include'})
hl('@exception', {link = 'Exception'})
-- }}}

-- Types {{{
hl('@type', {link = 'Type'})
hl('@type.builtin', {link = 'TypeBuiltin'})
hl('@type.qualifier', {link = 'TypeQualifier'})
hl('@type.definition', {link = 'TypedefDefinition'})

hl('@storageclass', {link = 'StorageClass'})
hl('@attribute', {link = 'PreProc'})
hl('@field', {link = 'Identifier'})
hl('@property', {link = 'Identifier'})
-- }}}

-- Identifiers {{{
hl('@variable', {link = 'Normal'})
hl('@variable.builtin', {link = 'VariableBuiltin'})

hl('@constant', {link = 'Constant'})
hl('@constant.builtin', {link = 'ConstantBuiltin'})
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
hl('@text.literal', {link = 'StringLiteral'})
hl('@text.uri', {link = 'Underlined'})
hl('@text.math', {link = 'TexMath'})
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
