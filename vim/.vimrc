if !&compatible
  set nocompatible
endif

"auto-install vim-plug
if empty(glob('~/.vim/autoload/plug.vim'))
    silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall
endif

call plug#begin(has('nvim') ? '~/.config/nvim/plugged' : '~/.vim/plugged')

" Treesitter
if has("nvim")
    Plug 'nvim-lua/plenary.nvim'
    Plug 'folke/todo-comments.nvim'
    Plug 'kyazdani42/nvim-web-devicons'
    Plug 'https://gitlab.com/yorickpeterse/nvim-pqf.git'
    Plug 'chr4/nginx.vim'
endif

Plug 'vim-scripts/BufOnly.vim'

" LSP
Plug 'prabirshrestha/vim-lsp'
Plug 'mattn/vim-lsp-settings'
let g:lsp_work_done_progress_enabled = 1
let g:lsp_use_native_client = 1
Plug 'prabirshrestha/asyncomplete.vim'
Plug 'prabirshrestha/asyncomplete-lsp.vim'
Plug 'prabirshrestha/asyncomplete-buffer.vim'
Plug 'prabirshrestha/asyncomplete-file.vim'

augroup vim-lsp
  autocmd!
  au User asyncomplete_setup call asyncomplete#register_source(asyncomplete#sources#file#get_source_options({
      \ 'name': 'file',
      \ 'allowlist': ['*'],
      \ 'priority': 10,
      \ 'completor': function('asyncomplete#sources#file#completor')
      \ }))
augroup end

let g:lsp_diagnostics_echo_cursor = 1
let g:lsp_diagnostics_float_cursor = 1
let g:lsp_diagnostics_highlights_enabled = 0
let g:lsp_diagnostics_virtual_text_enabled = 0
let g:lsp_document_code_action_signs_enabled = 0
let g:lsp_document_highlight_enabled = 1

function! MyDiagnostics()
    execute "normal! :LspDocumentDiagnostics\<CR>"
    call setqflist(getloclist(0))
    copen
    call timer_start(200, {-> execute('lclose')})
endfunction

noremap mr   :LspReferences<cr>
noremap md   :LspDefinition<cr>
noremap gh   :LspHover<cr>
noremap gl   :call MyDiagnostics()<cr>
noremap cx   :LspCodeAction<cr>

Plug 'dominikduda/vim_current_word'
let g:vim_current_word#highlight_twins = 1
let g:vim_current_word#highlight_current_word = 1

Plug 'djoshea/vim-autoread'

if has('nvim')
  Plug 'mcauley-penney/tidy.nvim'
  Plug 'MunifTanjim/nui.nvim'
  Plug 'mhinz/vim-crates'
    autocmd BufRead Cargo.toml call crates#toggle()

  " Plug 'f-person/git-blame.nvim'
  "   let g:gitblame_date_format = '%r %Y-%m-%d %H:%M:%S'
  "   let g:gitblame_message_template = ' <date> • <author> • <summary>'
  "   let g:gitblame_enabled = 0
else
  " To use Python remote plugin features in Vim, can be skipped
  Plug 'roxma/nvim-yarp', { 'do': 'pip install -r requirements.txt' }
  Plug 'roxma/vim-hug-neovim-rpc'
endif

Plug 'Vimjas/vim-python-pep8-indent'
Plug 'Yggdroot/indentLine'
  let g:indentLine_color_gui = '#ffdad8'
  let g:indentLine_fileType = ['html', 'python', 'rust', 'javascript', 'typescript', 'json', 'yaml', 'toml', 'markdown', 'bash', 'lua']
  let g:indentLine_char = '|'
  let g:indentLine_faster = 1

function! Cond(cond, ...)
  let opts = get(a:000, 0, {})
  return a:cond ? opts : extend(opts, { 'on': [], 'for': [] })
endfunction

Plug 'easymotion/vim-easymotion'
  nmap f <Plug>(easymotion-overwin-f2)
  let g:EasyMotion_smartcase = 1
  let g:EasyMotion_verbose = 0
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install' }
Plug 'jkramer/vim-checkbox'

