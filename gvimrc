if has("gui_macvim")
   set guioptions-=T " No toolbar
   set go-=L         " No verticall scoll bar for minibufexpl
   " set ambiwidth=auto
   set macmeta
   highlight Cursor guifg=yellow guibg=brown
end

" For Command T/W
macmenu &File.New\ Tab key=<nop>
macmenu &File.Close key=<nop>
" macmenu Edit.Find.Find\.\.\. key=<D-g>

nmap <D-w> :CommandW<CR>
imap <D-w> <Esc>:CommandW<CR>

" colorscheme mycolor
" set guifont=Menlo:h14    
" set guifont=Courier:h16
" set guifont=Ubuntu\ Mono:h16
" set guifont=Osaka-Mono:h18
" set guifont=Inconsolata\ XL:h16
" set guifont=Monaco:h14
" set guifont=Source\ Code\ Pro:h15
"
" set columns=180
" set lines=65 
