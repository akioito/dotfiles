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
hi endofbuffer  guibg=white 
hi Folded       guifg=#808080   guibg=white 
hi LineNr       guifg=#c10b23 guibg=#ffffff 
hi MatchParen   guibg=#cddae5
hi NonText      guifg=#f2f2f2 guibg=#f2f2f2 gui=NONE
hi SignColumn   guibg=white
hi StatusLine   guifg=#ffffff   guibg=#43c464   gui=bold
hi StatusLineNC guifg=#9bd4a9   guibg=#51b069
hi VertSplit    guifg=#fafafa   guibg=#fafafa
hi Visual       guibg=Yellow
" hi defLine      guibg=#fff2f2
" hi defLine      guibg=#fff8f8   

" Specials
hi Todo         guifg=#e50808   guibg=#dbf3cd   gui=bold
hi Title        guifg=#000000   gui=bold
hi Special      guifg=#fd8900

" Syntax Elements
hi Function     guifg=Blue                      

" Python Highlighting
hi pythonBuiltinFunc     guifg=Red
hi pythonBuiltinObj      guifg=Red
hi pythonComment         guifg=#747d8f 
hi pythonConditional     guifg=#9f40c0
hi pythonFunction        guifg=#3f63b0    
hi pythonMethod          guifg=Darkorange
hi pythonNumber          guifg=Orangered
hi pythonPreCondit       guifg=#487e52
hi pythonRepeat          guifg=#0100C8
hi pythonSpecial         guifg=Blue
hi pythonStatement       guifg=#2f7a71
hi pythonStatementSpecial guifg=#28C101  gui=bold "guibg=#fff8f8
hi pythonString          guifg=#28C101 "#0BB634
hi pythonTripleString    guifg=darkgreen

" HTML / JS
hi htmlString            guifg=#0BB634
hi jsStringS             guifg=#0BB634

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
hi jsString            guifg=#28C101 
hi jsComment           guifg=#F09868  

" http://www.unpack.site/cash.me

" {{{ Diff highlighting
hi DiffAdd    ctermfg=233 ctermbg=194 guifg=#003300 guibg=#DDFFDD gui=none cterm=none
hi DiffChange ctermbg=255  guibg=#ececec gui=none   cterm=none
hi DiffText   ctermfg=233  ctermbg=189  guifg=#000033 guibg=#DDDDFF gui=none cterm=none
hi DiffDelete ctermfg=252 ctermbg=224   guifg=#DDCCCC guibg=#FFDDDD gui=none    cterm=none
" }}}

" LeaderF
highlight def Lf_hl_cursorline guifg=Black ctermfg=226

" Rust
hi rustCommentLineDoc       guifg=darkgreen
hi rustSelf                 guifg=#0100C8    gui=bold
hi rustString               guifg=#28C101 
hi rustCommentLine          guifg=#F09868 

" Go
hi goString                 guifg=#28C101  
hi goRawString              guifg=#28C101
hi goSameId                 guibg=#f4f597

" TypeScript
hi typescriptString               guifg=#28C101
hi typescriptStringD              guifg=#28C101  
hi typescriptDocComment           guifg=darkgreen
hi typescriptLineComment          guifg=#F09868
hi typescriptDocTags              guifg=#690dad 

" vem-tabline
highlight VemTablineNormal           term=reverse cterm=none ctermfg=0   ctermbg=251 guifg=#242424 guibg=#ffffff gui=none 
highlight VemTablineSelected         term=bold    cterm=bold ctermfg=0   ctermbg=255 guifg=#242424 guibg=yellow  gui=bold
highlight VemTablineNumber           term=reverse cterm=none ctermfg=239 ctermbg=251 guifg=#242424 guibg=#ffffff gui=none
highlight VemTablineNumberShown      term=reverse cterm=none ctermfg=0   ctermbg=251 guifg=#242424 guibg=#ffffff gui=none

" treesitter
hi jsLineComment guifg=#F09868   
hi jsCommonJS    guifg=#ff00ff 

hi TSComment            guifg=#747d8f
hi TSConditional        guifg=#0100C8  
hi TSConstBuiltin       guifg=#2f7a71 
hi TSConstant           guifg=#c34146
hi TSKeywordFunction    guifg=#28C101
hi TSMethod             guifg=#3f63b0
hi TSString             guifg=#28C101 
hi TSType               guifg=#ae6b09 
hi TSTypeBuiltin        guifg=#ae6b09
hi TSVariableBuiltin    guifg=#0100C8

" End