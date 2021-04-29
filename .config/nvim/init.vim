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
set updatetime=300 

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

  Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
  Plug 'neovim/nvim-lspconfig'
  Plug 'glepnir/lspsaga.nvim'

	Plug 'vim-ruby/vim-ruby'
	Plug 'tpope/vim-rails'
  Plug 'kana/vim-textobj-user' " Dependency of vim-textobj-rubyblock
  Plug 'nelstrom/vim-textobj-rubyblock'
  Plug 'tpope/vim-bundler'
  Plug 'tpope/vim-rake'

  Plug 'vim-test/vim-test'

  Plug 'kevinhwang91/rnvimr'
  
  Plug 'svermeulen/vim-easyclip'
  Plug 'hoob3rt/lualine.nvim'

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

  " Plug 'vim-airline/vim-airline'
  Plug 'machakann/vim-highlightedyank'
  Plug 'kyazdani42/nvim-web-devicons'
  Plug 'romgrk/barbar.nvim'

	Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
	Plug 'junegunn/fzf.vim'
	Plug 'tpope/vim-commentary'
	Plug 'tpope/vim-fugitive'
	Plug 'tpope/vim-endwise'

	" linting
	Plug 'dense-analysis/ale'

	" autocomplete

  Plug 'mxw/vim-jsx'
  Plug 'mhinz/vim-startify'
  Plug 'liuchengxu/vim-which-key'

  Plug 'voldikss/vim-floaterm'
  Plug 'nvim-lua/completion-nvim'
  Plug 'preservim/vimux'

call plug#end()
set termguicolors 
colorscheme onedark
autocmd BufEnter * lua require'completion'.on_attach()

let test#strategy = "vimux"
let g:test#preserve_screen = 1

let g:neoformat_enabled_ruby = ['rubocop',]


"""" LIGHTLINE
""""
let g:vimwiki_list = [{'syntax': 'markdown', 'ext': '.md'}]


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


"""" Lualine
""""
let g:lualine = {
    \'options' : {
    \  'theme' : 'codedark',
    \  'section_separators' : ['', ''],
    \  'component_separators' : ['', ''],
    \  'icons_enabled' : v:true,
    \},
    \'sections' : {
    \  'lualine_a' : [ ['mode', {'upper': v:true,},], ],
    \  'lualine_b' : [ ['filetype', {}, ], ],
    \  'lualine_c' : [ ['', {},], ],
    \  'lualine_x' : [ '', '', '' ],
    \  'lualine_y' : [ 'progress' ],
    \  'lualine_z' : [ 'location'  ],
    \},
    \'inactive_sections' : {
    \  'lualine_a' : [  ],
    \  'lualine_b' : [  ],
    \  'lualine_c' : [ 'filename' ],
    \  'lualine_x' : [ 'location' ],
    \  'lualine_y' : [  ],
    \  'lualine_z' : [  ],
    \},
    \'extensions' : [ 'fzf' ],
    \}
lua require("lualine").setup()


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

"""" BARBAR
let bufferline = get(g:, 'bufferline', {})
let bufferline.closable = v:false
let bufferline.icon_separator_active = '▎▎'

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

nnoremap <leader>b<Tab> :b#<cr>
nnoremap <leader>bb :BufferGoto<Space>
nnoremap <leader>bf :Buffers<CR>
nnoremap <leader>bp :BufferPick<CR>
nnoremap <leader>bk :bnext<CR>
nnoremap <leader>bj :bprevious<CR>
nnoremap <leader>bh :Startify<CR>
nnoremap <leader>bd :BufferClose<CR>
nnoremap <leader>bD :BD<CR>

nnoremap <leader>gs :vertical Git<cr>

nnoremap <leader>ss :call fzf#vim#ag(expand('<cword>'))<CR>
nnoremap <leader>st :call fzf#vim#tags(expand('<cword>'))<CR>
nnoremap <leader>sf :call fzf#vim#gitfiles('.', {'options':'--query '.expand('<cword>')})<CR>
let g:endwise_no_mappings = 1

nnoremap <leader>lf :Lspsaga lsp_finder<CR>
vnoremap <leader>lb <C-U>Lspsaga range_code_action<CR>
nnoremap <leader>ls :Lspsaga signature_help<CR>
nnoremap <leader>lr :Lspsaga rename<CR>
nnoremap <leader>ld :Lspsaga preview_definition<CR>

nnoremap <leader>lc <cmd>lua require'lspsaga.diagnostic'.show_cursor_diagnostics()<CR>

" Use <Tab> and <S-Tab> to navigate through popup menu
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" Set completeopt to have a better completion experience
set completeopt=menuone,noinsert,noselect

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


let g:VimuxOrientation = "v"


"""" WHICH KEY
""""
set timeoutlen=500
nnoremap <silent> <leader> :WhichKey '<Space>'<CR>

lua <<EOF
require'nvim-treesitter.configs'.setup {
  highlight = {
    enable = true,
  },
}
EOF

lua <<EOF
require'lspconfig'.solargraph.setup{    
    cmd = { "solargraph", "stdio" };
    }
local saga = require 'lspsaga'
saga.init_lsp_saga()
vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
  vim.lsp.diagnostic.on_publish_diagnostics, {
    virtual_text = false,
    underline = true,
    signs = true,
  }
)
vim.cmd [[autocmd CursorHold * lua vim.lsp.diagnostic.show_line_diagnostics()]]
vim.cmd [[autocmd CursorHoldI * silent! lua vim.lsp.buf.signature_help()]]
EOF


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

lua << EOF
vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
    vim.lsp.diagnostic.on_publish_diagnostics, {
    underline = false,
    -- This sets the spacing and the prefix, obviously.
    virtual_text = {
        spacing = 4
        , prefix = '◌'
        }

    })
vim.fn.sign_define("LspDiagnosticsSignError", {text = " ⦵", numhl = "LspDiagnosticsDefaultError"})
vim.fn.sign_define("LspDiagnosticsSignWarning", {text = " ⧾", numhl = "LspDiagnosticsDefaultWarning"})
vim.fn.sign_define("LspDiagnosticsSignInformation", {text = " ⇒", numhl = "LspDiagnosticsDefaultInformation"})
vim.fn.sign_define("LspDiagnosticsSignHint", {text = " ⦂", numhl = "LspDiagnosticsDefaultHint"})
EOF
