" MyColor Color Scheme
" ========================
"
set background=light

hi clear
if exists("syntax_on")
  syntax reset
endif

let colors_name = "mycolor"

" Interface Elements
hi CursorLine   guibg=#ffffa2
hi Cursor       guifg=#ffffff guibg=#f26c17
hi endofbuffer  guibg=white
hi Folded       guifg=#808080 guibg=white
hi LineNr       guifg=#0BB634 guibg=#fbfbfb
hi MatchParen   guibg=#cddae5
hi NonText      guifg=#f2f2f2 guibg=#f2f2f2 gui=NONE
hi SignColumn   guibg=#ffffa2
hi CursorLineNr guifg=#000000 guibg=#ffffa2
hi StatusLine   guifg=#ffffff   guibg=#43c464   gui=bold
hi StatusLineNC guifg=#9bd4a9   guibg=#51b069
hi VertSplit    guifg=#fafafa   guibg=#fafafa
hi Visual       guibg=Yellow
" hi defLine      guibg=#fff2f2
" hi defLine      guibg=#fff8f8

" Specials
hi Todo         guifg=#e50808   guibg=#dbf3cd   gui=bold
hi Title        guifg=#000000   gui=bold
" hi Special      guifg=#fd8900

" Syntax Elements
" hi Function     guifg=Blue

" Python Highlighting
hi pythonBuiltinFunc     guifg=Red gui=italic
hi pythonBuiltinObj      guifg=Red gui=italic
hi pythonComment         guifg=#747d8f gui=italic
hi pythonConditional     guifg=#9f40c0 gui=italic
hi pythonFunction        guifg=#3f63b0 gui=italic
hi pythonMethod          guifg=Darkorange gui=italic
hi pythonNumber          guifg=Orangered gui=italic
hi pythonPreCondit       guifg=#487e52 gui=italic
hi pythonRepeat          guifg=#9f40c0 gui=italic
hi pythonSpecial         guifg=Blue gui=italic
hi pythonStatement       guifg=#9f40c0 gui=italic
hi pythonStatementSpecial guifg=#28C101 gui=italic
hi pythonString          guifg=#28C101  gui=italic
hi pythonTripleString    guifg=darkgreen gui=italic

" HTML / JS
hi htmlString            guifg=#0BB634 gui=italic
hi jsStringS             guifg=#0BB634 gui=italic

" :call HexHighlight() to see the Color

" Status Line
hi User1 guifg=#ffdad8  guibg=#880c0e
hi User2 guifg=#000000  guibg=#F4905C
hi User3 guifg=#292b00  guibg=#f4f597
hi User4 guifg=#112605  guibg=#aefe7B
hi User5 guifg=#051d00  guibg=#7dcc7d
hi User7 guifg=#ffffff  guibg=#880c0e gui=bold
hi User8 guifg=#ffffff  guibg=#5b7fbb
hi User9 guifg=#ffffff  guibg=#810085
hi User0 guifg=#ffffff  guibg=#094afe

"
hi PmenuSel     guifg=#dddd00 guibg=#1f82cd
hi Pmenu        guifg=#fd8900 guibg=#ffffa2
hi CocFloating  guifg=#fd8900 guibg=#ffffa2
hi CocHighlightText guibg=#f8edeb ctermbg=Cyan

" hi javascriptString    guifg=black    gui=bold
hi javascriptAServices guifg=darkblue gui=bold
hi jsString            guifg=#28C101 gui=italic
hi jsComment           guifg=#F09868 gui=italic

" http://www.unpack.site/cash.me

" {{{ Diff highlighting
hi DiffAdd    ctermfg=233 ctermbg=194 guifg=#003300 guibg=#DDFFDD gui=none cterm=none
hi DiffChange ctermbg=255  guibg=#ececec gui=none   cterm=none
hi DiffText   ctermfg=233  ctermbg=189  guifg=#000033 guibg=#DDDDFF gui=none cterm=none
hi DiffDelete ctermfg=252 ctermbg=224   guifg=#DDCCCC guibg=#FFDDDD gui=none cterm=none
" }}}

" Rust
hi rustCommentLineDoc       guifg=darkgreen gui=italic
hi rustSelf                 guifg=#0100C8 gui=italic
hi rustString               guifg=#28C101 gui=italic
hi rustCommentLine          guifg=#F09868 gui=italic
hi rustTrait                guifg=#277b45 gui=bold

" Go
hi goString                 guifg=#28C101
hi goRawString              guifg=#28C101
hi goSameId                 guibg=#f4f597

" TypeScript
hi typescriptString               guifg=#28C101 gui=italic
hi typescriptStringD              guifg=#28C101 gui=italic
hi typescriptDocComment           guifg=darkgreen gui=italic
hi typescriptLineComment          guifg=#F09868 gui=italic
hi typescriptDocTags              guifg=#690dad gui=italic

" vem-tabline
highlight VemTablineNormal           term=reverse cterm=none ctermfg=0   ctermbg=251 guifg=#242424 guibg=#ffffff gui=none
highlight VemTablineSelected         term=bold    cterm=bold ctermfg=0   ctermbg=255 guifg=#242424 guibg=yellow  gui=bold
highlight VemTablineNumber           term=reverse cterm=none ctermfg=239 ctermbg=251 guifg=#242424 guibg=#ffffff gui=none
highlight VemTablineNumberShown      term=reverse cterm=none ctermfg=0   ctermbg=251 guifg=#242424 guibg=#ffffff gui=none

" treesitter
hi jsLineComment guifg=#F09868 gui=italic
hi jsCommonJS    guifg=#ff00ff gui=italic

hi Comment            guifg=#747d8f gui=italic
hi Conditional        guifg=#9f40c0 gui=italic
hi Constant           guifg=#c34146 gui=italic
hi ConstantBuiltin    guifg=#c34146 gui=italic
hi Function           guifg=#9f40c0 gui=italic
hi Keyword            guifg=#2f7a71 gui=italic
hi KeywordFunction    guifg=#28C101 gui=italic
hi KeywordOperator    guifg=#fd8900 gui=italic
hi KeywordReturn      guifg=#9f40c0 gui=italic

hi Normal             guibg=#ffffff ctermbg=255
hi Repeat             guifg=#9f40c0 gui=italic
hi Special            guifg=#9f40c0 gui=italic
hi String             guifg=#28C101 gui=italic
hi PreProc            guifg=#9f40c0 gui=italic
hi rustModPath        guifg=#9f40c0 gui=italic

hi IndentBlanklineContextChar guifg=#ffdad8 gui=nocombine
hi IndentBlanklineChar        guifg=#f8edeb gui=nocombine

hi MatchWord                  guifg=#c10b23 gui=nocombine

hi CurrentWord                guibg=floralwhite
hi CurrentWordTwins           guibg=floralwhite

hi vimGroup           guifg=#277a46 gui=bold
hi VimHighlight       guifg=#972226 gui=bold
hi VimMap             guifg=#972226 gui=bold
hi VimCommand         guifg=#972226 gui=bold

highlight lspReference      guifg=#000000 guibg=#ffffa2

" End
