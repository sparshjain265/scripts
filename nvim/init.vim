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

" Sane way of splitting
set splitright
set splitbelow

" Move to prev/next buffers
nnoremap <nowait><silent> <F2> :bprevious<CR>
inoremap <nowait><silent> <F2> <ESC>:bprevious<CR>i
nnoremap <nowait><silent> <F3> :bnext<CR>
inoremap <nowait><silent> <F3> <ESC>:bnext<CR>i

" g plugged home
let g:plugged_home = '~/.config/nvim/plugged'

" Plugins List
call plug#begin(g:plugged_home)
" Disable search highlighting once done
Plug 'romainl/vim-cool'

" Quickly surround with brackets and more...
Plug 'tpope/vim-surround'

" Snippets
" Plug 'SirVer/ultisnips'
" Plug 'honza/vim-snippets'

" Pop-up menus for auto-completion
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" File explorer
" Plug 'preservim/nerdtree'
Plug 'scrooloose/nerdtree'

" Tagbar to browse a file and get an overview of its structure
Plug 'preservim/tagbar'

" Commenter
Plug 'preservim/nerdcommenter'

" Multi-Cursor - needs configuration
Plug 'mg979/vim-visual-multi'  

" Fancy start screen
Plug 'mhinz/vim-startify'

" Terminal - not required since the built-in terminal is good enough
" Plug 'tc50cal/vim-terminal'

" UI Related
Plug 'chriskempson/base16-vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'ryanoasis/vim-devicons'
call plug#end()

" Multi-Cursor support related config
" To change any mapping, we must first initialize the variable
let g:VM_maps = {}

" Disable permanent mappings - Not required since we can replace the default
" bindings
" let g:VM_default_mappings = 0

" Enable mouse mappings
let g:VM_mouse_mappings = 1

" Add cursor down
let g:VM_maps["Add Cursor Down"] = '<C-S-down>'
let g:VM_maps["Add Cursor Up"] = '<C-S-up>'

" Remaps in VM : 
" these do not seem to work for some reason, find fix if possible
function! VM_Start()
    nnoremap <C-S-j> <C-S-down>
    nnoremap <C-S-k> <C-S-up>
endfunction

function! VM_Exit()
    nunmap <C-S-j> <C-S-down>
    nunmap <C-S-k> <C-S-up>
endfunction

" remap keys for normal commands
let g:VM_custom_noremaps = {'==': '==', '<<': '<<', '>>': '>>'}

" Find Under and Find Subword Under to select the word under the cursor
let g:VM_maps["Find Under"] = '<C-d>'
let g:VM_maps["Find Subword Under"] = '<C-d>'

" Don't display a message when exiting VM 
let g:VM_silent_exit = 1

" Verbose VM 
let g:VM_verbose_commands = 1

" color scheme
let base16colorspace=256            " Access colors present in 256 colorspace
set termguicolors                   " Brighter colors if terminal supports

" show opened buffers as tabs
let g:airline#extensions#tabline#enabled = 1
" use powerline fonts
let g:airline_powerline_fonts = 1

" Allow spaces after tabs, but not in between
" Use tabs for indentation and spaces for alignment
let g:airline#extensions#whitespace#mixed_indent_algo = 2

" configure which whitespace checks to enable.
" indent: mixed indent within a line
" long:   overlong lines                                          " Don't check for these either, allow long lines
" trailing: trailing whitespace                                   " Yeah don't check for these, allow trailing whitespaces
" mixed-indent-file: different indentation in different lines 
" conflicts: checks for conflict markers
let g:airline#extensions#whitespace#checks = [ 'indent', 'mixed-indent-file', 'conflicts' ]

" Toggle File Explorer
nnoremap <nowait><silent> <C-B> :NERDTreeToggle<CR>
" inoremap <nowait><silent> <C-B> <ESC>:NERDTreeToggle<CR>

" Toggle Tagbar
nnoremap <F8> :TagbarToggle fj<CR>

augroup MyNeovimBuffers
    autocmd!

    " If another buffer tries to replace NERDTree, put it in the right window, and bring back NERDTree.
    autocmd BufEnter * if bufname('#') =~ 'NERD_tree_\d\+' && bufname('%') !~ 'NERD_tree_\d\+' && winnr('$') > 1 |
                \ let bufnerd=bufnr() | buffer# | execute "normal! \<C-W>l" | execute 'buffer'.bufnerd | endif

    " If another buffer tries to replace Tagbar, put it in the left window, and bring back Tagbar.
    autocmd BufEnter * if bufname('#') =~ 'Tagbar' && bufname('%') !~ 'Tagbar' && winnr('$') > 1 |
                \ let buftag=bufnr() | buffer# | execute "normal! \<C-W>h" | execute 'buffer'.buftag | endif

