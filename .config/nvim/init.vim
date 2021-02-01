set hidden " allow swapping buffers without saving
set nocompatible " dont care about vi compatability
set number relativenumber " dual relative and actual numbering
set lazyredraw "dont re-render while running macros
set backspace=indent,eol,start " sane backspace config
set scrolloff=4 " keep 4 lines below the cursor

syntax on

filetype plugin indent on
filetype on
filetype indent on

" Make tabs 2
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab

" Highlight search results
set hlsearch

" show matching bracket
set showmatch

" always use vertical diffs
set diffopt+=vertical


" Set indentation for ruby file types
autocmd FileType ruby setlocal expandtab shiftwidth=2 tabstop=2
autocmd FileType eruby setlocal expandtab shiftwidth=2 tabstop=2

" persistent undo across sessions
set undodir=~/.vim/undo-dir
set undofile

" load junegunn/vim-plug
call plug#begin('~/.vim/plugged')
	" vim ruby language files
	Plug 'vim-ruby/vim-ruby'
	Plug 'tpope/vim-rails'
  Plug 'thoughtbot/vim-rspec'
  Plug 'jgdavey/tslime.vim'
	" sensible defaults
	Plug 'tpope/vim-sensible'

	Plug 'tpope/vim-surround'
	Plug 'airblade/vim-gitgutter'

	Plug 'joshdick/onedark.vim'
	Plug 'christoomey/vim-tmux-navigator'

	Plug 'scrooloose/nerdtree'
  Plug 'vim-airline/vim-airline'



	Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
	Plug 'junegunn/fzf.vim'
	Plug 'tpope/vim-commentary'
	Plug 'tpope/vim-fugitive'
	Plug 'tpope/vim-endwise'
	Plug 'jiangmiao/auto-pairs'

	" linting
	Plug 'dense-analysis/ale'

	" autocomplete
	Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }

call plug#end()
colorscheme onedark

"""" rspec
""""
let g:rspec_command = 'call Send_to_Tmux("rspec {spec}\n")'
map <Leader>t :call RunCurrentSpecFile()<CR>
map <Leader>s :call RunNearestSpec()<CR>
map <Leader>l :call RunLastSpec()<CR>
map <Leader>a :call RunAllSpecs()<CR>

"""" LIGHTLINE
""""

function! LinterStatus() abort
  let l:counts = ale#statusline#Count(bufnr(''))

  let l:all_errors = l:counts.error + l:counts.style_error
  let l:all_non_errors = l:counts.total - l:all_errors

  return l:counts.total == 0 ? '🟢' : printf(
        \   '🔴 %dW %dE',
        \   all_non_errors,
        \   all_errors
        \)
endfunction






"""" DEOPLETE
""""
let g:deoplete#enable_at_startup = 1

function! s:check_back_space() abort "{{{
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction"}}}
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ deoplete#manual_complete()

"""" ALE
""""
let g:ale_linters = {
      \   'ruby': ['standardrb'],
      \   'javascript': ['eslint'],
      \}
let g:ale_fixers = {
      \    'ruby': ['standardrb'],
      \}
let g:ale_fix_on_save = 1


"""" COMMENTS
""""
noremap ' :Commentary<CR>
autocmd FileType ruby setlocal commentstring=#\ %s

" auto resize splits on window resize
autocmd VimResized * :wincmd =


"""" KEYMAP
""""
let mapleader = "\<Space>"

" Zoom and resize splits like tmux
nnoremap <leader>- :wincmd _<cr>:wincmd \|<cr>
nnoremap <leader>= :wincmd =<cr>

" Nerd Tree 
nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>

nnoremap <C-S-tab> :tabprevious<CR>
nnoremap <C-tab>   :tabnext<CR>
nnoremap <C-t>     :tabnew<CR>
inoremap <C-S-tab> <Esc>:tabprevious<CR>i
inoremap <C-tab>   <Esc>:tabnext<CR>i
inoremap <C-t>     <Esc>:tabnew<CR>

nnoremap <leader>f :Files<CR>
nnoremap <leader>b :Buffers<CR>


nnoremap <leader>k :bnext<CR>
nnoremap <leader>j :bprevious<CR>

hi Normal guibg=NONE ctermbg=NONE
if !has('gui_running')
  set t_Co=256
endif

"""" AIRLINE
""""
let g:airline#extensions#tabline#enabled = 1


let g:airline_section_x      =''
let g:airline_section_z      =''
let g:airline_section_y = '%-0.10{LinterStatus()}'
let g:airline_section_error  =''
let g:airline_section_warning=''

" Exit Vim if NERDTree is the only window left.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() |
    \ quit | endif


