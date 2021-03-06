if !&compatible
  " Enable no Vi compatible commands.
  set nocompatible
endif

" Required:
call plug#begin(has('nvim') ? '~/.config/nvim/plugged' : '~/.vim/plugged')

if has("nvim")
  Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

lua <<EOF
    require'nvim-treesitter.configs'.setup {
      highlight = { enable = true },
      incremental_selection = { enable = true },
      indent = { enable = true },
      rainbow = { enable = true },
    }
EOF
endif
  
Plug 'Shougo/vimproc.vim', { 'do': 'make' }

if has("gui_macvim") || has("gui_vimr")  
  let macvim_hig_shift_movement = 1
  " Text-to-speech
  vnoremap <silent><M-s> "xy:call system('say '. shellescape(@x) .' &')<CR> 
  vnoremap <BS> d
endif

if !has("nvim")
  syntax enable  
  Plug 'Yggdroot/indentLine' 
    let g:indentLine_color_gui = '#EFEFEF'
    let g:indentLine_fileType = ['html', 'python']
  Plug 'othree/javascript-libraries-syntax.vim' 
  Plug 'pangloss/vim-javascript', {'for': ['javascript']}  
endif

Plug 'osyo-manga/vim-watchdogs' 
Plug 'thinca/vim-quickrun'
Plug 'osyo-manga/shabadou.vim'
Plug 'KazuakiM/vim-qfsigns'
Plug 'dannyob/quickfixstatus'
  let g:quickrun_config = {
  \    'watchdogs_checker/_' : {
  \        "runner/vimproc/updatetime" : 40,
  \        'hook/qfsigns_update/enable_exit':   1,
  \        'hook/qfsigns_update/priority_exit': 3,},}
  let g:quickrun_config["python/watchdogs_checker"] = {
  \	"type" : "watchdogs_checker/flake8"
  \}
    let g:quickrun_config["javascript/watchdogs_checker"] = {
  \	"type" : "watchdogs_checker/eslint"
  \}  

Plug 'dag/vim-fish'
Plug 'chrisbra/vim-diff-enhanced'
Plug 'elzr/vim-json'
  let g:vim_json_syntax_conceal = 0

Plug 'godlygeek/tabular'
Plug 'rhysd/vim-gfm-syntax'
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install' }
  
Plug 'cespare/vim-toml'
Plug 'keith/swift.vim'
Plug 'tpope/vim-sleuth'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround' "{
  " Assuming | as a cursor
    " fo|o - ysiw' - 'foo'
    " 'fo|o' - ds' - foo
    " 'fo|o' - cs'" - "foo"
  " ds ･･･ d(delete)s(surround)
  " di ･･･ d(delete)i(inside)
  " cs ･･･ c(change)s(surround)
  " ci ･･･ c(change)i(inside)
  " ys$ ･･･y(yank)s(surround)line
  " ysiw ･･･ y(yank)s(surrond)iw(inner word)
  " gvS' ･･･ visual surroud with char
"}
Plug 'jiangmiao/auto-pairs' "{
  " <M-e> Fast Wrap (|)'hello' -> ('hello')
  " <M-n> Jump to next closed pair
"}
Plug 'rstacruz/sparkup' 
  " https://github.com/rstacruz/sparkup
Plug 'tomtom/tcomment_vim' "{
 noremap  <D-1> <ESC>:TComment
 vnoremap <D-1> <ESC>gv:TComment<cr>
 inoremap <D-1> <ESC>:TComment<cr> 
 let g:tcomment#filetype#guess_svelte = 1 
"} 

Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'
Plug 'junegunn/gv.vim'   " :GV then gb to jump to GiHub commit page
Plug 'mhinz/vim-signify'
Plug 'akioito/vim-project-files'
  noremap op :PyOpenProject<CR>
" Plug 'walm/jshint.vim'
Plug 'mkitt/browser-refresh.vim'
Plug 'vim-scripts/a.vim'
Plug 'vim-scripts/python_match.vim'
Plug 'vim-scripts/grep.vim' "{
if has('mac')
  " see https://github.com/BurntSushi/ripgrep
  set grepprg=rg\ --vimgrep
  let Grep_Path = 'rg --vimgrep'