Plug 'tonchis/vim-to-github'
Plug 'sbdchd/neoformat'
  let g:neoformat_enabled_python = ['ruff', 'isort', 'docformatter']
  let g:neoformat_run_all_formatters = 1
  " https://github.com/nrempel/sleek / cargo install sleek
  let g:neoformat_sql_sleek = {
              \ 'exe': 'sleek',
              \ 'args': ['--indent-spaces=2'],
              \ 'stdin': 1,
              \ }
  let g:neoformat_enabled_sql = ['sleek']
Plug 'andymass/vim-matchup', Cond(!exists('g:vscode'))
  let g:loaded_matchit = 1
  let g:matchup_matchparen_deferred = 1
  let g:matchup_matchparen_hi_surround_always = 1
Plug 'gelguy/wilder.nvim'
" Plug 'MattesGroeger/vim-bookmarks'
"   let g:bookmark_save_per_working_dir = 1
"   let g:bookmark_auto_save = 1
"   nnoremap <F2> :BookmarkToggle<cr>
"   nnoremap <S-F2> :BookmarkShowAll<cr>

Plug 'mustache/vim-mustache-handlebars'
Plug 'prettier/vim-prettier', {
  \ 'do': 'yarn install --frozen-lockfile --production',
  \ 'for': ['css', 'less', 'scss', 'json', 'markdown', 'vue', 'svelte', 'yaml'] }
Plug 'alvan/vim-closetag'


Plug 'mechatroner/rainbow_csv', {'for': 'csv'}
  let g:disable_rainbow_key_mappings = 1

Plug 'gisphm/vim-gitignore'

if system('arch') == "arm64"
    if has("nvim")
      let g:python3_host_prog =  $HOME . "/.pyenv/shims/python3"
    endif
    let g:tagbar_ctags_bin  = '/opt/homebrew/bin/ctags'
else
    let g:python3_host_prog = $HOME . "/.pyenv/versions/neovim3/bin/python3"
    let g:tagbar_ctags_bin  = '/usr/local/bin/ctags'
endif

if has("gui_macvim") || exists("g:gui_vimr") || exists('g:neovide')
  let macvim_hig_shift_movement = 1
  " Text-to-speech
  vnoremap <silent><M-s> "xy:call system('say -v Kyoko ' . shellescape(@x) . ' &')<CR>
  vnoremap <silent><C-l> "xy:call system('say -v Kyoko ' . shellescape(@x) . ' &')<CR>
  vnoremap <BS> d
endif

Plug 'othree/javascript-libraries-syntax.vim'
Plug 'pangloss/vim-javascript'

Plug 'dag/vim-fish'
Plug 'elzr/vim-json'
  let g:vim_json_syntax_conceal = 0

Plug 'dhruvasagar/vim-table-mode'
Plug 'rhysd/vim-gfm-syntax'

Plug 'cespare/vim-toml'
Plug 'tpope/vim-sleuth'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround' "{
"   " Assuming | as a cursor
"     " fo|o - ysiw' - 'foo'
"     " 'fo|o' - ds' - foo
"     " 'fo|o' - cs'" - "foo"
"   " ds ･･･ d(delete)s(surround)
"   " di ･･･ d(delete)i(inside)
"   " cs ･･･ c(change)s(surround)
"   " ci ･･･ c(change)i(inside)
"   " ys$ ･･･y(yank)s(surround)line
"   " ysiw ･･･ y(yank)s(surrond)iw(inner word)
"   " gvS' ･･･ visual surroud with char
" "}
Plug 'machakann/vim-sandwich'
Plug 'jiangmiao/auto-pairs' "{
  " <M-e> Fast Wrap (|)'hello' -> ('hello')
  " <M-n> Jump to next closed pair