augroup END

augroup MyNeovimNerdTree
    autocmd!

    " Start NERDTree when Vim starts with a directory argument.
    autocmd StdinReadPre * let s:std_in=1
    autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists('s:std_in') |
                \ execute 'NERDTree' argv()[0] | wincmd p | enew | execute 'cd '.argv()[0] | endif

    " Exit Vim if NERDTree is the only window remaining in the only tab.
    autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif

    " Close the tab if NERDTree is the only window remaining in it.
    autocmd BufEnter * if winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif
augroup END

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
" close nerdtree and tagbar before saving a session
let g:startify_session_before_save = ['silent! tabdo NERDTreeClose', 'silent! tabdo TagbarClose' ]
" for session autoload feature
let g:startify_session_autoload = 1
let NERDTreeHijackNetrw = 0
" Persistent sessions
let g:startify_session_persistence = 1
" Sort sessions by modification time
let g:startify_session_sort = 1

" Autocomplete configuration
" Use tab for trigger completion with characters ahead and navigate
" NOTE: There's always complete item selected by default, you may want to enable
" no select by `"suggest.noselect": true` in your configuration file
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config
inoremap <silent><expr> <TAB>
            \ coc#pum#visible() ? coc#pum#next(1) :
            \ CheckBackspace() ? "\<Tab>" :
            \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

" Make <CR> to accept selected completion item or notify coc.nvim to format
" <C-g>u breaks current undo, please make your own choice
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
            \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

function! CheckBackspace() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~# '\s'
endfunction


" Convenient Keybindings
" Move line/selected block as in vscode
nnoremap <A-j> :m .+1<CR>
nnoremap <A-k> :m .-2<CR>
nnoremap <A-down> :m .+1<CR>
nnoremap <A-up> :m .-2<CR>
inoremap <A-j> <Esc>:m .+1<CR>==gi
inoremap <A-k> <Esc>:m .-2<CR>==gi
inoremap <A-down> <Esc>:m .+1<CR>==gi
inoremap <A-up> <Esc>:m .-2<CR>==gi
vnoremap <A-j> :m '>+1<CR>gv=gv
vnoremap <A-k> :m '<-2<CR>gv=gv
vnoremap <A-down> :m '>+1<CR>gv=gv
vnoremap <A-up> :m '<-2<CR>gv=gv

" move split panes to left/down/up/right in normal mode
nnoremap <C-A-h> <C-W>H
nnoremap <C-A-j> <C-W>J
nnoremap <C-A-k> <C-W>K
nnoremap <C-A-l> <C-W>L
nnoremap <C-A-left> <C-W>H
nnoremap <C-A-down> <C-W>J
nnoremap <C-A-up> <C-W>K
nnoremap <C-A-right> <C-W>L

" move left/down/up/right between split panes in normal/insert/visual mode
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

" jump to the last position when reopening a file
augroup MyNeovimReopen
    autocmd!
    au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
                \| exe "normal! g'\"" | endif 
augroup END

" Open terminal below from normal mode
nnoremap <C-`> :split<CR><C-w>J:terminal<CR>i
" map <Esc> to exit terminal mode and enter normal mode 
tnoremap <Esc> <C-\><C-n>

" map ctrl++/- to resize windows (vertically) from normal mode
nnoremap <C-S-=> <C-w><C-+>
nnoremap <C-kPlus> <C-w><C-+>
nnoremap <C--> <C-w><C-->
nnoremap <C-kMinus> <C-w><C-->

" map ctrl+,/. to resize windows (horizontally) from normal mode
nnoremap <C-,> <C-w><C-<>
nnoremap <C-.> <C-w><C->>

" map ctrl+0 to reset window sizes
nnoremap <C-0> <C-w><C-=>
nnoremap <C-k0> <C-w><C-=>

" Automatic commands on terminal
augroup MyNeovimTerminal
    autocmd!
    " Enter edit more on terminal enter 
    autocmd TermEnter *  startinsert
    " Autoresize terminal window 
    autocmd TermLeave *  resize 1
    autocmd TermEnter *  resize 10
augroup END
