" ----------------------------------------------------------------------------
"   .vimrc
"   18-06-2023 - Wim Alsemgeest
" ----------------------------------------------------------------------------

" ----------------------------------------------------------------------------
"   Add a plugin manager.
"   I use vim-plug. The manager can be found on github.com.
"       https://github.com/junegunn/vim-plug
"
"   To install:
"   curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
"       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
"
"   Commands to use:
"       PlugInstall     - Install plugins
"   	PlugUpdate	    - Install or update plugins
"   	PlugClean	    - Remove unlisted plugins
"   	PlugUpgrade	    - Upgrade vim-plug itself
"   	PlugDiff	    - Examine changes from the previous update and pending
"   			          changes
"   	PlugSnapshot	- Generate script for restoring the current snapshot
"   			          of the plugins
" ----------------------------------------------------------------------------
"   Links to the loaded plugings
"       vim-material - https://github.com/hzchirs/vim-material
"       vim-airline  - https://github.com/vim-airline
"       nerdtree     - https://github.com/preservim/nerdtree
"       rust-lang    - https://github.com/rust-lang/rust.vim
" ----------------------------------------------------------------------------
call plug#begin()

Plug 'hzchirs/vim-material'             " Load the material theme
Plug 'vim-airline/vim-airline'          " Install a status bar
Plug 'vim-airline/vim-airline-themes'   " Install status bar themes
Plug 'preservim/nerdtree'               " File explorer
Plug 'dense-analysis/ale'               " Lint enginge
Plug 'rust-lang/rust.vim'               " Rust file detection
Plug 'xuhdev/vim-latex-live-preview'    " Latex preview

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

" ----- General settings -----------------------------------------------------
set nobackup                            " No backup files
set nowritebackup                       " If a file is edited by another
                                        " application, no backup writing
set clipboard="unnamedplus"             " Allow vim to acces system clipboard
set expandtab                           " Convert tab to spaces
set shiftwidth=4                        " Number of spaces for a indent
set tabstop=4                           " Insert 4 spaces for a tab
set cmdheight=2                         " More space in the command-line
set completeopt=menu,menuone,preview,noselect,noinsert " Mostly for ALE
set conceallevel=0                      " So that ' ' is visible in markdown
set fileencoding="utf-8"                " The encoding writen to a file
set hlsearch                            " Highlight all matches on previous search
set ignorecase                          " Ignore case in search patterns
set pumheight=10                        " Popup menu height
set noshowmode                          " Show mode
set showtabline=2                       " Always show tabs
set smartcase                           " Smart case
set smartindent                         " Make indenting smarter
set splitbelow                          " Force all horizontal splits to go below
set splitright                          " Force all vertical splits to the right
set noswapfile                          " Do not create a swapfile
set termguicolors                       " Set term gui colors (most terminals support them
set timeoutlen=1000                     " Time to wait for mapped secuence to complete
set undofile                            " Enable persistent undo
set updatetime=1000                     " Faster completion
set number                              " Set numbered lines
set relativenumber                      " Set relative linenumbers
set numberwidth=4                       " Set number column to 4
set signcolumn="yes"                    " Always show sign column, otherwise the text shift
set wrap                                " Set line wrapping
set scrolloff=10
set sidescrolloff=10
filetype plugin indent on
syntax on

" ----- Setup keymapping -----------------------------------------------------
"   Set leaderkey to <space>
" ----- Normal mode ----------------------------------------------------------
"   Split navigation
"       C-j     - Split to the left
"       C-k     - Split to above
"       C-l     - Split to below
"       C-h     - Split to right
"   Resizing windows
"       C-Up    - Resize +2
"       C-Down  - Resize -2
"       C-Left  - Resize -2
"       C-Right - Resize +2
"   Buffers navigation
"       A-l     - Next buffer
"       A-h     - Previous buffer
" ----- Visual mode ----------------------------------------------------------
"   Select in indent mode
"       <       - Select to left
"       >       - Select to right
"   Buffer navigating
"       A-l     - Next buffer
"       A-h     - Previous buffer
" ----------------------------------------------------------------------------

" ----- Normal mode ----------------------------------------------------------
" ============================================================================
" ----- Split navigation -----------------------------------------------------
nnoremap <C-j> <C-W><C-j>
nnoremap <C-k> <C-W><C-k>
nnoremap <C-l> <C-W><C-l>
nnoremap <C-h> <C-W><C-h>

" ----- Resize windows with arrows -------------------------------------------
nnoremap <C-Up> :resize +2<CR>
nnoremap <C-Down> :resize -2<CR>
nnoremap <C-Left> :vertical resize -2<CR>
nnoremap <C-Right> :vertical resize +2<CR>

" ----- Navigating buffers ---------------------------------------------------
nnoremap <A-l> :bnext<CR>
nnoremap <A-h> :bprevious<CR>

" ----- Visual mode ----------------------------------------------------------
" ============================================================================
" ----- Stay in indent mode --------------------------------------------------
vnoremap <<> gv
vnoremap <>> >gv

" ----- Move text up and down ------------------------------------------------
vnoremap <A-j> :m .+1<CR>==
vnoremap <A-j> :m .-2<CR>==

" ----- NERDtree keymapping --------------------------------------------------
nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>

" ----- Setup for programming ------------------------------------------------
" ============================================================================
" Rust programming
autocmd BufNewFile,BufRead *.rs set filetype=rust
let g:rustfmt_autosave = 1          " Autosave after formating
let g:ale_completion_enabled=1      " Enable ALE autocompletion
nnoremap <C-LeftMouse> :ALEGoToDefinition<CR>
                                    "Ctrl left mouse goto definition
let g:ale_fixers = { 'rust': ['rustfmt', 'trim_whitespace', 'remove_trailing_lines']}
let g:ale_linters = { 'rust': ['analyzer'],}