endif
"}

Plug 'AndrewRadev/simple_bookmarks.vim'
Plug 'henrik/vim-reveal-in-finder'
" Plug 'andymass/vim-matchup' "{
"   let g:matchup_matchparen_deferred = 1
" "}
Plug 'junegunn/vim-easy-align' "{
  " Shift + V, select and Enter
  vnoremap <Enter> :EasyAlign
"}

" Plug 'majutsushi/tagbar' "{ Some customization
  let g:tagbar_autoclose   = 1
  let g:tagbar_sort        = 0
  let g:tagbar_compact     = 1
  let g:tagbar_indent      = 1
  let g:tagbar_singleclick = 1
  let g:tagbar_width       = 25
  if has("mac") 
    let g:tagbar_ctags_bin   = '/usr/local/bin/ctags'
  endif
  nnoremap <C-@>      :TagbarToggle<CR> 
"}

Plug 'ap/vim-css-color', {'for': ['css','scss','sass','less','styl']}
Plug 'evanleck/vim-svelte', {'branch': 'main'}
Plug 'leafoftree/vim-svelte-plugin'
Plug 'chr4/nginx.vim'

Plug 'Galicarnax/vim-regex-syntax'
Plug 'roxma/nvim-yarp'
Plug 'roxma/vim-hug-neovim-rpc'
 

Plug 'el-iot/buffer-tree'
  let g:buffertree_compress = 1 

Plug 'raghur/vim-ghost', {'do': ':GhostInstall'}
  " let g:ghost_autostart = 1
  " Shortcut for browser textarea -> Shit+Cmd+k
    function! s:SetupGhostBuffer()
        if match(expand("%:a"), '\v/ghost-(github|reddit)\.com-')
            set ft=markdown
        endif
    endfunction

    augroup vim-ghost
        au!
        au User vim-ghost#connected call s:SetupGhostBuffer()
    augroup end

Plug 'SirVer/ultisnips'  
Plug 'honza/vim-snippets'


Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'antoinemadec/coc-fzf', {'branch': 'release'}
    inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
    nmap <silent> gd <Plug>(coc-definition)
    nmap <silent> gy <Plug>(coc-type-definition)
    nmap <silent> gi <Plug>(coc-implementation)
    nmap <silent> gr <Plug>(coc-references)
    nmap <silent> gh :call CocAction('doHover')<cr> 

let $BAT_THEME = 'GitHub'
let $FZF_PREVIEW_PREVIEW_BAT_THEME = 'GitHub'

augroup coc
  autocmd!
  autocmd FileType qf call feedkeys("\<C-w>k")
    autocmd CursorHold * silent call CocActionAsync('highlight')
augroup end 
noremap jd nope " When not supported...


Plug 'rust-lang/rust.vim'
  let g:rustfmt_autosave = 1
Plug 'Glench/Vim-Jinja2-Syntax'  " Alse used for askama template
Plug 'chiedo/vim-case-convert'
Plug 'vmchale/just-vim' 
Plug 'frazrepo/vim-rainbow'
Plug 'airblade/vim-rooter'
Plug 'tyru/open-browser.vim'
  let g:netrw_nogx = 1 " disable netrw's gx mapping.
  nmap gb <Plug>(openbrowser-open)
  vmap gb <Plug>(openbrowser-open)

Plug 'leafgarland/typescript-vim'
Plug 'preservim/nerdtree'
let g:NERDTreeMouseMode=3
" let g:NERDTreeQuitOnOpen=1
let NERDTreeIgnore=['target', '\~$']
nnoremap <D-t> :NERDTreeToggleVCS<CR>
autocmd BufEnter * if bufname('#') =~ 'NERD_tree_\d\+' && bufname('%') !~ 'NERD_tree_\d\+' && winnr('$') > 1 |
    \ let buf=bufnr() | buffer# | execute "normal! \<C-W>w" | execute 'buffer'.buf | endif

Plug 'romainl/vim-cool'
  let g:CoolTotalMatches = 1
Plug 'rhysd/clever-f.vim'

Plug 'AndrewRadev/splitjoin.vim'
Plug 'amadeus/vim-convert-color-to'

Plug 'yegappan/mru' " usage as :MRU prj
  let MRU_Max_Entries = 2500
  let MRU_Window_Height = 30 
  let MRU_Max_Menu_Entries = 30 
  " Caution! This save only .vim-prj or .prj
  " let MRU_Exclude_Files = '*.*'
  " let MRU_Include_Files = '\.vim-prj$\|\.pyprj$'

Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
  let g:fzf_preview_window = ''
  let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.6 } }
  let $FZF_DEFAULT_OPTS = '--reverse --color fg:240,hl:33,fg+:241,bg+:#FFFF91,hl+:33 --color info:33,prompt:33,pointer:166,marker:166,spinner:33' 
  nnoremap <silent> <F5> :call fzf#run({
  \   'source': 'rg prj $HOME/.vim_mru_files',
  \   'sink': 'e',
  \   'options': ['--exact', '--prompt', 'Projects> '],
  \   'up':    20,
  \   'window': { 'width': 0.9, 'height': 0.6 }
  \ })<CR>

