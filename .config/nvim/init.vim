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
set tags^=.git/tags;~ "set tags to be in git

set clipboard=unnamed " use system clip

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

  Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

	Plug 'vim-ruby/vim-ruby'
	Plug 'tpope/vim-rails'
  Plug 'kana/vim-textobj-user' " Dependency of vim-textobj-rubyblock
  Plug 'nelstrom/vim-textobj-rubyblock'
  Plug 'tpope/vim-bundler'
  Plug 'tpope/vim-rake'
  Plug 'kevinhwang91/rnvimr'
  

  Plug 'vim-test/vim-test'
  Plug 'svermeulen/vim-easyclip'

  Plug 'sbdchd/neoformat'
  Plug 'jgdavey/tslime.vim'
  Plug 'vimwiki/vimwiki'

	Plug 'tpope/vim-surround'
	Plug 'tpope/vim-repeat'
	Plug 'dahu/vim-fanfingtastic' " multi-line F f
	Plug 'airblade/vim-gitgutter'
  Plug 'k0kubun/vim-open-github'

	Plug 'joshdick/onedark.vim'
	Plug 'christoomey/vim-tmux-navigator'

  Plug 'vim-airline/vim-airline'
  Plug 'machakann/vim-highlightedyank'

	Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
	Plug 'junegunn/fzf.vim'
	Plug 'tpope/vim-commentary'
	Plug 'tpope/vim-fugitive'
	Plug 'tpope/vim-endwise'

	" linting
	Plug 'dense-analysis/ale'

	" autocomplete
  Plug 'neoclide/coc.nvim', {'branch': 'release'}

  Plug 'mxw/vim-jsx'
  Plug 'mhinz/vim-startify'
  Plug 'liuchengxu/vim-which-key'

  Plug 'voldikss/vim-floaterm'
  Plug 'preservim/vimux'

call plug#end()
colorscheme onedark

let test#strategy = "vimux"
let g:test#preserve_screen = 1

let g:neoformat_enabled_ruby = ['rubocop',]


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

nnoremap <leader>r :RnvimrToggle<CR>
nnoremap <leader>rt :RnvimrResize<CR>
let g:rnvimr_hide_gitignore = 1 " hide gitignore files
let g:rnvimr_enable_bw = 1 " wipe nvim buffer of file deleted in ranger

" GoTo code navigation.
nmap <leader>agd <Plug>(coc-definition)
nmap <leader>agy <Plug>(coc-type-definition)
nmap <leader>agi <Plug>(coc-implementation)
nmap <leader>agr <Plug>(coc-references)



nnoremap <leader>b<Tab> :b#<cr>
nnoremap <leader>bb :b<Space>
nnoremap <leader>bf :Buffers<CR>
nnoremap <leader>bk :bnext<CR>
nnoremap <leader>bj :bprevious<CR>
nnoremap <leader>bh :Startify<CR>
nnoremap <leader>bd :bd<CR>
nnoremap <leader>bD :BD<CR>
nnoremap <leader>bc :%bd\|e#\|bd#<cr>\|'"

nnoremap <leader>gs :vertical Git<cr>

nnoremap <leader>ss :call fzf#vim#ag(expand('<cword>'))<CR>
nnoremap <leader>st :call fzf#vim#tags(expand('<cword>'))<CR>
nnoremap <leader>sf :call fzf#vim#gitfiles('.', {'options':'--query '.expand('<cword>')})<CR>
let g:endwise_no_mappings = 1

nnoremap <leader>tn :TestNearest<CR>
nnoremap <leader>tf :TestFile<CR>
nnoremap <leader>ts :TestSuite<CR>
nnoremap <leader>tl :TestLast<CR>
nnoremap <leader>tv :TestVisit<CR>
nnoremap <leader>txs :TestSuite -strategy=floaterm<CR>
nnoremap <leader>txl :TestLast -strategy=floaterm<CR>
nnoremap <leader>txf :TestFile -strategy=floaterm<CR>
nnoremap <leader>tt :FloatermToggle<CR>
tnoremap <leader>tt <C-\><C-n>:FloatermToggle<CR>
tnoremap <leader>] <C-\><C-n>
nnoremap <space>e :CocCommand explorer<CR>
vmap <leader>c  <Plug>(coc-format-selected)
nmap <leader>c  <Plug>(coc-format-selected)


let g:VimuxOrientation = "v"


"""" WHICH KEY
""""
set timeoutlen=500
nnoremap <silent> <leader> :WhichKey '<Space>'<CR>


" COC vim
" " Set internal encoding of vim, not needed on neovim, since coc.nvim using some
" unicode characters in the file autoload/float.vim
set encoding=utf-8


" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Give more space for displaying messages.
set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

lua <<EOF
require'nvim-treesitter.configs'.setup {
  highlight = {
    enable = true,
  },
}
EOF


function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

"FZF Buffer Delete

function! s:list_buffers()
  redir => list
  silent ls
  redir END
  return split(list, "\n")
endfunction

function! s:delete_buffers(lines)
  execute 'bwipeout' join(map(a:lines, {_, line -> split(line)[0]}))
endfunction

command! BD call fzf#run(fzf#wrap({
  \ 'source': s:list_buffers(),
  \ 'sink*': { lines -> s:delete_buffers(lines) },
  \ 'options': '--multi --reverse --bind ctrl-a:select-all+accept'
\ }))


" Remap <C-f> and <C-b> for scroll float windows/popups.
" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

