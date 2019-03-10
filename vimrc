if !&compatible
  " Enable no Vi compatible commands.
  set nocompatible
endif

syntax enable

" Required:
call plug#begin('~/.vim/plugged')

" Add or remove your Bundles here:
Plug 'Shougo/vimproc.vim', { 'do': 'make' }

if has("gui_macvim")
  let macvim_hig_shift_movement = 1
endif
Plug 'Shougo/unite.vim'
Plug 'Yggdroot/indentLine' "{
  let g:indentLine_char = '¦'
  " let g:indentLine_color_gui = '#0BB634'
  let g:indentLine_color_gui = '#EFEFEF'
  set list lcs=tab:\|\ 
"}

Plug 'tacroe/unite-mark'
Plug 'othree/javascript-libraries-syntax.vim' 

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
  let g:quickrun_config["css/watchdogs_checker"] = {
  \	"type" : "watchdogs_checker/csslint",
  \	"cmdopt" : "--ignore=order-alphabetical,box-sizing,unqualified-attributes,fallback-colors,compatible-vendor-prefixes,adjoining-classes"
  \}  


Plug 'dag/vim-fish'
Plug 'chrisbra/vim-diff-enhanced'
Plug 'rust-lang/rust.vim'
Plug 'ziglang/zig.vim'

" Plug 'racer-rust/vim-racer' "{
"   let g:racer_cmd = "$HOME/.cargo/bin/racer"
"   au FileType rust nmap gd <Plug>(rust-def)
" "}
Plug 'cespare/vim-toml'
Plug 'LnL7/vim-nix'

Plug 'keith/swift.vim'
Plug 'tpope/vim-sleuth'
Plug 'tpope/vim-markdown'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround' "{
  " ds ･･･ d(delete)s(surround)
  " di ･･･ d(delete)i(inside)
  " cs ･･･ c(change)s(surround)
  " ci ･･･ c(change)i(inside)
  " ys$ ･･･y(yank)s(surround)line
  " ysiw ･･･ y(yank)s(surrond)iw(inner word)
  " gvS' ･･･ visual surroud with char
"}
" Plug 'kana/vim-smartinput'
Plug 'jiangmiao/auto-pairs' "{
  " <M-e> Fast Wrap (|)'hello' -> ('hello')
  " <M-n> Jump to next closed pair
"}
Plug 'tomtom/tcomment_vim' "{
 noremap  <D-1> <ESC>:TComment
 vnoremap <D-1> <ESC>gv:TComment<cr>
 inoremap <D-1> <ESC>:TComment<cr> 
"} 

" Plug 'tpope/vim-fugitive'
Plug 'akioito/vim-project-files'
" Plug 'akioito/vim-mysql'
" Plug 'akioito/vim-myshell'
Plug 'walm/jshint.vim'
Plug 'mkitt/browser-refresh.vim'
Plug 'vim-scripts/a.vim'
Plug 'vim-scripts/python_match.vim'
Plug 'vim-scripts/grep.vim' "{
if has('mac')
  " see https://github.com/BurntSushi/ripgrep
  set grepprg=rg\ --vimgrep
endif
"}

Plug 'AndrewRadev/simple_bookmarks.vim'
Plug 'henrik/vim-reveal-in-finder'
Plug 'andymass/vim-matchup' "{
  let g:matchup_matchparen_deferred = 1
"}
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
Plug 'pangloss/vim-javascript', {'for': ['javascript']}