nnoremap <silent> <leader>c :Commands<CR> 
  command! LS call fzf#run(fzf#wrap({'source': 'ls'}))

Plug 'fszymanski/fzf-quickfix', {'on': 'Quickfix'}
Plug 'laher/fuzzymenu.vim'
  let g:fuzzymenu_position =  'window'
  let g:fuzzymenu_size = {'height': 0.6, 'width': 0.9}
  nmap <Space>z :call fuzzymenu#Run({})<cr>

" ---------------------------------------------------------------------------- 
" MyMenu
  let myMenuList = [
    \'Buffers                  <Space>b |<Space>l', 
    \'#',
    \'Close or QSearchToggle            |<F4>', 
    \'Commands                          |:Commands',
    \'Delete Buffer                     |:bdelete', 
    \'#', 
    \'Functions      <C-R> or <C-Space> |<Space>f',
    \'Fuzzy Menu                        |<Space>z', 
    \'Fzf-quickfix                      |:Quickfix',
    \'GrepBuffer word at cursor         |<F3>',
    \'ITerm                             |:Iterm',
    \'Ls files in current dir           |:LS',  
    \'#',     
    \'LspDefinition                     |gd',                                      
    \'LspHover                          |gh', 
    \'LspReferences                     |gr', 
    \'#',     
    \'Open Project                   op |:PyOpenProject',  
    \'PlugUpdate                        |:PlugUpdate', 
    \'Projects            <C-P> or <F5> |<Space>p',
    \'Reveal in Finder                  |:Reveal',  
    \'vimrc                             |:e ~/.vimrc',
    \]

  function! MyMenu_sink(lines, timer)
    if len(a:lines) < 1
      return
    endif
    if a:lines[0] == '#'
      return
    endif
    let cmd = split(a:lines[0], '|')[1]
    let prefix = cmd[0]
    if prefix == ':' 
        execute 'silent' cmd 
    else
        let escaped_cmd = substitute(cmd, '<', '\\<', "g")
        execute 'silent call feedkeys("'.escaped_cmd.'")'  
    endif
  endfunction 
  
  function! DelayedMyMenu_sink(lines)                                                      
    " Resolve problem with neovim/VimR when call fzf commands...
    " https://github.com/junegunn/fzf.vim/issues/872 
    call timer_start(1, function('MyMenu_sink', [a:lines]))                                                                           
  endfunction 

  command! MyMenu call fzf#run({
    \   'source': myMenuList,  
    \   'sink*': function('DelayedMyMenu_sink'),
    \   'options': ['--exact', '--prompt', 'Select cmd>'],          
    \   'up':    20,
    \   'window': { 'width': 0.9, 'height': 0.6 }
    \ })    
  nnoremap <silent> <leader><Space> :MyMenu<CR> 

