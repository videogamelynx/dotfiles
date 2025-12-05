let data_dir = has('nvim') ? stdpath('data') . '/snnoremap <Leader>a :Ack!<Space>ite' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source '~/.vimrc'
endif

" PLUGINS
call plug#begin()

" List your plugins here
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
" Plug 'ycm-core/YouCompleteMe'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'rhysd/vim-clang-format'
" Plug 'rdnetto/YCM-Generator', { 'branch': 'stable'}
Plug 'vimwiki/vimwiki'
Plug 'ryanoasis/vim-devicons'
Plug 'terryma/vim-multiple-cursors'
Plug 'dyng/ctrlsf.vim'
Plug 'rrethy/vim-hexokinase', { 'do': 'make hexokinase' }
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
Plug 'markonm/traces.vim'
Plug 'wellle/context.vim'
Plug 'EdenEast/nightfox.nvim'
Plug 'neoclide/jsonc.vim'
Plug 'ziglang/zig.vim'

call plug#end()


"set cursors in insert/normal mode
let &t_SI = "\e[6 q"
let &t_EI = "\e[2 q"

"Preferences
set termguicolors
set noshowmode
let mapleader=" "
set tabstop=2
set showtabline=2
set shiftwidth=2
set expandtab
set nocompatible
set background=dark
set mouse=a
set nobackup
set nowritebackup
filetype plugin on
syntax on
set completeopt+=longest

" inoremap <expr><silent> <Esc> <C-r>=pumvisible() ? "\<C-y>" : "\<Esc>"<CR>

" hi Normal   guibg=NONE   ctermbg=NONE
" hi NonText  guibg=NONE   ctermbg=NONE

" autocmd VimEnter * hi Normal ctermbg=none

set termwinsize=15x0
set termwinkey=<C-K>
set noequalalways
set splitright
cabbrev term bo terminal

command Build execute '!cd build && make'
command Run execute '!find build -maxdepth 1 -executable -type f -exec {} \;'

cabbrev build Build
cabbrev run Run

vmap <silent> <C-y> "+y
nmap <silent> <C-v> "+p

au BufWritePre *.js,*.lua,*.json,*.py Autoformat

function! SaveSession()
  mksession! Session.vim
endfunc

command CallSaveSession call SaveSession()
cabbrev ss CallSaveSession

au VimLeavePre *.zig,*.cpp,*.c,Makefile,CMakeLists.txt,*.h call SaveSession()

autocmd FileType c,cpp ClangFormatAutoEnable

" au BufWritePre *.c,*.cpp,*.h,*.hh,*.cc undojoin | ClangFormat

" augroup MyYCMCustom
"   autocmd!
"   autocmd FileType c,cpp let b:ycm_hover = {
"         \ 'command': 'GetDoc',
"         \ 'syntax': &filetype
"         \ }
" augroup END

" Define a default mapping for <C-s>
" nnoremap <silent> <C-s> :YcmCompleter Format<CR>:wall<CR>

" Override the mapping for C and C++ filetypes
" augroup CCppFormat
"   autocmd!
"   autocmd FileType c,cpp nnoremap <buffer> <silent> <C-s> :ClangFormat<CR>:wall<CR>
" augroup END

vnoremap <leader>y :w !xsel -b<CR><CR>

" don't show parse errors in a separate window
let g:zig_fmt_parse_errors = 0
" disable format-on-save from `ziglang/zig.vim`
let g:zig_fmt_autosave = 0


" let g:PaperColor_Theme_Options = {
"   \   'theme': {
"   \     'default.dark': {
"   \       'transparent_background': 1
"   \     }
"   \   }
"   \ }

" COC LSP settings
set updatetime=300
set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate
"
" inoremap <expr> <TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
" inoremap <expr> <S-TAB> pumvisible() ? "\<C-p>" : "\<TAB>"

inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(0) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(0) : "\<C-h>"

" inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
" inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" Make <CR> to accept selected completion item or notify coc.nvim to format
" <C-g>u breaks current undo, please make your own choice
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif


