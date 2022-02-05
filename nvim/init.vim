" g plugged home
let g:plugged_home = '~/.vim/plugged'

" Plugins List
call plug#begin(g:plugged_home)
	" UI related
	Plug 'chriskempson/base16-vim'
	Plug 'vim-airline/vim-airline'
	Plug 'vim-airline/vim-airline-themes'

	" Better Visual Guide
	Plug 'Yggdroot/indentLine'

	" syntax check (python?)
	Plug 'w0rp/ale'

	" Autocomplete (python?)
	Plug 'ncm2/ncm2'
	Plug 'roxma/nvim-yarp'

	Plug 'ncm2/ncm2-bufword'
	Plug 'ncm2/ncm2-path'
	Plug 'ncm2/ncm2-jedi'

	" Formater
	Plug 'Chiel92/vim-autoformat'
	
	" Latex
	Plug 'lervag/vimtex'
	Plug 'Konfekt/FastFold'
	Plug 'matze/vim-tex-fold'

call plug#end()

filetype plugin indent on

" Configuration Part
"
" UI configuration
syntax on
syntax enable

" color scheme
let base16colorspace=256
" colorscheme base16-gruvbox-dark-hard
set background=dark

" True Color Support if it's available in teminal
if has("termguicolors")
	set termguicolors
endif

if has("gui_running")
	set guicursor=n-v-c-sm:block,i-ci-ve:block,r-cr-o:blocks
endif

set number
" set relativenumber

set hidden
set mouse=a
set noshowmode
set noshowmatch
set nolazyredraw

" Turn off backup
set nobackup
set noswapfile
set nowritebackup

" Search configuration
" ignore case when searching
set ignorecase 
" turn on smartcase
set smartcase

" Tab and Indent configuration
" set expandtab" 
set tabstop=4
set shiftwidth=4

" vim-autoformat
noremap <F3> :Autoformat<CR>

" NCM2
augroup NCM2
	autocmd!
	" enable ncm2 for all buffers
	autocmd BufEnter * call ncm2#enable_for_buffer()

	" :help Ncm2PopupOpen for more information
	set completeopt=noinsert,menuone,noselect

	" When the <Enter> key is pressed while the popup menu is visible, it
	" only hides the menu. Use this mapping to close the menu and also
	" start a new line.
	" inoremap <expr> <CR> (pumvisible() ? "\<c-y>\<cr>" : "\<CR>")

	" cycle through completion list with tab/shift+tab
	inoremap <expr> <tab> pumvisible() ? "\<c-n>" : "\<tab>"
	inoremap <expr> <s-tab> pumvisible() ? "\<c-p>" : "\<tab>"

	" uncomment this block if you use vimtex for LaTex
	autocmd Filetype tex call ncm2#register_source({
		\ 'name': 'vimtex',
		\ 'priority': 8,
		\ 'scope': ['tex'],
		\ 'mark': 'tex',
		\ 'word_pattern': '\w+',
		\ 'complete_pattern': g:vimtex#re#ncm2,
		\ 'on_complete': ['ncm2#on_complete#omni', 'vimtex#complete#omnifunc'],
		\ })
augroup END

" Ale
let g:ale_lint_on_enter = 0
let g:ale_lint_on_text_changed = 'never'
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
let g:ale_linters = {'python': ['flake8']}

" Airline
let g:airline_left_sep = ''
let g:airline_right_sep = ''
let g:airline_extensions#ale#enabled = 1
let airline#extensions#ale#error_symbol = 'E:'
let airline#extensions#ale#warning_symbol = 'W:'

" vimtex
let g:tex_flavor = 'latex'
let g:tex_conceal = ''
set conceallevel=0
let g:vimtex_fold_manual = 1
" let g:vimtex_latexmk_continuous = 1
let g:vimtex_compiler_progname = 'nvr'

let g:vimtex_view_method = 'zathura'