Plug 'Yggdroot/LeaderF', {'do': './install.sh' } "{ https://github.com/Yggdroot/LeaderF
  let g:Lf_WindowPosition  = "top"
  " let g:Lf_WindowHeight = 0.30
  let g:Lf_ShowRelativePath = 0
  let g:Lf_CtagsFuncOpts = {
    \ 'c': '--c-kinds=fp',
    \ 'rust': '',
    \ 'zig': '--options=$HOME/.ctags-d/zig.ctags',
    \ }
  let g:Lf_CommandMap = {
    \ '<C-J>': ['<Down>', '<C-J>'],
    \ '<C-K>': ['<Up>',   '<C-K>']}
  
  nnoremap <leader>f  :<C-u>Leaderfwnowrap! --left function<cr>
  nnoremap <C-Space> :<C-u>Leaderfwnowrap! --left function<cr> 
  inoremap <C-Space> <ESC>:<C-u>Leaderfwnowrap! --left function<cr>
  nnoremap <C-R>     :<C-u>Leaderfwnowrap! --right function<cr> 
  inoremap <C-R>     <ESC>:<C-u>Leaderfwnowrap! --left function<cr>
  nnoremap <silent>  <leader>l     :<C-u>Buffers<cr>
  nnoremap <silent>  <C-l>         :<C-u>Buffers<cr> 
  nnoremap <leader>b  :<C-u>Leaderfx buffer<cr>
  nnoremap <silent> <Space>p  <ESC>:call feedkeys("\<F5>")<CR> 
  nnoremap <silent>  <C-P>     <ESC>:call feedkeys("\<F5>")<CR> 
  " nnoremap <F5>      :<C-u>:MRU prj<CR>
  " nnoremap <Space>l  :<C-u>Leaderfx self<cr> 

  command! -nargs=* -bang -complete=customlist,leaderf#Any#parseArguments Leaderfx call leaderf#Any#start(<bang>0, <q-args>)
    \  | vertical resize 45 | call feedkeys("<Tab>")
  command! -nargs=* -bang -complete=customlist,leaderf#Any#parseArguments Leaderfwnowrap call leaderf#Any#start(<bang>0, <q-args>)
    \  | setlocal nowrap | vertical resize 45 | call feedkeys("<Tab><Space>")
  
  Plug 'hilarryxu/LeaderF-funky'
  Plug 'Yggdroot/LeaderF-marks'
"}

Plug 'godlygeek/csapprox'
Plug 'tpope/vim-sensible'                                      
          
Plug '~/.vim/mybundle/misc' 
Plug '~/.vim/mybundle/tagbar'
Plug '~/.vim/mybundle/sbd.vim'
Plug '~/.vim/mybundle/tablify'
Plug '~/.vim/mybundle/vim-command-w' 

call plug#end()

" Required:
filetype plugin indent on

" ----------------------------------------------------------------------------
" Turn on filetype detection
filetype on
filetype plugin on

" ----------------------------------------------------------------------------
set termencoding=utf-8
set encoding=utf-8
set fileencoding=utf-8
set fileencodings=utf-8,cp932

inoremap <expr><TAB>    pumvisible() ? "\<C-n>" : "\<TAB>"
inoremap <expr><S-TAB>  pumvisible() ? "\<C-p>" : "\<S-TAB>"
inoremap <expr><C-j>    pumvisible() ? "\<C-n>" : "\<C-j>"
inoremap <expr><C-k>    pumvisible() ? "\<C-p>" : "\<C-k>"
inoremap <expr><Down>   pumvisible() ? "\<C-n>" : "\<Down>"
inoremap <expr><Up>     pumvisible() ? "\<C-p>" : "\<Up>"

nnoremap <C-N>          :tabnew<cr> 

" For performance reason
let html_no_rendering     = 1
let g:html_indent_script1 = "inc"
let g:html_indent_style1  = "inc"
let loaded_quickfixsigns  = 100

" ----------------------------------------------------------------------------
" Grep
let g:Grep_Xargs_Options = '-0'

