let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
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
filetype plugin on
syntax on

autocmd FileType c,cpp ClangFormatAutoEnable

" PLUGINS
call plug#begin()

" List your plugins here
Plug 'tpope/vim-sensible'

" Plug 'nordtheme/vim'
" Plug 'ghifarit53/tokyonight-vim'
Plug 'catppuccin/vim', { 'as': 'catppuccin' }

Plug 'itchyny/lightline.vim'
Plug 'junegunn/rainbow_parentheses.vim'
Plug 'terryma/vim-smooth-scroll'
Plug 'preservim/nerdtree'
Plug 'tpope/vim-commentary'
" Plug 'yegappan/lsp'
Plug 'tpope/vim-surround'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'tmsvg/pear-tree'
Plug 'ycm-core/YouCompleteMe'
Plug 'rhysd/vim-clang-format'
Plug 'rdnetto/YCM-Generator', { 'branch': 'stable'}
Plug 'vimwiki/vimwiki'
" Plug 'ryanoasis/vim-devicons'
" Plug 'neoclide/coc.nvim', {'branch': 'release'}

call plug#end()

" FZF
command! -bang -nargs=? -complete=dir Files
    \ call fzf#vim#files(<q-args>, fzf#vim#with_preview({'options': ['--layout=reverse', '--info=inline']}), <bang>0)
2024
" THEME
" colorscheme nord
" colorscheme tokyonight 
"
colorscheme catppuccin_frappe
let g:lightline = {'colorscheme': 'catppuccin_frappe'}

set encoding=UTF_8
set number
set relativenumber

" KEYBINDINGS
nnoremap <leader>e :NERDTreeToggle<CR>
nnoremap <leader>ff :Files<CR>
nnoremap <leader>fa :Files ~<CR>
nnoremap <leader>fm :ClangFormat<CR>
nnoremap gd :YcmCompleter GoToDefinition<CR>

map <F9> :YcmCompleter FixIt<CR>

" LSP
let g:ycm_enable_semantic_highlighting=1
let g:ycm_enable_inlay_hints=1
let g:ycm_echo_current_diagnostic='virtual-text'
let g:ycm_update_diagnostics_in_insert_mode=0
let g:ycm_autoclose_preview_window_after_insertion=1
let g:ycm_key_invoke_completion = '<C-Space>'
let g:ycm_confirm_extra_conf = 0
let g:ycm_clangd_args=['--header-insertion=never']

let g:ycm_semantic_triggers = {
      \ 'cpp': ['->', '.', '::', 'SDL'],
      \ }


augroup rainbow_c
  autocmd!
  autocmd FileType cpp,c RainbowParentheses
augroup END

let g:rainbow#pairs = [['(', ')'], ['[', ']'], ['{', '}']]

hi VimwikiLink term=underline ctermfg=cyan guifg=cyan gui=underline
let g:vimwiki_list = [{'path': '~/vimwiki',
                        \ 'nested_syntaxes': {'cpp': 'cpp'}}]


