set nocompatible					" disable compatibility to old time vi
set showmatch						" show matching parenthesis, etc.
set ignorecase						" case insensitive
set smartcase						" case sensitive if at least one capital letter
set mouse=a							" enable mouse
set hlsearch						" highlight search
set incsearch						" incremental search
" C-L clears the highlight in normal and insert mode
" now moot with vim-plug plugin
" nnoremap <nowait><silent> <C-L> :nohlsearch<CR>
" inoremap <nowait><silent> <C-L> <ESC>:nohlsearch<CR>

set smarttab                        " tab also uses shift width
set tabstop=4						" tabsize
set softtabstop=4					" soft tab stop
set expandtab						" use spaces for tabs
set shiftwidth=4					" width for indentation purposes
set autoindent						" set new line in the same indentation as the previous line
set number							" set line numbers
set relativenumber					" set relative line numbers
" set colorcolumn=80                                    " column border for good style
" hi ColorColumn ctermbg=darkgrey guibg=darkgrey        " dark grey column border
" set wildmode=longest:full         " tab completion

filetype on
filetype plugin on
filetype plugin indent on           " detect file-type, detect plugins and auto-indenting depending on file-type

syntax on
syntax enable                       " enable syntax highlighting

set clipboard+=unnamed,unnamedplus  " use system wide copy pasting clipboard
set cursorline                      " highlight cursor line
set cursorlineopt=number            " highlight only the line number of the cursor line
set ttyfast                         " speed up scrolling
" set spell                         " enable spell check

" Move to prev/next buffers
nnoremap <nowait><silent> <F2> :bprevious<CR>
inoremap <nowait><silent> <F2> <ESC>:bprevious<CR>
nnoremap <nowait><silent> <F3> :bnext<CR>
inoremap <nowait><silent> <F3> <ESC>:bnext<CR>

" g plugged home
let g:plugged_home = '~/.vim/plugged'

" Plugins List
call plug#begin(g:plugged_home)
    " UI Related
    Plug 'chriskempson/base16-vim'
	Plug 'vim-airline/vim-airline'
	Plug 'vim-airline/vim-airline-themes'
    Plug 'ryanoasis/vim-devicons'

    " Disable search highlighting once done
    Plug 'romainl/vim-cool'

    " Snippets
    Plug 'SirVer/ultisnips'
    Plug 'honza/vim-snippets'

    " File explorer
    " Plug 'preservim/nerdtree'
    Plug 'scrooloose/nerdtree'
call plug#end()

" color scheme
let base16colorspace=256            " Access colors present in 256 colorspace
" set termguicolors                 " Brighter colors if terminal supports

" show opened buffers as tabs
let g:airline#extensions#tabline#enabled = 1
" use powerline fonts
let g:airline_powerline_fonts = 1

" Toggle File Explorer
nnoremap <nowait><silent> <C-B> :NERDTreeToggle<CR>
inoremap <nowait><silent> <C-B> <ESC>:NERDTreeToggle<CR>

" If another buffer tries to replace NERDTree, put it in the other window, and bring back NERDTree.
autocmd BufEnter * if bufname('#') =~ 'NERD_tree_\d\+' && bufname('%') !~ 'NERD_tree_\d\+' && winnr('$') > 1 |
    \ let buf=bufnr() | buffer# | execute "normal! \<C-W>w" | execute 'buffer'.buf | endif