" Plug 'Shougo/deoplete.nvim' "{
"   " slow startup, https://github.com/Shougo/deoplete.nvim/issues/780
"   let g:deoplete#enable_at_startup = 0 
"   let g:python3_host_prog = '/usr/local/bin/python3'
"   augroup xdeoplete
"     autocmd!
"     autocmd InsertEnter * call deoplete#enable()
"     autocmd FileType css            setlocal omnifunc=csscomplete#CompleteCSS
"     autocmd FileType html,markdown  setlocal omnifunc=htmlcomplete#CompleteTags
"     autocmd FileType javascript     setlocal omnifunc=javascriptcomplete#CompleteJS
"     autocmd FileType python         setlocal omnifunc=pjedi#completions
"     autocmd FileType xml            setlocal omnifunc=xmlcomplete#CompleteTags
"
"     autocmd FileType rust          hi rustCommentLineDoc    guifg=#00b418 "Green variant
"     autocmd InsertLeave * silent! pclose!
"   augroup end
"   Plug 'zchee/deoplete-jedi'
"     let g:deoplete#sources#jedi#statement_length = 350
"     let g:deoplete#sources#jedi#python_path = '/usr/local/bin/python3' 
"     let g:deoplete#sources#jedi#ignore_errors = v:true
"   Plug 'davidhalter/jedi-vim'
"     " Disable Jedi-vim autocompletion and enable call-signatures options
"     let g:jedi#force_py_version = 3
"     let g:pymode_rope = 0
"     let g:jedi#goto_command = 'gd'
"     let g:jedi#usages_command = 'gr'
"     let g:jedi#auto_initialization = 1
"     let g:jedi#completions_enabled = 0
"     let g:jedi#auto_vim_configuration = 0
"     let g:jedi#smart_auto_mappings = 0
"     let g:jedi#popup_on_dot = 0
"     let g:jedi#completions_command = ""
"     let g:jedi#show_call_signatures = "1"
"   Plug 'Shougo/echodoc.vim'
"     let g:echodoc#enable_at_startup = 1
" "}


" ncm2 https://github.com/ncm2
Plug 'ncm2/ncm2'
  Plug 'roxma/nvim-yarp'
  " Plug 'akioito/ncm2-jedi' " Caution: Error when editing python2 file with # -*- coding: future_fstrings -*-
  Plug 'rizzatti/dash.vim'
  Plug 'ncm2/ncm2-tern',  {'do': 'npm install'}
  Plug 'ncm2/ncm2-bufword'
  Plug 'ncm2/ncm2-vim' | Plug 'Shougo/neco-vim'
  Plug 'ncm2/ncm2-cssomni'  
  
  set shortmess+=c 
  inoremap <c-c> <ESC>
  inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
  inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
  let g:ncm2#complete_delay = 100
  let g:ncm2#popup_delay = 100
  let g:ncm2#matcher = 'prefix'

  augroup xncm2
    autocmd BufEnter * call ncm2#enable_for_buffer()
    autocmd User Ncm2PopupOpen set completeopt=noinsert,menuone,noselect
    autocmd User Ncm2PopupClose set completeopt=menuone 
    autocmd TextChangedI * call ncm2#auto_trigger()
  augroup end   


Plug 'rhysd/clever-f.vim'
Plug 'roxma/nvim-yarp'
Plug 'roxma/vim-hug-neovim-rpc'

Plug 'AndrewRadev/splitjoin.vim'
Plug 'gorkunov/smartpairs.vim'
Plug 'tacroe/unite-mark' "{
 let g:unite_source_mark_marks =
  \   "abcdefghijklmnopqrstuvwxyz"
  \ . "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
  \ . "0123456789.'`^<>[]{}()\""
