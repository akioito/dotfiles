# My MacVim dotfile


Install HomeBrew  / https://brew.sh/ 
```
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)" 
```

Install python + packages:
```
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

Install MacVim:
```  
https://github.com/macvim-dev/macvim/releases (MacVim.dmg)
```  

Clone this repository to  home directory:

```  
cd ~
git clone https://github.com/akioito/dotfiles.git
./dotfiles/install.sh

mvim 
:PlugInstall# wait until end plugin installation -> :quit

mvim
```  

Enjoy!

--------------------------------------------------  
Speed-up LeaderF
```  
cd ~/.vim/plugged/LeaderF
./install.sh
```  

# Usual commands:
Normal mode     
```  
Ctl-P General menu command
   LeaderF            Shortcut/Command
     lfFunction       <Space>f / <C-Space> / <C-R>
     lfProjects       <Space>p
     lfBuffers        <Space>b
     lfLeaderf        <Space>l
   Direct Command           
     Project Open     :PyOpenProject
     vimrc            :e ~/.vimrc
   Legacy              
     python def            
     Functions        <C-@>
     Projects         ct
     Buffers          fj/<C-l>
     Update plugins   unu
     messages         :messages
     keyboard map     mm
     bookmars         <F2>
     marks            um
     unite source     us
     jump             :Unite jump
     change           :Unite change
```  

F3  for global search word (Cmd J/Cmd K for navigation) / F4 Close quick fix<br> 
Shift Cursor Select and Enter for Align column<br>  
Cmd-1 for Comment/Uncomment<br> 

For Python (vim-lsp-python):<br>
jr   LspReferences (Cmd J/Cmd K for navigation)<br> 
jd   LspDefinition (Ctr-o to back)<br> 
jh   LspHover<br> 
For other commands also see .vimrc

# Project management
see mybundle/vim-project-files or https://github.com/akioito/vim-project-files<br> 
open sample.vim-prj<br>
:PyOpenProject (or op)



# Visual trick:
```  
Terminal
defaults write org.vim.MacVim MMTextInsetLeft  5
defaults write org.vim.MacVim MMTextInsetRight 2 
```  


# If you want to compile your MacVim
```  
git clone https://github.com/macvim-dev/macvim.git (first time)
# git pull        
# make distclean
cd macvim
CFLAGS=-O3 ./configure --enable-python3interp 
make
```  

Symlink (Only for first time)
```  
cd /Applications
ln -s $HOME/macvim/src/MacVim/build/Release/MacVim.app .   
``` 

mvim Command Line Alias
``` 
alias mvim='/Applications/MacVim.app/Contents/MacOS/Vim -g'
``` 
