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
hi StatusLine   guifg=#ffffff   guibg=#43c464   gui=bold
hi StatusLineNC guifg=#9bd4a9   guibg=#51b069
hi VertSplit    guifg=#fafafa   guibg=#fafafa
"hi Folded       guifg=#808080   guibg=white 
hi SignColumn   guibg=white
hi CursorLine   guibg=#ffffa2
hi MatchParen   guibg=#cddae5
hi Visual       guibg=Yellow
hi LineNr       guifg=#808080 guibg=#f2f2f2 gui=NONE
hi NonText      guifg=#f2f2f2 guibg=#f2f2f2 gui=NONE
hi defLine      guibg=#fff2f2
"hi defLine      guibg=#fff8f8

" Specials
hi Todo         guifg=#e50808   guibg=#dbf3cd   gui=bold
hi Title        guifg=#000000   gui=bold
hi Special      guifg=#fd8900

" Syntax Elements
hi Function     guifg=Blue                      gui=bold

" Python Highlighting
hi pythonStatement       guifg=#0100C8    gui=bold
hi pythonRepeat          guifg=#0100C8    gui=bold
hi pythonConditional     guifg=#0100C8    gui=bold
hi pythonComment         guifg=#00b418 "Green variant
hi pythonFunction        guifg=#0100C8    gui=bold
hi pythonTripleString    guifg=darkgreen
hi pythonBuiltinObj      guifg=Red
hi pythonMethod          guifg=Darkorange
hi pythonNumber          guifg=Orangered
hi pythonBuiltinFunc     guifg=Red
hi pythonSpecial         guifg=Blue
hi pythonPreCondit       guifg=#487e52
hi pythonStatementSpecial guifg=#a52a2a  gui=bold "guibg=#fff8f8

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

" 
" hi javascriptString    guifg=black    gui=bold
hi javascriptAServices guifg=darkblue gui=bold
