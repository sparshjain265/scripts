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
    " Disable search highlighting once done
    Plug 'romainl/vim-cool'

    " Snippets
    Plug 'SirVer/ultisnips'
    Plug 'honza/vim-snippets'

    " Pop-up menus for auto-completion
    Plug 'neoclide/coc.nvim', {'branch': 'release'}

    " File explorer
    " Plug 'preservim/nerdtree'
    Plug 'scrooloose/nerdtree'

    " Commenter
    Plug 'preservim/nerdcommenter'

    " Fancy start screen
    Plug 'mhinz/vim-startify'

    " UI Related
    Plug 'chriskempson/base16-vim'
	Plug 'vim-airline/vim-airline'
	Plug 'vim-airline/vim-airline-themes'
    Plug 'ryanoasis/vim-devicons'
call plug#end()

" color scheme
let base16colorspace=256            " Access colors present in 256 colorspace
set termguicolors                 " Brighter colors if terminal supports

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

" Comment related setup
" The default mappings are horrible
" They use <leader>c<action> style
" However, c also stands for change
" We will use <C-/> style as in vscode

" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1

" Allow commenting empty lines
let g:NERDCommentEmptyLines = 1

" Check all selected lines are commented to toggle
let g:NERDToggleCheckAllLines = 1

" Toggle Comment in normal mode using <C-/>
nnoremap <nowait><silent> <C-/> <plug>NERDCommenterToggle
" Toggle Comment with formatting in visual mode using <C-/>
vnoremap <nowait><silent> <C-/> <plug>NERDCommenterSexy
" Insert Comment in insert mode using <C-/>
inoremap <nowait><silent> <C-/> <plug>NERDCommenterInsert
" Insert Comment to the end of line and go to insert mode there
noremap <nowait><silent> <leader>ca <plug>NERDCommenterAppend
" Switch to alternative set of comment delimiters
noremap <nowait><silent> <leader>cA <plug>NERDCommenterAltDelims

" Startify settings
" Startify list
let g:startify_lists = [
          \ { 'type': 'dir',       'header': ['   MRU '. getcwd()] },
          \ { 'type': 'files',     'header': ['   MRU']            },
          \ { 'type': 'sessions',  'header': ['   Sessions']       },
          \ { 'type': 'bookmarks', 'header': ['   Bookmarks']      },
          \ { 'type': 'commands',  'header': ['   Commands']       },
          \ ]
" Relative paths
let g:startify_relative_path = 1
" close nerdtree before saving a session
let g:startify_session_before_save = ['silent! tabdo NERDTreeClose' ]
" for session autoload feature
let g:startify_session_autoload = 1
let NERDTreeHijackNetrw = 0
" Persistent sessions
let g:startify_session_persistence = 1
" Sort sessions by modification time
let g:startify_session_sort = 1

" Use tab to trigger completion 

" Move line/selected block as in vscode
nnoremap <A-j> :m .+1<CR>==gn
nnoremap <A-k> :m .-2<CR>==gn
nnoremap <A-down> :m .+1<CR>==gn
nnoremap <A-up> :m .-2<CR>==gn
inoremap <A-j> <Esc>:m .+1<CR>==gi
inoremap <A-k> <Esc>:m .-2<CR>==gi
inoremap <A-down> <Esc>:m .+1<CR>==gi
inoremap <A-up> <Esc>:m .-2<CR>==gi
vnoremap <A-j> :m '>+1<CR>gv=gv
vnoremap <A-k> :m '<-2<CR>gv=gv
vnoremap <A-down> :m '>+1<CR>gv=gv
vnoremap <A-up> :m '<-2<CR>gv=gv

" move split panes to left/down/up/right in normal mode
noremap <C-S-h> <C-W>H
inoremap <C-S-h> <Esc><C-W>H==gi
noremap <C-S-j> <C-W>J
inoremap <C-S-j> <Esc><C-W>J==gi
noremap <C-S-k> <C-W>K
inoremap <C-S-k> <Esc><C-W>K==gi
noremap <C-S-l> <C-W>L
inoremap <C-S-l> <Esc><C-W>L==gi
noremap <C-S-left> <C-W>H
inoremap <C-S-left> <Esc><C-W>H==gi
noremap <C-S-down> <C-W>J
inoremap <C-S-down> <Esc><C-W>J==gi
noremap <C-S-up> <C-W>K
inoremap <C-S-up> <Esc><C-W>K==gi
noremap <C-S-right> <C-W>L
inoremap <C-S-right> <Esc><C-W>L==gi

" move left/down/up/right between split panes 
noremap <C-h> <C-w>h
inoremap <C-h> <Esc><C-w>h==gi
noremap <C-j> <C-w>j
inoremap <C-j> <Esc><C-w>j==gi
noremap <C-k> <C-w>k
inoremap <C-k> <Esc><C-w>k==gi
noremap <C-l> <C-w>l
inoremap <C-l> <Esc><C-w>l==gi
noremap <C-left> <C-w>h
inoremap <C-left> <Esc><C-w>h==gi
noremap <C-down> <C-w>j
inoremap <C-down> <Esc><C-w>j==gi
noremap <C-up> <C-w>k
inoremap <C-up> <Esc><C-w>k==gi
noremap <C-right> <C-w>l
inoremap <C-right> <Esc><C-w>l==gi
