# My MacVim/Vimr/Neovide dotfile


Install HomeBrew  / https://brew.sh/ 
```
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

Install python + packages:
```
brew install stow
brew install neovim
brew install cmake
brew install python
brew install ripgrep
brew install --HEAD universal-ctags/universal-ctags/universal-ctags

pip3 install pynvim
```

Install Lekton Nerd Font (or Ajust guifont)<br>
https://www.nerdfonts.com/font-downloads <br><br>

       
Install MacVim: (or Vimr, Neovide...)
```  
https://github.com/macvim-dev/macvim/releases (MacVim.dmg)
```  

Clone this repository to  home directory:

(Backup your ~/.vim and ~/.vimrc)

```fish  
cd ~
git clone https://github.com/akioito/dotfiles.git
cd dotfiles
./install.sh

MacVim / Neovide 
:PlugInstall# wait until end plugin installation -> :quit

LSP Python Ruff
cd ~/.local/share/vim-lsp-settings/servers/pylsp
source venv/bin/activate.fish
pip install python-lsp-ruff
```  

Enjoy!

If you want o uninstall:
```  
cd ~/dotfiles
stow -D vim
(Restore you Backup - ~/.vim and ~/.vimrc)
(Eventually you need to remove ~/.config/nvim/autoload/plug.vim)

```  
--------------------------------------------------  
Speed-up LeaderF
```  
cd ~/.vim/plugged/LeaderF
./install.sh
```  

# Usual commands:
Normal mode     
```  
<Space><Space> General menu command
  let myMenuList = [
    \'Buffers                  <Space>b |<C-l>',
    \'#',
    \'Close or QSearchToggle            |<F4>',
    \'Commands                          |:LeaderfCommand',
    \'Delete Buffer                     |:bdelete',
    \'#',
    \'BookmarkToggle                    |<F2>',
    \'BookmarkShowAll                   |<S-F2>',
    \'#',
    \'Functions               <C-Space> |<Space>f',
    \'Fuzzy Menu                        |<Space>z',
    \'Fzf-quickfix                      |zquick',
    \'GhostStart                        |:GhostStart',
    \'GrepBuffer word at cursor         |<F3>',
    \'ITerm                             |:Iterm',
    \'Ls files in current dir           |:LS',
    \'#',
    \'LspDocumentDiagnostics            |gl',
    \'LspDefinition                     |md',
    \'LspHover                          |gh',
    \'LspReferences                     |mr',
    \'#',
    \'CodeiumAuto                       |:CodeiumAuto',
    \'CodeiumManual                     |:CodeiumManual',
    \'#',
    \'Open Project                   op |:PyOpenProject',
    \'PlugUpdate                        |:PlugUpdate',
    \'Projects            <C-P> or <F5> |<Space>p',
    \'Reveal in Finder                  |:Reveal',
    \'Tableize - Convert from CSV       |:Tableize',
    \'TableModeToggle                   |:TableModeToggle',
    \'TodoQuickFix                      |:TodoQuickFix',
    \'GitHub URL                        |:GBrowse',
    \'vimrc                             |:e ~/.vimrc',
    \]
```

F3  for global search word (Cmd J/Cmd K for navigation) / F4 Close quick fix<br> 
Cmd-1 for Comment/Uncomment<br> 

For other commands also see .vimrc

# Project management
see mybundle/vim-project-files or https://github.com/akioito/vim-project-files<br> 
open sample.vim-prj<br>
:PyOpenProject (or op)


