" ----------------------------------------------------------------------------
"  .vimrc
"  18-06-2023 - Wim Alsemgeest
" ----------------------------------------------------------------------------

" ----------------------------------------------------------------------------
"  Add a plugin manager.
"  I use vim-plug. The manager can be found on github.com.
"  https://github.com/junegunn/vim-plug
"
"  To install:
"  curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
"   https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
"
"   Commands to use:
"   	PlugInstall	- Install plugins
"   	PlugUpdate	- Install or update plugins
"   	PlugClean	- Remove unlisted plugins
"   	PlugUpgrade	- Upgrade vim-plug itself
"   	PlugDiff	- Examine changes from the previous update and pending
"   			  changes
"   	PlugSnapshot	- Generate script for restoring the current snapshot
"   			  of the plugins
" ----------------------------------------------------------------------------
"  Links to the loaded plugings
"  vim-material - https://github.com/hzchirs/vim-material
"  vim-airline  - https://github.com/vim-airline
"
" ----------------------------------------------------------------------------
call plug#begin()

Plug 'hzchirs/vim-material'		" Load the material theme
Plug 'vim-airline/vim-airline'		" Install a status bar
Plug 'vim-airline/vim-airline-themes'	" Install status bar themes

call plug#end()


" ----- Setup colorscheme ----------------------------------------------------
set background=dark
colorscheme vim-material
" ----- Italics for myu color scheme
let g:material_style='palenight'
hi Normal guibg=NONE ctermbg=NONE
if (has("termguicolors"))
	set termguicolors
endif
" ---- Setup status bar ------------------------------------------------------
let g:airline#extensions#tabline#enable=1
let g:airline#extensions#tabline#left_sep=' '
let g:airline#extensions#tabline#left_alt_sep='|'
let g:airline_powerline_fonts=1
let g:airline_theme='material'