"}
Plug 'tomtom/tcomment_vim' "{
 noremap  <D-1> :TComment<cr>
 vnoremap <D-1> <ESC>gv:TComment<cr>
 inoremap <D-1> <ESC>:TComment<cr>

 noremap  <Leader>k :TComment<cr>
 vnoremap <Leader>k <ESC>gv:TComment<cr>
 inoremap <Leader>k <ESC>:TComment<cr>
 let g:tcomment#filetype#guess_svelte = 1
"}

" Plug 'rhysd/conflict-marker.vim'
" co - our   - ConflictMarkerOurselves  - HEAD
" ct - their - ConflictMarkerThemselves - feature/branch
" cb - both  - ConflictMarkerBoth
" cn - none  - ConflictMarkerNone
" :ConflictMarkerNextHunk
" :ConflictMarkerPrevHunk
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'
Plug 'akioito/vim-project-files'
  noremap op :PyOpenProject<CR>
Plug 'mkitt/browser-refresh.vim'
Plug 'vim-scripts/a.vim'
Plug 'vim-scripts/grep.vim' "{
  " see https://github.com/BurntSushi/ripgrep
  set grepprg=rg\ --vimgrep
"}
Plug 'henrik/vim-reveal-in-finder', { 'on': 'Reveal' }

Plug 'preservim/tagbar' "{ Some customization
  let g:tagbar_autoclose   = 1
  let g:tagbar_autopreview = 1
  let g:tagbar_sort        = 0
  let g:tagbar_compact     = 1
  let g:tagbar_indent      = 1
  let g:tagbar_singleclick = 1
  let g:tagbar_width       = 50
  let g:tagbar_vertical    = 100
  let g:tagbar_previewwin_pos = "rightbelow vertical"
  nnoremap <C-@>      :TagbarToggle<CR>
"}

Plug 'ap/vim-css-color'
Plug 'evanleck/vim-svelte', {'branch': 'main'}
Plug 'leafoftree/vim-svelte-plugin'
Plug 'chr4/nginx.vim'
Plug 'Galicarnax/vim-regex-syntax'

if exists("g:gui_vimr") || exists('g:neovide')
  Plug 'raghur/vim-ghost', {'do': ':GhostInstall'}
    " let g:ghost_autostart = 1
    " :GhostStart
    " Shortcut for browser textarea -> Shit+Cmd+V
      function! s:SetupGhostBuffer()
          if match(expand("%:a"), '\v/ghost-(github|reddit)\.com-')
              set ft=markdown
          endif
      endfunction

      augroup vim-ghost
          au!
          au User vim-ghost#connected call s:SetupGhostBuffer()
      augroup end
end

let $BAT_THEME = 'GitHub'
let $FZF_PREVIEW_PREVIEW_BAT_THEME = 'GitHub'

Plug 'rust-lang/rust.vim', { 'for': 'rust' }
  let g:rustfmt_autosave = 1
Plug 'mhinz/vim-crates'
Plug 'Glench/Vim-Jinja2-Syntax'  " Also used for askama template
Plug 'chiedo/vim-case-convert'
Plug 'NoahTheDuke/vim-just'
Plug 'airblade/vim-rooter'
Plug 'tyru/open-browser.vim'
  let g:netrw_nogx = 1 " disable netrw's gx mapping.
  nmap gb <Plug>(openbrowser-open)
  vmap gb <Plug>(openbrowser-open)

" NERDTree
let g:mynerdtree = 0
function! MyNerdToggle()
    if g:mynerdtree == 0
        execute "normal! :NERDTree\<CR>:normal P\<CR>:normal O\<CR>"
         let g:mynerdtree = 1
    else
        execute "normal! *:NERDTreeClose\<CR>"
        let g:mynerdtree = 0
    endif
endfunction