" GoTo code navigation
nmap <silent><nowait> gd <Plug>(coc-definition)
nmap <silent><nowait> gy <Plug>(coc-type-definition)
nmap <silent><nowait> gi <Plug>(coc-implementation)
nmap <silent><nowait> gr <Plug>(coc-references)


" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list
nmap <silent><nowait> [g <Plug>(coc-diagnostic-prev)
nmap <silent><nowait> ]g <Plug>(coc-diagnostic-next)


" Use gh (go to help) to show documentation in preview window
nnoremap <silent> gh :call ShowDocumentation()<CR>

function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction


" Highlight the symbol and its references when holding the cursor
" autocmd CursorHold * silent call CocActionAsync('highlight')

" Add `:OR` command for organize imports of the current buffer
command! -nargs=0 OR   :call     CocActionAsync('runCommand', 'editor.action.organizeImport')


" Add (Neo)Vim's native statusline support
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" (ih) toggles inlay hints
nmap <silent> ih :CocCommand document.toggleInlayHint<CR>


"


set background=dark
let g:gruvbox_contrast_dark = 'hard'
let g:gruvbox_bold = 0
let g:gruvbox_italic = 1

let g:gruvbox_transparent_bg = 1


colorscheme gruvbox

" autocmd VimEnter * hi Normal ctermbg=none

hi Normal   guibg=NONE   ctermbg=NONE


let g:lightline = {
      \ 'colorscheme': 'gruvbox',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'relativepath', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'FugitiveHead'
      \ },
      \ }


" FZF
command! -bang -nargs=? -complete=dir Files
      \ call fzf#vim#files(<q-args>, fzf#vim#with_preview({'options': ['--layout=reverse', '--info=inline']}), <bang>0)
2024

let g:gitgutter_enabled = 0

let g:context_enabled = 1
let g:context_max_per_indent = 1
let g:context_highlight_tag = '<hide>'
let g:context_add_mappings = 0

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

nmap J :bprevious <CR>
nmap K :bnext <CR>

nnoremap H :tabprev <CR>
nmap L :tabnext <CR>

"Debugger

nmap <F5> <Plug>VimspectorContinue
nmap <S-F5> <Plug>VimspectorStop
nmap <F6> <Plug>VimspectorStepOver
nmap <F8> <Plug>VimspectorJumpToNextBreakpoint
nmap <F10> <Plug>VimspectorToggleBreakpoint
" map <F9> :YcmCompleter FixIt<CR>

" nmap <leader>fm :YcmCompleter Format<CR>

"Copy to clipboard
vnoremap <c-C> :w !xclip -i -sel c<CR><CR>

" nmap gd :YcmCompleter GoToDefinition<CR>
" nmap <silent> <leader>ih <Plug>(YCMToggleInlayHints)

nmap <silent> <c-k> :wincmd k<CR>
nmap <silent> <c-j> :wincmd j<CR>
nmap <silent> <c-h> :wincmd h<CR>
nmap <silent> <c-l> :wincmd l<CR>

let g:minimap_toggle='<leader>mm'


let g:clang_format#code_style = "llvm"

let g:clang_format#style_options = {
      \ "ColumnLimit": 120,
      \ "BinPackArguments": "false",
      \ "BinPackParameters": "false",
      \ "ExperimentalAutoDetectBinPacking": "false",
      \ "AllowAllParametersOfDeclarationOnNextLine": "false",
      \ "AllowShortIfStatementsOnASingleLine" : "true"}


" cnoreabbrev Ack Ack!
nnoremap <Leader>fa :CtrlSF<Space>

" nnoremap gn :tabnext <CR>
" nnoremap gp :tabprev <CR>


" Enable the list of buffers
let g:airline#extensions#tabline#enabled = 1

" Show just the filename
let g:airline#extensions#tabline#fnamemod = ':t'

set hidden

let g:Hexokinase_highlighters = [ 'sign_column' ]
let g:Hexokinase_optInPatterns = 'full_hex,rgb,rgba,hsl,hsla,colour_names'


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
