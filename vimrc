================================================================================

" Author: Hao Hu - github.com/hhu94
" Vimrc for Unix systems and vim compiled with autocmd support

================================================================================

set nocompatible              " be iMproved

" ================================= Vundle =====================================

filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'altercation/vim-colors-solarized'

" For use with exuberant-ctags
Plugin 'ludovicchabant/vim-gutentags'

" Pre-compile with .vim/bundle/YouCompleteMe/install.py
Plugin 'Valloric/YouCompleteMe'

Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
Plugin 'tpope/vim-fugitive'

call vundle#end()

" ================================= Plugins ====================================

" UltiSnips
let g:UltiSnipsExpandTrigger="<C-j>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"
let g:UltiSnipsEditSplit="vertical"
let g:UltiSnipsSnippetsDir="~/.vim/UltiSnips"

" vim-snippets
let g:tex_flavor="latex"

" ================================= General ====================================

set number		" enable line numbers
set backspace=2 " allow backspacing over everything in insert mode
set undofile	" keep an undo file (undo changes after closing)
set history=50	" keep 50 lines of command line history
set ruler		" show the cursor position all the time
set showcmd		" display incomplete commands
set incsearch	" do incremental searching
set mouse=a		" enable mouse
set autoindent		" always set autoindenting on
set textwidth=80	" set text width to 80
set colorcolumn=+1	" highlight 81th column
set tabstop=4		" set tab size to 4
set shiftwidth=4	" set v> indent size to 4
set softtabstop=4	" set tab column size to 4

" keep backup files and change destination of backup and swap files.
set backup
set backupdir=~/.vim/backups//
set directory=~/.vim/swapfiles//

" enable filetype detection, filetype specific plugins and indentation rules
filetype plugin indent on

" Enable syntax highlighting
syntax enable

" ================================ Theme =======================================

set background=dark
" Uncomment the following if using terminal vim and the terminal is not running
" with solarized colors.
" let g:solarized_termcolors=256
colorscheme solarized

" ================================ Remaps ======================================

inoremap <C-U> <C-G>u<C-U> 
inoremap <C-W> <C-G>u<C-W>
inoremap <CR> <C-G>u<CR>
  
" ================================ Addons ======================================

" When editing a file, always jump to the last known cursor position.
autocmd BufReadPost *
  \ if line("'\"") >= 1 && line("'\"") <= line("$") |
  \   exe "normal! g`\"" |
  \ endif

" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
" Only define it when not defined already.
if !exists(":DiffOrig")
  command DiffOrig vert new | set bt=nofile | r ++edit # | 0d_ | diffthis
		  \ | wincmd p | diffthis
endif

if has('langmap') && exists('+langnoremap')
  " Prevent that the langmap option applies to characters that result from a
  " mapping.  If unset (default), this may break plugins (but it's backward
  " compatible).
  set langnoremap
endif
