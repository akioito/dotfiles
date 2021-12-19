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

pip3 install neovim
pip3 install flake8 
pip3 install jedi
pip3 install python-language-server --upgrade
```

Install MacVim: (or Vimr, Neovide...)
```  
https://github.com/macvim-dev/macvim/releases (MacVim.dmg)
```  

Clone this repository to  home directory:

(Backup your ~/.vim and ~/.vimrc)

```  
cd ~
git clone https://github.com/akioito/dotfiles.git
cd dotfiles
./install.sh

mvim 
:PlugInstall# wait until end plugin installation -> :quit

mvim
:CocUpdate
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
    \'Buffers                  <Space>b |<Space>l', 
    \'#',
    \'Close or QSearchToggle            |<F4>', 
    \'Commands                          |:Commands',
    \'Delete Buffer                     |:bdelete', 
    \'#', 
    \'Functions               <C-Space> |<Space>f',
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
```  

F3  for global search word (Cmd J/Cmd K for navigation) / F4 Close quick fix<br> 
Shift Cursor Select and Enter for Align column<br>  
Cmd-1 for Comment/Uncomment<br> 

For other commands also see .vimrc

# Project management
see mybundle/vim-project-files or https://github.com/akioito/vim-project-files<br> 
open sample.vim-prj<br>
:PyOpenProject (or op)


# If you want to compile your MacVim (fish shell)
```  
git clone https://github.com/macvim-dev/macvim.git (first time)
# git pull        
# make distclean
cd macvim
set -x CFLAGS -O3;set -x CC gcc; ./configure  --enable-python3interp --with-features=huge --enable-multibyte --with-python3-command=python3
make
```  

