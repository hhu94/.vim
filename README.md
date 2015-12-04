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
```
cd ~
git clone https://github.com/hhu94/.vim.git --recursive
# Compile YouCompleteMe with C-family language support
./.vim/bundle/YouCompleteMe/install.py --clang-completer
vim +PluginInstall +qall
```
