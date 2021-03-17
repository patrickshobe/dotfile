set hidden " allow swapping buffers without saving
set nocompatible " dont care about vi compatability
set number relativenumber " dual relative and actual numbering
set lazyredraw "dont re-render while running macros
set backspace=indent,eol,start " sane backspace config
set scrolloff=4 " keep 4 lines below the cursor
set diffopt+=vertical "vertical git diffs
set inccommand=nosplit " make text replacement interactive
set showmatch " show matching bracket
set hlsearch " Highlight search results
set tags^=.git/tags;~

runtime macros/matchit.vim

syntax on


filetype plugin indent on
filetype on
filetype indent on

" Make tabs 2
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab

" Set indentation for ruby file types
autocmd FileType ruby setlocal expandtab shiftwidth=2 tabstop=2
autocmd FileType eruby setlocal expandtab shiftwidth=2 tabstop=2

" persistent undo across sessions
set undodir=~/.vim/undo-dir
set undofile

" load junegunn/vim-plug
call plug#begin('~/.vim/plugged')
	" vim ruby language files
  Plug 'joe-skb7/cscope-maps'
	Plug 'vim-ruby/vim-ruby'
  Plug 'k0kubun/vim-open-github'
	Plug 'tpope/vim-rails'
  Plug 'kana/vim-textobj-user' " Dependency of vim-textobj-rubyblock
  Plug 'nelstrom/vim-textobj-rubyblock'
  Plug 'tpope/vim-bundler'
  Plug 'tpope/vim-rake'
  " Plug 'thoughtbot/vim-rspec'
  Plug 'vim-test/vim-test'

  Plug 'sbdchd/neoformat'

  Plug 'jgdavey/tslime.vim'
  Plug 'vimwiki/vimwiki'

	Plug 'tpope/vim-surround'
	Plug 'airblade/vim-gitgutter'

	Plug 'joshdick/onedark.vim'
	Plug 'christoomey/vim-tmux-navigator'

  Plug 'vim-airline/vim-airline'
  Plug 'machakann/vim-highlightedyank'

	Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
	Plug 'junegunn/fzf.vim'
	Plug 'tpope/vim-commentary'
	Plug 'tpope/vim-fugitive'
	Plug 'tpope/vim-endwise'
  Plug 'francoiscabrol/ranger.vim'

	" linting
	Plug 'dense-analysis/ale'

	" autocomplete
	Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }

  Plug 'mxw/vim-jsx'
  Plug 'mhinz/vim-startify'
  Plug 'liuchengxu/vim-which-key'

  Plug 'voldikss/vim-floaterm'
  Plug 'preservim/vimux'

call plug#end()
colorscheme onedark

let test#strategy = "floaterm"
let g:test#preserve_screen = 1

let g:neoformat_enabled_ruby = ['rubocop',]


let g:ranger_map_keys = 0 " disable ranger default keymap
""" rspec
""""
" let g:rspec_command = 'call Send_to_Tmux("rspec --drb {spec}\n")'
" map <Leader>t :call RunCurrentSpecFile()<CR>
" map <Leader>s :call RunNearestSpec()<CR>
" map <Leader>l :call RunLastSpec()<CR>
" map <Leader>a :call RunAllSpecs()<CR>

"""" LIGHTLINE
""""
let g:vimwiki_list = [{'syntax': 'markdown', 'ext': '.md'}]

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

" floaterm
let g:floaterm_position='bottomright'
let g:floaterm_width=0.4
let g:floaterm_height=0.4
let g:floaterm_opener='vsplit'
let g:floaterm_autoclose=1
let g:floaterm_title=''


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
let g:ale_sign_error = 'x'
let g:ale_sign_warning = '-'
let g:ale_set_highlights = 0
let g:ale_fix_on_save = 0

  if (exists('$HOUSECALL'))
    let g:ale_linters = {
          \   'ruby': ['rubocop'],
          \   'javascript': ['eslint'],
          \}
    let g:ale_fixers = {
          \    'ruby': ['rubocop'],
          \   'javascript': ['eslint'],
          \}
  else
    let g:ale_linters = {
          \   'ruby': ['standardrb'],
          \   'javascript': ['eslint'],
          \}
    let g:ale_fixers = {
          \    'ruby': ['standardrb'],
          \   'javascript': ['eslint'],
          \}
  endif