Plug 'leafgarland/typescript-vim'
Plug 'preservim/nerdtree', { 'on': 'NERDTreeToggle' }
let g:NERDTreeMouseMode=3
" let g:NERDTreeQuitOnOpen=1
let NERDTreeShowLineNumbers=1
let NERDTreeMinimalUI=1
let NERDTreeIgnore=['target[[dir]]', '\~$', '__pycache__[[dir]]', 'book[[dir]]']
nnoremap <F6> :call MyNerdToggle()<CR>
autocmd BufEnter * if bufname('#') =~ 'NERD_tree_\d\+' && bufname('%') !~ 'NERD_tree_\d\+' && winnr('$') > 1 |
    \ let buf=bufnr() | buffer# | execute "normal! \<C-W>w" | execute 'buffer'.buf | endif

Plug 'romainl/vim-cool'
  let g:CoolTotalMatches = 1

Plug 'amadeus/vim-convert-color-to'

Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
  let g:fzf_layout = {'down': '77%'}
  let $FZF_DEFAULT_OPTS = '--reverse --color fg:240,hl:33,fg+:241,bg+:#FFFF91,bg:#FFFFFF,hl+:33 --color info:33,prompt:33,pointer:166,marker:166,spinner:33'
  let g:fzf_preview_window = ['right,70%', 'ctrl-/']
  let g:fzf_tags_command = 'ctags -R'
nnoremap <silent> <leader>c :Commands<CR>
command! LS call fzf#run(fzf#wrap({'source': 'ls'}))
command! VSCODE call system('vscode.py')
Plug 'tracyone/fzf-funky',{'on': 'FzfFunky'}

Plug 'asford/fzf-quickfix', {'on': 'Quickfix'}
Plug 'laher/fuzzymenu.vim'
  let g:fuzzymenu_layout = {'down': '50%'}
  nmap <Space>z :call fuzzymenu#Run({})<cr>

" ----------------------------------------------------------------------------
" MyMenu
  let myMenuList = [
    \'Buffers                           |:Buffers',
    \'Neoformat                         |:Neoformat',
    \'GrepBuffer word at cursor         |<F3>',
    \'Close or QSearchToggle            |<F4>',
    \'Projects            <C-P> or <F5> |<F5>',
    \'Open Project                   op |:PyOpenProject',
    \'Delete Buffer                     |:bdelete',
    \'Select Code Block                 |<S-v>}',
    \'#',
    \'next                              |:tabnext',
    \'previous                          |:tabprevious',
    \'#',
    \'Commands                          |:Commands',
    \'PlugUpdate                        |:PlugUpdate',
    \'CommandHistory                    |:History',
    \'#',
    \'BookmarkToggle                    |<F2>',
    \'BookmarkShowAll                   |<S-F2>',
    \'#',
    \'Functions - ff                    |:FzfFunky',
    \'Functions - Tagbar                |:Tagbar',
    \'Fuzzy Menu                        |<Space>z',
    \'Fzf-quickfix                      |zquick',
    \'TodoQuickFix                      |:TodoQuickFix',
    \'GhostStart                        |:GhostStart',
    \'ITerm                             |:Iterm',
    \'ItermMacScripts                   |:ItermMacScripts',
    \'WezTerm                           |:WezTerm',
    \'Reveal in Finder                  |:Reveal',
    \'Ls files in current dir           |:LS',
    \'#',
    \'LspCodeAction                     |cx',
    \'LspDefinition                     |md',
    \'LspDocumentDiagnostics            |gl',
    \'LspHover                          |gh',
    \'LspReferences                     |mr',
    \'#',
    \'TableModeToggle                   |:TableModeToggle',
    \'Tableize - Convert from CSV       |:Tableize',
    \'#',
    \'Git difftool                      |zdiff',
    \'GitHub Desktop                    |zdesk',
    \'GitHub URL                        |:GBrowse',
    \'ToGithub                          |:ToGithub',
    \'#',
    \'QuitGoneovim                      |:qall',
    \'VSCode                            |:VSCODE',
    \'xcp - copy file ref to Claude Code|xcp',
    \'vimrc                             |:e ~/.vimrc',
    \]

 function! MyMenu_sink(lines)
    if len(a:lines) < 1
      return
    endif
    if a:lines[0] == '#'
      return
    endif
    let cmd = split(a:lines[0], '|')[1]
    let prefix = cmd[0]
    if prefix == ':'
        execute 'silent call feedkeys("'.cmd.'\<CR>")'
    else
        let escaped_cmd = substitute(cmd, '<', '\\<', "g")
        execute 'silent call feedkeys("'.escaped_cmd.'")'
    endif
  endfunction

  command! MyMenu call fzf#run({
    \   'source': myMenuList,
    \   'sink*': function('MyMenu_sink'),
    \   'options': ['--exact', '--prompt', 'Select cmd>'],
    \   'window': { 'width': 0.5, 'height': 0.55 }
    \ })
  nnoremap <silent> <leader><Space> :MyMenu<CR>
  nnoremap <silent> m :MyMenu<CR>


