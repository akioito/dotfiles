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
brew install universal-ctags

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


Enjoy!

If you want o uninstall:
```  
cd ~/dotfiles
stow -D vim
(Restore you Backup - ~/.vim and ~/.vimrc)
(Eventually you need to remove ~/.config/nvim/autoload/plug.vim)

```  

# Usual commands:
Normal mode     
```  
<Space><Space> General menu command
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
    \'sfref - send file ref to iTerm    |sfref',
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


