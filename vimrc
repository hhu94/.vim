"===============================================================================

" Author: Hao Hu - github.com/hhu94
" Vimrc for Unix systems and vim compiled with autocmd support.

"===============================================================================

set nocompatible    " Be iMproved

"================================== Vundle =====================================

filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'altercation/vim-colors-solarized'

" For use with exuberant-ctags.
Plugin 'ludovicchabant/vim-gutentags'

" Pre-compile with .vim/bundle/YouCompleteMe/install.py 
Plugin 'Valloric/YouCompleteMe'

Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
Plugin 'tpope/vim-fugitive'
Plugin 'Raimondi/delimitMate'
Plugin 'scrooloose/syntastic'

call vundle#end()

"============================= Plugin Variables ================================

" UltiSnips
let g:UltiSnipsExpandTrigger        = "<C-j>"
let g:UltiSnipsJumpForwardTrigger   = "<C-j>"
let g:UltiSnipsJumpBackwardTrigger  = "<C-k>"
let g:UltiSnipsEditSplit            = "vertical"
let g:UltiSnipsSnippetsDir          = "~/.vim/UltiSnips"

" delimitMate
let delimitMate_expand_cr = 1

" Syntastic
let g:syntastic_javascript_checkers = ['jshint']

"================================== General ====================================

set number          " Enable line numbers
set backspace=2     " Allow backspacing over everything in insert mode
set history=50      " Keep 50 lines of command line history
set ruler           " Show the cursor position all the time
set showcmd         " Display incomplete commands
set incsearch       " Do incremental searching
set mouse=a         " Enable mouse
set autoindent      " Always set autoindenting on
set textwidth=80    " Set text width to 80
set colorcolumn=+1  " Highlight 81th column
set tabstop=2       " Set tab size to 4
set shiftwidth=2    " Set v> indent size to 4
set softtabstop=2   " Set tab column size to 4
set expandtab       " Insert spaces when inserting a tab

" Keep backup files and change destination of backup and swap files.
" Create ~/.backups if it doesn't exist
if !isdirectory($HOME."/.backups")
    call mkdir($HOME."/.backups", "p")
endif
set backup
set backupdir=~/.backups//
set directory=~/.backups//

" Keep an undo file (undo changes after closing) in ~/.backups
set undofile
set undodir=~/.backups//

" Enable filetype detection, filetype specific plugins and indentation rules.
filetype plugin indent on

" Detect .tex files as latex files
let g:tex_flavor = "latex"

" Enable syntax highlighting.
syntax enable

"=================================== Theme =====================================

set background=dark
" Uncomment the following if using terminal vim and the terminal is not running
" with solarized colors.
" let g:solarized_termcolors=256
colorscheme solarized

"=================================== Remaps ====================================

" Use 'space' as leader but show '\' for showcmd
map <space> <leader>

inoremap <C-U> <C-G>u<C-U> 
map <leader>t :ProjectTreeToggle<CR>

nmap <leader>o o<Esc>k
nmap <leader>O O<Esc>j

"=================================== Addons ====================================

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