Plug 'yegappan/mru' " usage as :MRU vim-prj
  let MRU_Max_Entries = 2500 " saved at ~/.vim_mru_files
  let MRU_Window_Height = 40
  let MRU_Max_Menu_Entries = 50

  nnoremap zquick               :<C-u>Quickfix<cr>
  nnoremap zdiff                :<C-u>!git difftool<cr>  " Dialog yes/no only works for MacVim...
  nnoremap zdesk                :<C-u>!github<cr>

  nnoremap <silent> <C-l>       :<C-u>Buffers<cr>
  nnoremap <space>p  :<C-u>MRU vim-prj<cr>
  nnoremap <F5>      :<C-u>XMRU<cr>
  command! XMRU call fzf#run(fzf#wrap({'source': 'cat ~/.vim_mru_files|rg -a vim-prj'}))
  nnoremap <silent> <C-P> <ESC>:call feedkeys("\<F5>")<CR>

" Plug 'tpope/vim-sensible'
Plug 'godlygeek/csapprox'
Plug '~/.vim/mybundle/misc'
Plug '~/.vim/mybundle/sbd.vim'
" Plug '~/.vim/mybundle/vim-command-w'

call plug#end()

call wilder#setup({'modes': [':', '/', '?']})
call wilder#set_option('renderer', wilder#popupmenu_renderer({
      \ 'highlighter': wilder#basic_highlighter(),
      \ 'min_width':  '50%',
  \ }))

call wilder#set_option('pipeline', [
      \   wilder#branch(
      \     wilder#cmdline_pipeline({
      \       'language': 'python',
      \     }),
      \     wilder#python_search_pipeline({
      \       'pattern': wilder#python_fuzzy_pattern(),
      \       'sorter': wilder#python_difflib_sorter(),
      \       'engine': 're',
      \     }),
      \   ),
      \ ])

" Required:
filetype plugin indent on

" ----------------------------------------------------------------------------
" Turn on filetype detection
filetype on
filetype plugin on

" ----------------------------------------------------------------------------
" set termencoding=utf-8
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
" vim command line
nnoremap cm :

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

function! MyLspProgress() abort
  let l:progress = lsp#get_progress()
  if empty(l:progress) | return '' | endif
  let l:progress = l:progress[len(l:progress) - 1]
  return l:progress['server'] . ': ' . l:progress['message']
endfunction

let g:syntax = '???'
let g:currentTag = '???'
let g:progress = '???'

augroup my_autocmd_misc
  autocmd!
  autocmd CursorHold * let g:currentTag = tagbar#currenttag('%s','','s')
  autocmd CursorHold * let g:syntax = SyntaxItem()
  autocmd CursorHold * let g:progress = MyLspProgress()

  " Go to last file if invoked without arguments.
  if has("nvim")
    autocmd VimEnter * if !argc() | call feedkeys("\<C-O>") | endif " nvim
  else
      autocmd VimEnter * nested if
        \ argc() == 0 &&
        \ bufname("%") == "" &&
        \ bufname("2" + 0) != "" |
        \   exe "normal! `0" |
        \ endif
  endif

  autocmd FileType qf call feedkeys("\<C-w>k")
