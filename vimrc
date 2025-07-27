let data_dir = has('nvim') ? stdpath('data') . '/snnoremap <Leader>a :Ack!<Space>ite' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source '~/.vimrc'
endif

"Preferences
set termguicolors
set noshowmode
let mapleader=" "
set tabstop=2
set shiftwidth=2
set expandtab
set nocompatible
set background=dark
set mouse=a
filetype plugin on
syntax on

set termwinsize=15x0
set termwinkey=<C-K>
set noequalalways
cabbrev term bo terminal

command Build execute '!cd build && make'
command Run execute '!find build -maxdepth 1 -executable -type f -exec {} \;'

cabbrev build Build
cabbrev run Run

au BufWrite * :Autoformat

augroup MyYCMCustom
  autocmd!
  autocmd FileType c,cpp let b:ycm_hover = {
        \ 'command': 'GetDoc',
        \ 'syntax': &filetype
        \ }
augroup END


" Define a default mapping for <C-s>
" nnoremap <silent> <C-s> :YcmCompleter Format<CR>:wall<CR>

" Override the mapping for C and C++ filetypes
" augroup CCppFormat
"   autocmd!
"   autocmd FileType c,cpp nnoremap <buffer> <silent> <C-s> :ClangFormat<CR>:wall<CR>
" augroup END

vnoremap <leader>y :w !xsel -b<CR><CR>

" PLUGINS
call plug#begin()

" List your plugins here
Plug 'tpope/vim-sensible'

Plug 'nordtheme/vim'
Plug 'ghifarit53/tokyonight-vim'
Plug 'catppuccin/vim', { 'as': 'catppuccin' }
Plug 'itchyny/lightline.vim'
Plug 'junegunn/rainbow_parentheses.vim'
Plug 'terryma/vim-smooth-scroll'
Plug 'preservim/nerdtree'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'tmsvg/pear-tree'
Plug 'ycm-core/YouCompleteMe'
Plug 'rhysd/vim-clang-format'
Plug 'rdnetto/YCM-Generator', { 'branch': 'stable'}
Plug 'vimwiki/vimwiki'
Plug 'ryanoasis/vim-devicons'
Plug 'terryma/vim-multiple-cursors'
Plug 'dyng/ctrlsf.vim'
Plug 'easymotion/vim-easymotion'
Plug 'rrethy/vim-hexokinase', { 'do': 'make hexokinase' }
Plug 'maxmellon/vim-jsx-pretty'
Plug 'jnurmine/Zenburn'
Plug 'wadackel/vim-dogrun'
Plug 'severin-lemaignan/vim-minimap'
Plug 'NLKNguyen/papercolor-theme'
Plug 'morhetz/gruvbox'
Plug 'godlygeek/tabular'
Plug 'preservim/vim-markdown'
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && npx --yes yarn install' }
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
Plug 'vim-autoformat/vim-autoformat'
Plug 'puremourning/vimspector'

call plug#end()

" FZF
command! -bang -nargs=? -complete=dir Files
      \ call fzf#vim#files(<q-args>, fzf#vim#with_preview({'options': ['--layout=reverse', '--info=inline']}), <bang>0)
2024

let g:gitgutter_enabled = 0

let g:vimspector_enable_mappings = 'HUMAN'

colorscheme catppuccin_macchiato

let g:lightline = {
      \ 'colorscheme': 'catppuccin_macchiato',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'FugitiveHead'
      \ },
      \ }

let g:ackprg = 'ag --nogroup --nocolor --column'

set encoding=UTF_8
set number
set relativenumber

" KEYBINDINGS
nmap <leader>e :NERDTreeMirror<CR>:NERDTreeToggle<CR>
" nmap <leader>f :MinimapClose<CR> :Files<CR>
" nmap <leader>b :MinimapClose<CR> :Buffers<CR>

"File Search
nmap <silent> <leader>fs :Files<CR>

"Buffer Search
nmap <silent> <leader>bs :Buffers<CR>

"Pattern Search
nmap <silent> <leader>ps :Ag<CR>

nmap <leader>t :tabnew<CR>

nmap <leader>l :bprevious <CR>
nmap <leader>h :bnext <CR>


nmap <leader>fm :YcmCompleter Format<CR>

"Copy to clipboard
vnoremap <c-C> :w !xclip -i -sel c<CR><CR>

nmap gd :YcmCompleter GoToDefinition<CR>
nmap <silent> <leader>ih <Plug>(YCMToggleInlayHints)

nmap <silent> <c-k> :wincmd k<CR>
nmap <silent> <c-j> :wincmd j<CR>
nmap <silent> <c-h> :wincmd h<CR>
nmap <silent> <c-l> :wincmd l<CR>

let g:minimap_toggle='<leader>mm'


let g:clang_format#style_options = {
      \ "ColumnLimit": 120 }


" cnoreabbrev Ack Ack!
nnoremap <Leader>fa :CtrlSF<Space>

" nnoremap gn :tabnext <CR>
" nnoremap gp :tabprev <CR>

map <F9> :YcmCompleter FixIt<CR>

" Enable the list of buffers
let g:airline#extensions#tabline#enabled = 1

" Show just the filename
let g:airline#extensions#tabline#fnamemod = ':t'

set hidden



let g:Hexokinase_highlighters = [ 'sign_column' ]
let g:Hexokinase_optInPatterns = 'full_hex,rgb,rgba,hsl,hsla,colour_names'

" let g:minimap_width = 10
" let g:minimap_auto_start = 1
" let g:minimap_auto_start_win_enter = 1

" LSP
let g:ycm_enable_semantic_highlighting=1
let g:ycm_enable_inlay_hints=0
let g:ycm_echo_current_diagnostic='virtual-text'
let g:ycm_update_diagnostics_in_insert_mode=0
let g:ycm_autoclose_preview_window_after_insertion=1
let g:ycm_key_invoke_completion = '<C-Space>'
let g:ycm_confirm_extra_conf = 0
let g:ycm_clangd_args=['--header-insertion=never']


let g:ycm_semantic_triggers = {
      \ 'cpp': ['->', '.', '::', 'SDL'],
      \ }

" let loaded_minimap = 1
" autocmd VimEnter * Minimap
" autocmd TabEnter * MinimapClose
autocmd VimLeave * MinimapClose

" autocmd Filetype cpp,c,js Minimap

augroup rainbow_c
  autocmd!
  autocmd FileType cpp,c,js RainbowParentheses
augroup END

let g:rainbow#pairs = [['(', ')'], ['[', ']'], ['{', '}']]

hi VimwikiLink term=underline ctermfg=cyan guifg=cyan gui=underline
let g:vimwiki_list = [{'path': '~/vimwiki',
      \ 'nested_syntaxes': {'cpp': 'cpp', 'js': 'js', 'ts': 'ts', 'jsx': 'jsx', 'tsx': 'tsx'}}]

