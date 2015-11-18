" Vundle settings
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

Plugin 'Valloric/YouCompleteMe'

Plugin 'altercation/vim-colors-solarized'

Plugin 'ludovicchabant/vim-gutentags'

Plugin 'SirVer/ultisnips'
let g:UltiSnipsEditSplit="vertical"

Plugin 'honza/vim-snippets'
let g:tex_flavor = "latex"

" All of your Plugins must be added before the following line
call vundle#end()            " required

" When started as "evim", evim.vim will already have done these settings.
if v:progname =~? "evim"
  finish
endif

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

if has("vms")
  set nobackup		" do not keep a backup file, use versions instead
else
  set backup		" keep a backup file (restore to previous version)
  set undofile		" keep an undo file (undo changes after closing)
endif
set history=50		" keep 50 lines of command line history
set ruler		" show the cursor position all the time
set showcmd		" display incomplete commands
set incsearch		" do incremental searching

" Don't use Ex mode, use Q for formatting
map Q gq

" CTRL-U in insert mode deletes a lot.  Use CTRL-G u to first break undo,
" so that you can undo CTRL-U after inserting a line break.
inoremap <C-U> <C-G>u<C-U>

" In many terminal emulators the mouse works just fine, thus enable it.
if has('mouse')
  set mouse=a
endif

" Only do this part when compiled with support for autocommands.
if has("autocmd")
  " Put these in an autocmd group, so that we can delete them easily.
  augroup vimrcEx
  au!

  " For all text files set 'textwidth' to 78 characters.
  autocmd FileType text setlocal textwidth=78

  " When editing a file, always jump to the last known cursor position.
  " Don't do it when the position is invalid or when inside an event handler
  " (happens when dropping a file on gvim).
  autocmd BufReadPost *
    \ if line("'\"") >= 1 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif

  augroup END

else

  set autoindent		" always set autoindenting on

endif " has("autocmd")

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

" Set tab size to 4, V> indent size to 4, and tab column size to 4.
set tabstop=4 shiftwidth=4 softtabstop=4

" Enable solarized
syntax enable
set background=dark
colorscheme solarized

" Change destination of backup and swap files.
set backupdir=~/.vim/backups//
set directory=~/.vim/swapfiles//

" YCM and UltiSnips integration
	let g:UltiSnipsExpandTrigger       ="<c-tab>"
	let g:UltiSnipsJumpForwardTrigger  = "<tab>"
	let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"

	" Enable tabbing through list of results
	function! g:UltiSnips_Complete()
		call UltiSnips#ExpandSnippet()
		if g:ulti_expand_res == 0
			if pumvisible()
				return "\<C-n>"
			else
				call UltiSnips#JumpForwards()
				if g:ulti_jump_forwards_res == 0
				   return "\<TAB>"
				endif
			endif
		endif
		return ""
	endfunction

	au InsertEnter * exec "inoremap <silent> " . g:UltiSnipsExpandTrigger . " <C-R>=g:UltiSnips_Complete()<cr>"

	" Expand snippet or return
	let g:ulti_expand_res = 0
	function! Ulti_ExpandOrEnter()
		call UltiSnips#ExpandSnippet()
		if g:ulti_expand_res
			return ''
		else
			return "\<return>"
	endfunction

	" Set <space> as primary trigger
	inoremap <return> <C-R>=Ulti_ExpandOrEnter()<CR>
" End YCM and UltiSnips integration

filetype plugin indent on
