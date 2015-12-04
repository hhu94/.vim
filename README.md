# .vim
This is my Vim configuration for Unix systems. Plugins managed by Vundle.

#### Included Plugins
* Vundle
* UltiSnips
* vim-snippets
* YouCompleteMe
* vim-fugitive
* vim-colors-solarized
* vim-gutentags

#### Installation
Back up your current .vim:
```
mv ~/.vim ~/.vim.bak
```
Clone this repository and Vundle:
```
git clone https://github.com/hhu94/.vim.git ~/.vim
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
```
Install plugins:
```
vim +PluginInstall +qall
```
Pre-compile YouCompleteMe with support for C-family languages, check out
https://github.com/Valloric/YouCompleteMe#installation for options to support 
other languages:
```
~/.vim/bundle/YouCompleteMe/install.py --clang-completer
```