"}
" Unite "{
  let g:unite_enable_start_insert           = 1
  let g:unite_source_buffer_time_format     = ''
  let g:unite_winheight                     = 40
  let g:unite_prompt                        = '» '
  
  nnoremap uf           :Unite -auto-resize buffer<CR>    
  nnoremap jf           :Unite buffer<CR>
  nnoremap fj           :Unite buffer<CR>
  nnoremap um           :Unite mark<CR>
  nnoremap us           :Unite source<CR>
  nnoremap ct           :MRU prj<CR>
  nnoremap unu          :Unite neobundle/update
  nnoremap mm          :Unite output:map<CR>
  
  " Custom mappings for the unite buffer
  
  function! s:unite_settings()
    nunmap <silent><buffer> <Space>
    " Enable navigation with control-j and control-k in insert mode
    imap <buffer> <D-k>   <Plug>(unite_select_previous_line)
    imap <buffer> <C-j>   <Plug>(unite_select_next_line)
    imap <buffer> <C-k>   <Plug>(unite_select_previous_line)
    imap <buffer> <D-j>   <Plug>(unite_select_next_line)
    imap <buffer> <ESC>oA <Plug>(unite_select_previous_line)
    imap <buffer> <ESC>oB <Plug>(unite_select_next_line)

    nmap <buffer> <Space> <Plug>(unite_do_default_action)

    imap <buffer> <ESC>   <Plug>(unite_exit)
    imap <buffer> jk      <Plug>(unite_insert_leave)
  endfunction
  
  let g:unite_source_menu_menus = get(g:,'unite_source_menu_menus',{})
  let g:unite_source_menu_menus.mycmds = {
    \ 'description' : '          Menu Commands
    \                            Ctrl-p',
    \}
  let g:unite_source_menu_menus.mycmds.command_candidates = [
    \['LeaderF            Shortcut/Command',  ''],
    \['  lfFunction       <Space>f / <C-Space> / <C-R>', 'exe "Leaderfwnowrap! --left function"'],
    \['  lfProjects       <Space>p / <F5>',   'exe "Leaderfwnowrap! --top mru --input prj"'],
    \['  lfBuffers        <Space>b / <C-L>',  'exe "Leaderfx buffer"'], 
    \['  lfLeaderf        <Space>l',          'exe "Leaderfx self"'],
    \['Direct Command           ',            ''],
    \['  Project Open     :PyOpenProject / op', 'exe "PyOpenProject"'],
    \['  vimrc            :e ~/.vimrc',       'exe "e ~/.vimrc"'],
    \['Legacy                    ',           ''],
    \['  python def            ',             'exe "Unite line -input=def\\ "'],
    \['  Functions        <C-@>',             'exe "TagbarToggle"'],
    \['  Projects         ct',                'normal ct'], 
    \['  Buffers          fj/<C-l>',          'exe "Unite buffer"'],
    \['  Update plugins   unu',               'exe "PlugUpdate"'],
    \['  messages         :messages',         'exe "messages"'],
    \['  keyboard map     mm',                'normal mm'],
    \['  bookmars         <F2>',              'exe "Unite bookmark"'],
    \['  marks            um',                'exe "Unite mark"'],
    \['  unite source     us',                'exe "Unite source"'],
    \['  jump             :Unite jump',       'exe "Unite jump"'],
    \['  change           :Unite change',     'exe "Unite change"'], 
    \]
  nnoremap <C-p>    :Unite -silent -start-insert menu:mycmds<CR>
  noremap op        :PyOpenProject<CR> 
"}   

Plug 'yegappan/mru' " usage as :MRU prj
Plug 'Yggdroot/LeaderF', { 'do': './install.sh' } "{ https://github.com/Yggdroot/LeaderF 
  let g:Lf_MruMaxFiles = 2500
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
  nnoremap <space>f  :<C-u>Leaderfwnowrap! --left function<cr>
  nnoremap <C-Space> :<C-u>Leaderfwnowrap! --left function<cr> 
  inoremap <C-Space> <ESC>:<C-u>Leaderfwnowrap! --left function<cr>
  nnoremap <C-R>     :<C-u>Leaderfwnowrap! --right function<cr> 
  inoremap <C-R>     <ESC>:<C-u>Leaderfwnowrap! --left function<cr>
  nnoremap <C-L>     :<C-u>Leaderfx buffer<cr> 
  nnoremap <space>b  :<C-u>Leaderfx buffer<cr>
  nnoremap <space>p  :<C-u>Leaderfwnowrap! --top mru --input prj<cr>
  nnoremap <F5>      :<C-u>Leaderfwnowrap! --top mru --input prj<cr>
  nnoremap <space>l  :<C-u>Leaderfx self<cr> 

  command! -nargs=* -bang -complete=customlist,leaderf#Any#parseArguments Leaderfx call leaderf#Any#start(<bang>0, <q-args>)
    \  | vertical resize 45 | call feedkeys("<Tab>")
  command! -nargs=* -bang -complete=customlist,leaderf#Any#parseArguments Leaderfwnowrap call leaderf#Any#start(<bang>0, <q-args>)
    \  | setlocal nowrap | vertical resize 45 | call feedkeys("<Tab><Space>")
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

nnoremap <C-N>          :tabnew<cr> 

" For performance reason
let html_no_rendering     = 1
let g:html_indent_script1 = "inc"
let g:html_indent_style1  = "inc"
let loaded_quickfixsigns  = 100

" ----------------------------------------------------------------------------
let MRU_Max_Entries = 2500
let MRU_Window_Height = 30 
let MRU_Max_Menu_Entries = 30

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
  autocmd CursorHold * let g:syntax = SyntaxItem()
  autocmd CursorHold * let g:currentTag = tagbar#currenttag('%s','','s')
  " Go to last file if invoked without arguments.
  autocmd VimEnter * nested if
    \ argc() == 0 &&
    \ bufname("%") == "" &&
    \ bufname("2" + 0) != "" |
    \   exe "normal! `0" |
    \ endif   
augroup end

" set statusline=%4*\ %l\/%L\ -\ %P,\ column\ %c\
set statusline=%L\ column\ %c
" set statusline +=\ %{fugitive#statusline()}
set statusline+=%5*\ %f\                           " file name  
set statusline+=%3*\ %{g:currentTag}\ 
set statusline+=%5*\ %=%{g:syntax}               " only for debug
set statusline+=%5*\ %=%{&ff}\                     " file format
set statusline+=%4*\ %{(&fenc==\"\"?&enc:&fenc)}\  " encoding
set statusline+=%5*%y%*                            " file type
" set statusline+=%5*\ %{Uptime(2)}

" ----------------------------------------------------------------------------
" Abbrevs
iabbrev xrm # testIto remove after test...
iabbrev println println!

" ----------------------------------------------------------------------------
" Maps
"let mapleader=','
nnoremap ; :
" next searched char when fchar
nnoremap ff ; " 
" previous searched char when fchar
nnoremap FF ,

" Insert / Normal Mode
" Ctrl + c or [ = ESC 
inoremap jk        <ESC>l
nnoremap <silent>  <ESC><ESC> :<C-u>nohlsearch<CR>
nnoremap <C-[>     <C-t>
nnoremap <D-f>  <ESC>:call feedkeys('/')<CR>

" 挿入モードでのIME状態を記憶させない場合、次行のコメントを解除
"inoremap <silent> <ESC> <ESC>:set iminsert=0<CR>

"Tricks
" Ctrl + m = Enter
" Ctrl + i = Tab
" Ctrl 6 or Ctrl ^ switches to the last visited buffer
" Ctrl o / Ctrl i Jump previously visited location 
" Back to tag equ CTR-T
" Cursor movements / scroll relative 
"  H - top         / zh or zt
"  M - middle      / zm or zz
"  L - Bottom      / zl or zb
"nnoremap <C-[>     <C-t>
"q: " Open cmd line history
":colder, restore QuickFix after :QFGrep
"mA to mark / um to Unite mark
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
noremap zh zt
noremap zm zz
noremap zl zb
nnoremap  b<Space> :b<Space>
nnoremap <Space>   <C-f>
nnoremap <S-Space> <C-b>
noremap! ¥ \
noremap! \ ¥

" Buffer Navigation
map <SwipeLeft>     :bp<CR>
map <SwipeRight>    :bn<CR>

map <SwipeUp>      <C-f>
map <SwipeDown>    <C-b>

nnoremap bd :bdelete

if has("gui_macvim") 
  nnoremap <D-j>           :cn<cr>ztkj
  nnoremap <D-k>           :cp<cr>ztkj
else
  nnoremap <C-j>           :cn<cr>ztkj
  nnoremap <C-k>           :cp<cr>ztkj
endif

nnoremap <leader>v       0<C-v>$
nnoremap <leader>w       <C-w>v<C-w>l
nnoremap zr              zRzz
" Browser refresh
let g:RefreshRunningBrowserReturnFocus = 0
let g:RefreshRunningBrowserDefault     = 'chrome'
nnoremap rr :call RefreshRunningBrowser()<CR>

" visual shifting
vnoremap < <gv
vnoremap > >gv

" Function Key
nnoremap <F1> <ESC>
imap     <F1> <ESC>l

nnoremap   <F2>             :Unite bookmark<CR> 
" use ctrl-d to delete bookmark
nnoremap <S-F2>             :UniteBookmarkAdd<CR><CR>

inoremap <silent> <F3>  <ESC>:GrepBuffer <C-R>=expand("<cword>")<CR><CR><C-w><C-k>
nnoremap <silent> <F3>       :GrepBuffer <C-R>=expand("<cword>")<CR><CR><C-w><C-k>

inoremap <silent> <F4>  <ESC>:call QSearchToggle(0)<CR>
nnoremap <silent> <F4>       :call QSearchToggle(0)<CR> 

augroup filetype_mysql
  autocmd!
  autocmd FileType mysql inoremap <buffer><silent> <F6>   <ESC>:MySQL<CR>
  autocmd FileType mysql inoremap <buffer><silent> <C-r>  <ESC>:MySQL<CR>
  autocmd FileType mysql nnoremap <buffer><silent> <F6>        :MySQL<CR>
  autocmd FileType mysql nnoremap <buffer><silent> <C-r>       :MySQL<CR>
augroup end

" nmap    <F7>       :call HexHighlight()<Return>

inoremap <silent> <F12> <ESC>:GrepBuffer <C-R>=expand("<cword>")<CR><CR>
nnoremap <silent> <F12>      :GrepBuffer <C-R>=expand("<cword>")<CR><CR>h

" MacVim - move cursor word left
map <S-w> <M-Left>

" Directory & autocmd
set directory=~/tmp/
set backupdir=~/tmp
augroup my_autocmd
    autocmd! 
    autocmd BufEnter * lcd %:p:h " Current Directory
    " autocmd BufEnter *.pyprj let g:currProject = expand('%:p') " see pyproject.vim
    
    autocmd BufEnter *.py  :match defLine /def\ .*$/ 
    autocmd BufEnter *.js  :match defLine /.*function.*$/ 
    " autocmd BufEnter * :syntax sync fromstart
    autocmd BufNewFile,BufRead *.l set filetype=picolisp
    autocmd BufNewFile,BufRead *.arc set filetype=arc
    autocmd BufNewFile,BufRead *.go setlocal noet ts=4 sw=4 sts=4
    autocmd BufNewFile,BufRead *.dyon set filetype=rust
    autocmd BufRead * let g:currentTag = tagbar#currenttag('%s','','s')

    " Problem with Japanese IME / 例: 中 (tyuu) 
    autocmd VimEnter * set imdisable
                    
    autocmd FileType html setlocal indentkeys-=*<Return>

    " Trim Trailing Whitespace
    autocmd BufWritePre *.{py,js,html,css} %s/\s\+$//e

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

    autocmd BufWritePost .vimrc,vimrc so $MYVIMRC " No more restart MacVim after editing vimrc 
    autocmd FileType unite call s:unite_settings() 

    autocmd ColorScheme * hi LineNr ctermbg=NONE guibg=NONE
augroup end 

" QuickFix Close or Search
function! QSearchToggle(forced)
    if exists("g:qfix_win") && a:forced == 0
        cclose
    else
        execute "normal! *:Bgrep\<CR>\<CR>"
    endif
endfunction

" nnoremap <C-k>       :Bgrep <!\-\-\ \.<CR> " Search <!-- .templateEntry --> entry in MyTemplate

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
function! GrepQuickFix(pat)
  let all = getqflist()
  for d in all
    if bufname(d['bufnr']) !~ a:pat && d['text'] !~ a:pat
        call remove(all, index(all,d))
    endif
  endfor
  call setqflist(all)
endfunction
command! -nargs=* QFGrep call GrepQuickFix(<q-args>)

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
endif

" set guifont=Menlo:h14    
" set guifont=Ubuntu\ Mono:h18
" set guifont=Inconsolata\ for\ Powerline:h18
" set guifont=SF\ Mono:h14
" set guifont=Fira\ Code\ Retina:h14
set guifont=Courier:h16
" set guifont=Hack\ Regular:h14
" set guifont=Fira\ Mono:h14
" set guifont=M+\ 1m:h18
" set guifont=Osaka-Mono:h18
" set guifont=Inconsolata\ XL:h16
" set guifont=Monaco:h14
" set guifont=Source\ Code\ Pro:h15

colorscheme mycolor 

set nocompatible                       " More stuff
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
set columns=180
set lines=80
set autowrite
set nobackup
set noswapfile
set nowritebackup
set imdisable
set virtualedit=all
set shortmess=oO
set number
set antialias
set selection=exclusive
set lazyredraw                          " to avoid scrolling problems
set redrawtime=10000
set ttyfast
set timeoutlen=200                      " <leader> don't work with low timeoutlen, but high slowdown next search
set updatetime=500
set noundofile

set breakindent
set breakindentopt=shift:2 
set iskeyword+=-                        " treat dashes as part of word 
set linespace=1                         " for correct kanji display 
set wildmenu
set laststatus=2

" End