"""" COMMENTS
""""
noremap ' :Commentary<CR>
autocmd FileType ruby setlocal commentstring=#\ %s

" auto resize splits on window resize
autocmd VimResized * :wincmd =

hi Normal guibg=NONE ctermbg=NONE
if !has('gui_running')
  set t_Co=256
endif

"""" AIRLINE
""""
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline#extensions#tabline#buffer_nr_show = 1

let g:airline_section_x      =''
let g:airline_section_z      =''
let g:airline_section_y = '%-0.10{LinterStatus()}'
let g:airline_section_error  =''
let g:airline_section_warning=''

"""" Startify
""""

let g:startify_change_to_dir = 0
function! s:gitModified()
    let files = systemlist('git ls-files -m 2>/dev/null')
    return map(files, "{'line': v:val, 'path': v:val}")
endfunction

" same as above, but show untracked files, honouring .gitignore
function! s:gitUntracked()
    let files = systemlist('git ls-files -o --exclude-standard 2>/dev/null')
    return map(files, "{'line': v:val, 'path': v:val}")
endfunction

let g:startify_lists = [
        \ { 'type': 'dir',       'header': ['   MRU '. getcwd()] },
        \ { 'type': function('s:gitModified'),  'header': ['   git modified']},
        \ { 'type': function('s:gitUntracked'), 'header': ['   git untracked']},
        \ { 'type': 'files',     'header': ['   MRU']            },
        \ ]

    let g:ascii = [
  \ '           ',
  \ '           ',
  \ '           ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗',
  \ '           ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║',
  \ '           ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║',
  \ '           ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║',
  \ '           ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║',
  \ '           ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝',
  \ '           ',
  \ '           ',
  \]

                                                  
  let g:startify_custom_header =
        \ 'startify#pad(g:ascii)'
  let g:startify_padding_left = 15

"""" KEYMAP
""""
let mapleader = "\<Space>"

" Zoom and resize splits like tmux
nnoremap <leader>- :wincmd _<cr>:wincmd \|<cr>
nnoremap <leader>= :wincmd =<cr>

nnoremap <leader>ff :Files<CR>
nnoremap <leader>fb :Buffers<CR>
nnoremap <leader>fc :Commands<CR>
nnoremap <leader>ft :Tags<CR>


nnoremap <leader>b<Tab> :b#<cr>
nnoremap <leader>bb :b<Space>
nnoremap <leader>bf :Buffers<CR>
nnoremap <leader>bk :bnext<CR>
nnoremap <leader>bj :bprevious<CR>
nnoremap <leader>bh :Startify<CR>
nnoremap <leader>bd :bd<CR>
nnoremap <leader>bc :%bd\|e#\|bd#<cr>\|'"

nnoremap <leader>gs :vertical Git<cr>

nnoremap <leader>ss :call fzf#vim#ag(expand('<cword>'))<CR>
nnoremap <leader>st :call fzf#vim#tags(expand('<cword>'))<CR>
nnoremap <leader>r :Ranger<CR>

nnoremap <leader>tn :TestNearest<CR>
nnoremap <leader>tf :TestFile<CR>
nnoremap <leader>ts :TestSuite<CR>
nnoremap <leader>txs :TestSuite -strategy=vimux<CR>
nnoremap <leader>tl :TestLast<CR>
nnoremap <leader>txl :TestLast -strategy=vimux<CR>
nnoremap <leader>txf :TestFile -strategy=vimux<CR>
nnoremap <leader>tv :TestVisit<CR>
nnoremap <leader>tt :FloatermToggle<CR>
tnoremap <leader>tt <C-\><C-n>:FloatermToggle<CR>
tnoremap <leader>] <C-\><C-n>

let g:VimuxOrientation = "v"



"""" WHICH KEY
""""
set timeoutlen=500
nnoremap <silent> <leader> :WhichKey '<Space>'<CR>

