# .vim
This is my Vim configuration. Plugins managed by Vundle.

## Included Plugins
* Vundle
* UltiSnips
* vim-snippets
* YouCompleteMe
* vim-fugitive
* vim-colors-solarized
* vim-gutentags

## Installation
```bash
cd ~
git clone https://github.com/hhu94/.vim.git --recursive
# Compile YouCompleteMe with C-family language support
./.vim/bundle/YouCompleteMe/install.py --clang-completer
vim +PluginInstall +qall
```

## Dependencies
* Vim version >= 7.4 compiled with Python 2.x support.
* Python version >= 2.7 or >= 3.0.
* Exuberant-ctags, any version.
* CMake version >= 2.8.11.