set tags=./tags,./../tags,./*/tags
" ctags
" Press 't' to follow tag under cursor, 'T' to go back up the tag stack
nmap t <C-]>
nmap T :pop<CR>

" ----------------------------------------------------------------------------
" Status Line
function! SyntaxItem()
  return synIDattr(synID(line("."),col("."),1),"name")
endfunction

let g:syntax = '???'
let g:currentTag = '???'

augroup my_autocmd_misc
  autocmd! 
  " autocmd CursorHold * let g:syntax = SyntaxItem()
  " autocmd CursorHold * let g:currentTag = tagbar#currenttag('%s','','s')
  " Go to last file/position.
  autocmd VimEnter * if !argc() | call feedkeys("\<C-O>\<C-O>zm") | endif
  au FocusGained * checktime
augroup end

" set statusline=%4*\ %l\/%L\ -\ %P,\ column\ %c\
set statusline=%L\ column\ %c
" set statusline +=\ %{fugitive#statusline()}
set statusline+=%5*\ %f\                           " file name  
" set statusline+=%3*\ %{g:currentTag}\ 
" set statusline+=%5*\ %=%{g:syntax}               " only for debug, use :echo SyntaxItem()
set statusline+=%5*\ %=%{&ff}\                     " file format
set statusline+=%4*\ %{(&fenc==\"\"?&enc:&fenc)}\  " encoding
set statusline+=%5*%y%*                            " file type
" set statusline+=%{coc#status()}
" set statusline+=%5*\ %{Uptime(2)}

" ----------------------------------------------------------------------------
" Abbrevs
iabbrev xrm # testIto remove after test...
" Special map for my custom keyboard
inoremap <C-S> '
inoremap <C-D> "

" ----------------------------------------------------------------------------
" Maps
map <Space> <Leader>

" next searched char when fchar
nnoremap ff ; " 
" previous searched char when fchar
nnoremap FF ,

nnoremap <C-J> <C-W>j
nnoremap <C-K> <C-W>k

" Insert / Normal Mode
" Ctrl + c or [ = ESC 
nnoremap jf        <ESC>
inoremap jf        <ESC>l
inoremap jk        <ESC>l
inoremap <C-F>     <ESC>l
inoremap <silent>  <ESC><ESC> :call feedkeys('l')<CR>
nnoremap <silent>  <ESC><ESC> :<C-u>nohlsearch<CR>
nnoremap <C-[>     <C-t>
" overwrite <ESC> <C-t> mapped by vim-lsp  
nnoremap <ESC>  <ESC>
nnoremap <D-f>  <ESC>:call feedkeys('/')<CR>

" 挿入モードでのIME状態を記憶させない場合、次行のコメントを解除
"inoremap <silent> <ESC> <ESC>:set iminsert=0<CR>

"Tricks
" Ctrl + m = Enter
" Ctrl + i = Tab
" Ctrl 6 or Ctrl ^ switches to the last visited buffer
" Ctrl o / Ctrl i Jump previously visited location 
" Ctrl v -> Shift cursor movements / 'c' / Select vertically
" Shift v -> Select line
" Back to tag equ CTR-T
" Cursor movements / scroll relative 
"  H - top         / zh or zt
"  M - middle      / zm or zz
"  L - Bottom      / zl or zb
"nnoremap <C-[>     <C-t>
"q: " Open cmd line history
":colder, restore QuickFix after :QFGrep
"git log -GsearchString --all
":Errors for syntastic quickfix
":Reveal to reveal the current file in the OS X Finder.
"z/ to toggle highlighting all instance of word under cursor on/off
" :%s/foo/bar/gc
" gUw  : Change to end of current WORD from lower to upper
" zR ulfold all
" gi Resumes inserting at the last place  
" Smart way to move buffer
" mvim -d -g filea fileb (vimdiff)
"
" :GhostStart  (Cmd + shift + k)
" :MarkdownPreview
" :MarkdownPreviewStop
" 

noremap zh zt
noremap zm zz
noremap zl zb
nnoremap  b<Space> :b<Space>
noremap! ¥ \
" noremap! \ ¥

" Buffer Navigation
map <SwipeLeft>     <C-o>
map <SwipeRight>    :bn<CR>

map <SwipeUp>      <C-f>
map <SwipeDown>    <C-b>

nnoremap bd :bdelete

if has("gui_macvim") || has("gui_vimr") 
  nnoremap <D-j>           :cn<cr>ztkj
  nnoremap <D-k>           :cp<cr>ztkj
  nnoremap <C-j>           :lnext<cr>
  nnoremap <C-k>           :lprev<cr>  
else
  nnoremap <C-j>           :cn<cr>ztkj
  nnoremap <C-k>           :cp<cr>ztkj
endif

nnoremap <leader>v       0<C-v>$
nnoremap <leader>w       <C-w>v<C-w>l
nnoremap zr              zRzz
" Browser refresh
let g:RefreshRunningBrowserReturnFocus = 0
let g:RefreshRunningBrowserDefault     = 'firefox'
nnoremap rr :call RefreshRunningBrowser()<CR>

" visual shifting
vnoremap < <gv
vnoremap > >gv

" Function Key
" nnoremap <F1> <ESC>
" imap     <F1> <ESC>l

" Scroll for terminal
tnoremap <Esc><Esc> <C-\><C-n>

" ----------------------------------------------------------------------------
function! XGrep()
  execute "normal! *:Bgrep\<CR>\<CR>" 
endfunction

inoremap <silent> <F3>  <ESC>:Bgrep<CR><CR>
noremap  <silent> <F3>       :Bgrep<CR><CR>  
" nnoremap <silent> <F3>       :GrepBuffer <C-R>=expand("<cword>")<CR><CR><C-w><C-k>
" nnoremap <silent> <F3>       :call XGrep()<CR> <bar> :Quickfix<CR>

inoremap <silent> <F4>  <ESC>:call QSearchToggle(0)<CR>
nnoremap <silent> <F4>       :call QSearchToggle(0)<CR> 

" augroup filetype_mysql
"   autocmd!
"   autocmd FileType mysql inoremap <buffer><silent> <F6>   <ESC>:MySQL<CR>
"   autocmd FileType mysql inoremap <buffer><silent> <C-r>  <ESC>:MySQL<CR>
"   autocmd FileType mysql nnoremap <buffer><silent> <F6>        :MySQL<CR>
"   autocmd FileType mysql nnoremap <buffer><silent> <C-r>       :MySQL<CR>
" augroup end

" nmap    <F7>       :call HexHighlight()<Return>

" MacVim - move cursor word left
map <S-w> <M-Left>

" Directory & autocmd
set directory=~/tmp/
set backupdir=~/tmp
augroup my_autocmd
    autocmd! 
    autocmd BufEnter *.vim-prj lcd %:p:h " Current Directory
    " autocmd BufEnter * lcd %:p:h " Current Directory
    " autocmd BufEnter *.pyprj let g:currProject = expand('%:p') " see pyproject.vim
    
    " autocmd BufEnter *.py  :match defLine /def\ .*$/ 
    " autocmd BufEnter *.js  :match defLine /.*function.*$/ 
    autocmd BufEnter *.js nnoremap <leader>f  :<C-u>Lines function<cr> 
    autocmd BufLeave *.js nnoremap <leader>f  :<C-u>Leaderfwnowrap! --left function<cr> 
    autocmd BufEnter * :syntax sync fromstart
    autocmd BufNewFile,BufRead *.l set filetype=picolisp
    autocmd BufNewFile,BufRead *.arc set filetype=arc
    autocmd BufNewFile,BufRead *.go setlocal noet ts=4 sw=4 sts=4
    autocmd BufNewFile,BufRead *.dyon set filetype=rust
    autocmd BufNewFile,BufRead *.rn set filetype=rust
    autocmd BufRead * let g:currentTag = tagbar#currenttag('%s','','s')

    " Problem with Japanese IME / 例: 中 (tyuu) 
    autocmd VimEnter * set imdisable
    
    autocmd FileType html setlocal indentkeys-=*<Return>
    autocmd FileType svelte runtime ftplugin/html/sparkup.vim

    " Trim Trailing Whitespace
    autocmd BufWritePre *.{py,rs,js,html,css} %s/\s\+$//e

    " FocusLost save and Normal Mode
    autocmd FocusLost * silent! wa
    autocmd FocusLost * if mode()[0] =~ 'i\|R' | call feedkeys("\<Esc>") | endif

    " Fast Cursor / nocursorline in Insert Mode
    " autocmd CursorHold * setlocal cursorline
    " autocmd CursorMoved,InsertEnter * if &l:cursorline | setlocal nocursorline | endif 
    
    " ESC to not append 'g' when save in insert mode
    autocmd BufWritePost *.py  call feedkeys("\<Esc>") | WatchdogsRun
    autocmd BufWritePost *.css call feedkeys("\<Esc>") | WatchdogsRun
    autocmd BufWritePost *.js  call feedkeys("\<Esc>") | WatchdogsRun
    " autocmd BufWritePost *.svelte call feedkeys("\<Esc>") | :LspDocumentFormat
    autocmd BufWritePost *.svelte silent execute '!npm run vim_fmt %:p'| call feedkeys("\<Esc>")
    autocmd BufWritePost *.rs  call feedkeys("\<Esc>")

    autocmd BufWritePost .vimrc,vimrc so $MYVIMRC " No more restart MacVim after editing vimrc 
    autocmd ColorScheme * hi LineNr ctermbg=NONE guibg=NONE
    " Don't wrap in quickfix, and don't show in buffer list
    autocmd FileType qf setlocal nowrap textwidth=0 nobuflisted
    " autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
    " autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
augroup end 

" QuickFix Close or Search
function! QSearchToggle(forced)
    if exists("g:qfix_win") && a:forced == 0
        cclose
    else
        execute "normal! *:Bgrep\<CR>\<CR>"
    endif
endfunction

" if has("gui_macvim") || has("gui_vimr") 
"     nnoremap <C-k>       :Bgrep <!\-\-\ \.<CR> " Search <!-- .templateEntry --> entry in MyTemplate
" endif

" Used to track the quickfix window.
augroup QSearchToggle
    autocmd!
    autocmd BufWinEnter quickfix let g:qfix_win = bufnr("$")
    autocmd BufWinLeave * if exists("g:qfix_win") && expand("<abuf>") == g:qfix_win | unlet! g:qfix_win | endif
augroup end

" ----------------------------------------------------------------------------
set nu
function! s:ToggleNumberMode()
  if &rnu == 0
    set rnu
  else
    set nornu
    set nu
  endif
endfunc  
nnoremap <silent> nt :call <SID>ToggleNumberMode()<CR> 

" ----------------------------------------------------------------------------  
" cfilter.vim: Plugin to filter entries from a quickfix/location list
" Last Change: Aug 23, 2018
" Maintainer: Yegappan Lakshmanan (yegappan AT yahoo DOT com)
" Version: 1.1
"
" Commands to filter the quickfix list:
"   :Cfilter[!] /{pat}/
"       Create a new quickfix list from entries matching {pat} in the current
"       quickfix list. Both the file name and the text of the entries are
"       matched against {pat}. If ! is supplied, then entries not matching
"       {pat} are used. The pattern can be optionally enclosed using one of
"       the following characters: ', ", /. If the pattern is empty, then the
"       last used search pattern is used.
"   :Lfilter[!] /{pat}/
"       Same as :Cfilter but operates on the current location list.

packadd cfilter  

func s:Qf_grep(searchpat, bang)
  if a:bang == '!'
    call feedkeys(":Cfilter! ". a:searchpat . "\<CR>")
  else
    call feedkeys(":Cfilter ".  a:searchpat . "\<CR>")   
  endif       
endfunc
com! -nargs=+ -bang QFGrep  call s:Qf_grep(<q-args>, <q-bang>)  

" ----------------------------------------------------------------------------
function! Iterm()
  silent exec "!open -a iTerm '".getcwd()."'" | redraw! 
  echo "open -a iTerm ".getcwd() 
  " silent exec "!open -n -a  Alacritty --args --working-directory '".getcwd()."'" | redraw! 
  " echo "open -n -a Alacritty --args --working-directory ".getcwd()  
  " silent exec "!open -n -a  /usr/local/bin/kitty --args  -d ".getcwd() | redraw!
  " echo "open -n -a  /usr/local/bin/kitty --args  -d ".getcwd()
endfunction
command! -nargs=* Iterm call Iterm()

" ----------------------------------------------------------------------------
function! Gitup() 
  silent exec "!/usr/local/bin/gitup"
  echo "!/usr/local/bin/gitup"
endfunction
command! -nargs=* Gup call Gitup()

" ----------------------------------------------------------------------------
function! s:MoveVToNonBlank(UpDown)
  let cursorPos = col('.')
  let total_lines = line('$')
  let i = 0
  while i < 1000
    let i += 1
    if a:UpDown == 'Up'
        if line('.') <= 1
            break
        endif
        execute 'norm! k'
    else
        if line('.') >= total_lines
            break
        endif
        execute 'norm! j'
    endif
    let c = getline('.')[cursorPos - 1]
    if !(c == ' ' || c == '')
        break
    endif
  endwhile
endfunction
nnoremap <silent> K        :call <SID>MoveVToNonBlank('Up')<CR>hh  
nnoremap <silent> J        :call <SID>MoveVToNonBlank('Down')<CR>
nnoremap <silent> <C-Up>   :call <SID>MoveVToNonBlank('Up')<CR>
nnoremap <silent> <C-Down> :call <SID>MoveVToNonBlank('Down')<CR>h 

" ----------------------------------------------------------------------------
" transparency
if has("gui_macvim")
  let g:transparency     = 7
  let g:transparencyCtrl = 1
  
  function! s:Toggle_transparence()
    if &transparency > 0
      let &transparency      = 0
      let g:transparencyCtrl = 0
    else
      let &transparency      = g:transparency
      let g:transparencyCtrl = g:transparency
    endif
  endfunction
  nnoremap <silent> tt :<C-u>call <SID>Toggle_transparence()<CR>
endif

" ----------------------------------------------------------------------------
if has("gui_macvim")
  set guioptions-=T " No toolbar
  set go-=L         " No verticall scoll bar for minibufexpl
  set macmeta
  " set macligatures
  nmap <D-w> :CommandW<CR>
  imap <D-w> <Esc>:CommandW<CR> 

  " set guifont=Menlo:h14    
  " set guifont=Ubuntu\ Mono:h18
  " set guifont=Inconsolata\ for\ Powerline:h18
  " set guifont=SF\ Mono:h17
  set guifont=IBM\ Plex\ Mono:h17
  " set guifont=Fira\ Code\ Retina:h14
  " set guifont=Courier:h18
  " set guifont=JetBrains\ Mono\ NL:h17
  " set guifont=Hack\ Regular:h16
  " set guifont=Hack\ Regular:h14
  " set guifont=Fira\ Mono:h14
  " set guifont=M+\ 1m:h18
  " set guifont=Osaka-Mono:h18
  " set guifont=Inconsolata\ XL:h16
  " set guifont=Monaco:h14
  " set guifont=Source\ Code\ Pro:h15
endif

colorscheme mycolor 

set hlsearch                           " Highlight search
set ignorecase                         " Ignore case when searching
set smartcase
set cmdheight=2                        " To minibufexpl Not display Hit Enter => resized to 1 inside minibufexpl
set showmode                           " Always show the mode
set mousehide                          " Hide mouse when typing
set mouse=a                            " Terminal scroll with mouse
set regexpengine=1                     " Improves performance syntax highlighted file
set nostartofline
set softtabstop=4                      " 4 spaces
set expandtab                          " Kill tabulars                                                           
set shiftwidth=4                       " 4 spaces
set tabstop=4                          " Need for retab
set matchpairs+=<:>                    " Match angle brackets
set hidden                             " Allow modified buffers to be hidden

set iminsert=0
set viminfo^=%                         " Remember buffer
set imsearch=0
if has("gui_macvim")   
    set columns=180
    set lines=100
endif
set autowrite
set nobackup
set noswapfile
set nowritebackup
set imdisable
set virtualedit=all
set shortmess=oO
set number
if !has("nvim")
  set selection=exclusive
endif
set lazyredraw                          " to avoid scrolling problems
" set re=0                                " to avoid nvim excessive redrawing
set ttyfast
set timeout ttimeout         " separate mapping and keycode timeouts
set timeoutlen=300           " mapping timeout 500ms  (adjust for preference)
set ttimeoutlen=20           " keycode timeout 20ms
set updatetime=300
set noundofile

set breakindent
set breakindentopt=shift:2 
set iskeyword+=-                        " treat dashes as part of word 
set wildmenu
set laststatus=2  
set t_Co=256
set vb t_vb=
if !has("nvim")
  set linespace=-3
endif
set termguicolors

" End