augroup end

" set statusline=%4*\ %l\/%L\ -\ %P,\ column\ %c\
set statusline=%L\ column\ %c\ %p%%
set statusline+=\ %{FugitiveStatusline()}
set statusline+=%5*\ %f\                           " file name
set statusline+=%3*\ %{g:currentTag}
set statusline+=%5*\ %=%{g:syntax}                 " for nvim also use ,,
set statusline+=%0*\ %{&ff}\                       " file format
set statusline+=%4*\ %{(&fenc==\"\"?&enc:&fenc)}\  " encoding
set statusline+=%4*\ %{g:progress}
set statusline+=%0*%y%*                            " file type

" ----------------------------------------------------------------------------
" Abbrevs
iabbrev xrm # testIto remove after test...

" ----------------------------------------------------------------------------
" Maps
map <Space> <Leader>

nnoremap <silent>  <ESC><ESC> :<C-u>nohlsearch<CR>
nnoremap <C-[>     <C-t>
" overwrite <ESC> <C-t> mapped by vim-lsp
" nnoremap <ESC>  <ESC>
nnoremap <D-f>  <ESC>:call feedkeys('/')<CR>
inoremap <D-s>  <ESC>:w<CR>

if exists('g:neovide')
  nnoremap <D-z> u
  inoremap <D-z> <ESC>u
  nnoremap <D-a> ggVG
  inoremap <D-a> ggVG
endif

" 挿入モードでのIME状態を記憶させない場合、次行のコメントを解除
"inoremap <silent> <ESC> <ESC>:set iminsert=0<CR>

"Tricks
" Ctrl + m = Enter
" Ctrl + i = Tab
" Ctrl 6 or Ctrl ^ switches to the last visited buffer
" Ctrl o / Ctrl i Jump previously visited location
" Ctrl v -> Shift cursor movements / 'c' / Select vertically
" Shift v -> Select line
" Shift j -> Join Lines
" Back to tag equ CTR-T
" Cursor movements / scroll relative
"  H - top         / zh or zt
"  M - middle      / zz or zm
"  L - Bottom      / zl or zb
"nnoremap <C-[>     <C-t>
"q: " Open cmd line history
":colder, restore QuickFix after :QFGrep
"git log -GsearchString --all
":Errors for syntastic quickfix
":Reveal to reveal the current file in the OS X Finder.
"z/ to toggle highlighting all instance of word under cursor on/off
" :%s/foo/bar/gc
" :%retab : replace all the tabs with spaces in the entire file
"gUw  : Change to end of current WORD from lower to upper
" zR ulfold all
" b start of current word
" gi Resumes inserting at the last place
" Smart way to move buffer
" mvim -d -g filea fileb (vimdiff)
"
" Ctrl-X Ctrl-F Complete file
" :GhostStart  (Cmd + shift + k)
" :MarkdownPreview
" :MarkdownPreviewStop
"
" :TableModeToggle
" :Tableize   convert from CSV
"
" :BufferTree
" :ToggleCB  Toggle checkbox
" neovim
"  - vey yank word (start)
"  - viwy yank work
"  - y yank selected
"  - p past
"  - ctr+r* paste to command line or in insert mode
"  :TodoQuickFix

" Save read-only file :w!!<enter>
cmap w!! w !sudo tee % >/dev/null

if has("clipboard")
  set clipboard+=unnamedplus
endif

" neovim paste
inoremap <C-v> <C-r>*
cnoremap <C-v> <C-r>*
noremap  <C-v> <Esc>hp
nnoremap <leader>w :<C-u>w<cr>h
inoremap <Space>w <Esc>:<C-u>w<cr>l

noremap zh zt
noremap zl zb
noremap zm zz

noremap zr zR

nnoremap  b<Space> :b<Space>
noremap! ¥ \

" Buffer Navigation
map <SwipeLeft>     <C-o>
map <SwipeRight>    :bn<CR>

map <SwipeUp>      <C-f>
map <SwipeDown>    <C-b>

nnoremap bd :bdelete

nnoremap <C-j> :cnext<cr>kj
nnoremap <C-k> :cprevious<cr>kj

nnoremap <leader>v       0<C-v>$
" nnoremap <leader>w       <C-w>v<C-w>l
nnoremap zr              zRzz
" Browser refresh
let g:RefreshRunningBrowserReturnFocus = 0
let g:RefreshRunningBrowserDefault     = 'firefox'
nnoremap rr :call RefreshRunningBrowser()<CR>

" visual shifting
vnoremap < <gv
vnoremap > >gv

" Scroll for terminal
tnoremap <Esc><Esc> <C-\><C-n>

" ----------------------------------------------------------------------------
inoremap <silent> <F3>  <ESC>:Bgrep<CR><CR>
noremap  <silent> <F3>       :Bgrep<CR><CR>
  let g:Lf_PreviewResult = {'Rg': 1 }

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
    " autocmd BufEnter *.py  :match defLine /def\ .*$/
    " autocmd BufEnter *.js  :match defLine /.*function.*$/
    autocmd BufEnter *.js nnoremap <leader>f  :<C-u>Lines function<cr>
    autocmd BufEnter * :syntax sync fromstart
    autocmd BufEnter,BufFilePost * let &titlestring = expand('%:t') . ' - ' . expand('%:p:h')
    autocmd BufNewFile,BufRead *.conf set filetype=nginx
    autocmd BufNewFile,BufRead *.go setlocal noet ts=4 sw=4 sts=4
    autocmd BufNewFile,BufRead .gitignore,*.vim-prj set filetype=gitignore
    autocmd BufRead *.vim-prj call feedkeys("op")

    " Problem with Japanese IME / 例: 中 (tyuu)
    " autocmd VimEnter * set imdisable

    autocmd FileType html setlocal indentkeys-=*<Return>
    autocmd FileType svelte runtime ftplugin/html/sparkup.vim

    " Trim Trailing Whitespace
    autocmd BufWritePre *.{py,rs,js,html,css,swift,vimrc,lua,sh} %s/\s\+$//e

    " FocusLost save and Normal Mode
    autocmd FocusLost * silent! wa
    autocmd FocusLost * if mode()[0] =~ 'i\|R' | call feedkeys("\<Esc>") | endif
    autocmd FocusGained * checktime

    " Fast Cursor / nocursorline in Insert Mode
    autocmd CursorHold * setlocal cursorline
    autocmd CursorMoved,InsertEnter * if &l:cursorline | setlocal nocursorline | endif

    " ESC to not append 'g' when save in insert mode
    " autocmd BufWritePost *.svelte call feedkeys("\<Esc>") | :LspDocumentFormat
    autocmd BufWritePost *.svelte silent execute '!npm run vim_fmt %:p'| call feedkeys("\<Esc>")
    autocmd BufWritePost .vimrc,vimrc so $MYVIMRC " No more restart MacVim after editing vimrc
    " autocmd ColorScheme * hi LineNr ctermbg=NONE guibg=NONE
    " Don't wrap in quickfix, and don't show in buffer list
    autocmd FileType qf setlocal nowrap textwidth=0 nobuflisted
    " autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
    " autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
    autocmd InsertLeave * let g:cursorword = 1
    autocmd InsertEnter * let g:cursorword = 0
augroup end

" QuickFix Close or Search
function! QSearchToggle(forced)
    if exists("g:qfix_win") && a:forced == 0
        cclose
    else
        execute "normal! *:Bgrep\<CR>\<CR>"
    endif
endfunction

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
" Copy file ref to Claude Code
nnoremap xcp <ESC>gv:XCP<cr>
command! -range XCP call CopySelectionReferenceCmd(<line1>, <line2>)

function! CopySelectionReferenceCmd(start_line, end_line)
    let filename = expand('%')
    if filename == ''
        let filename = '[No Name]'
    endif

    if a:start_line == a:end_line
        let reference = '@' . filename . '#L' . a:start_line
    else
        let reference = '@' . filename . '#L' . a:start_line . '-L' . a:end_line
    endif
    let reference = reference . ' pytest add test code'
    if has('clipboard')
        if has('unnamedplus')
            let @+ = reference
        else
            let @* = reference
        endif
    endif
    echo "Copied: " . reference
    redraw
endfunction

" ----------------------------------------------------------------------------
function! GenPyTest(...)
    let filename = expand('%')
    let line_content = getline('.')
    let line_content = trim(line_content)

    let pytest_cmd = 'pytest, add test code for @' . filename . ', ' . line_content
    if has('clipboard')
        if has('unnamedplus')
            let @+ = pytest_cmd
        else
            let @* = pytest_cmd
        endif
    endif
    echo "Copied: " . pytest_cmd
endfunction

command! GenPyTest call GenPyTest()

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
  silent exec "!open -n -a iTerm '".getcwd()."'" | redraw!
endfunction
command! -nargs=* Iterm call Iterm()

" ----------------------------------------------------------------------------
function! WezTerm()
  silent exec "!wezterm cli spawn --new-window --cwd '".getcwd()."'" | redraw!
endfunction
command! -nargs=* WezTerm call WezTerm()

" ----------------------------------------------------------------------------
function! ItermMacScripts()
  silent exec "!open -n -a iTerm '".$HOME."/mac_scripts'"
endfunction
command! -nargs=* ItermMacScripts call ItermMacScripts()

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
nnoremap <silent> K        :call <SID>MoveVToNonBlank('Up')<CR>
nnoremap <silent> J        :call <SID>MoveVToNonBlank('Down')<CR>
nnoremap <silent> <C-Up>   :call <SID>MoveVToNonBlank('Up')<CR>
nnoremap <silent> <C-Down> :call <SID>MoveVToNonBlank('Down')<CR>

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
  " For Command T/W
  " macmenu &File.New\ Tab key=<nop>
  " macmenu &File.Close key=<nop>
  " nmap <D-w> :CommandW<CR>
  " imap <D-w> <Esc>:CommandW<CR>
endif

set guifont=Lekton\ Nerd\ Font:h19
" set guifont=Maple\ Mono\ ExtraLight:h16

colorscheme mycolor

set hlsearch                           " Highlight search
set ignorecase                         " Ignore case when searching
set smartcase
set cmdheight=2
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
set autowrite
set nobackup
set noswapfile
set nowritebackup
" set imdisable
set virtualedit=all
set shortmess=oO
set number
let fillchars='eob: '
if has("nvim")
  highlight FoldColumn guibg=white guifg=blue
  set linespace=-6
else
  hi EndOfBuffer ctermfg=0 guifg=bg
  set selection=exclusive
  set linespace=-3
endif
set lazyredraw                          " to avoid scrolling problems
set ttyfast
set timeout timeoutlen=300 ttimeoutlen=50
augroup FastEscape
    autocmd!
    au InsertEnter * set timeoutlen=20
    au InsertLeave * set timeoutlen=300
augroup END
set updatetime=300
set noundofile

set completeopt=longest,noselect,preview,popup
set breakindent
set breakindentopt=shift:2
set iskeyword+=-                        " treat dashes as part of word
set wildmenu
set laststatus=2
set t_Co=256
set vb t_vb=
set signcolumn=yes
set list listchars=tab:»-,trail:°,extends:»,precedes:«
highlight NonText guifg=blue guibg=white
" highlight CursorWord2  guibg=#ffffa2
set cursorline cursorlineopt=number
highlight ScrollView guibg=Gray
if has('termguicolors')
    set termguicolors
endif
set signcolumn=number
highlight FoldColumn guibg=White
highlight lspReference guibg=#ffffa2
if has("nvim")
  set foldcolumn=1
  highlight CursorWord  guibg=#f8edeb
  highlight LspReferenceText  guibg=#ffffa2
endif

" End
