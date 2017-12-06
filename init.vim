" TODO launch tests on explicit save with :w
" Preliminary setup
call plug#begin('~/.local/share/nvim/plugged')
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-commentary'
Plug 'wikitopian/hardmode'
Plug 'altercation/vim-colors-solarized'
" NERD
Plug 'scrooloose/nerdtree'
" GIT
Plug 'tpope/vim-fugitive'
Plug 'Xuyuanp/nerdtree-git-plugin'
" Markdown
Plug 'JamshedVesuna/vim-markdown-preview'
" LATEX
Plug 'lervag/vimtex'
Plug 'vim-voom/VOoM'
call plug#end()

syntax enable

" Visual theme
set background=light
colorscheme solarized

" Launch NERDTree with \t
nnoremap <silent> <leader>t :NERDTree<CR>
" autocmd vimenter * NERDTree " Launch on boot
let NERDTreeMapActivateNode='<space>' " Open file/folders with <space>
set splitright

" Highligh max columns (PEP8)
set colorcolumn=79

" Basic spell check (z= for correction choices, zg to add word)
:setlocal spell spelllang=en_us

" Basic formatting
set encoding=utf-8
set fileformat=unix
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab

" Revert to default backspace behavior
" Protect content prior to insert or linebreak
set backspace=eol

" Break line with Ctrl-j (to right of cursor)
nnoremap <C-j> li<CR><ESC>

" Conclude search with \n
nnoremap <silent> <leader>n :nohl<CR>

" Break bad habits: disable arrows
inoremap <Up> <NOP>
inoremap <Down> <NOP>
inoremap <Left> <NOP>
inoremap <Right> <NOP>

" Break bad habits: moving with HJKL
" Toggle with \h
nnoremap <leader>h <Esc>:call ToggleHardMode()<CR>

" Uncomment following line to boot in HardMode:
" autocmd VimEnter,BufNewFile,BufReadPost * silent! call HardMode()

" Use jj instead of <ESC>
" and save automatically when leaving insert mode
inoremap jj <Esc>:w<CR>
inoremap <Esc> <NOP>

" Persistent undo (file-by-file)
set undofile
set undodir=~/.vim/undodir

" Relative line numbers (e.g. for easy deleting)
set number relativenumber

" Split navigation
nnoremap <silent> <Left> <C-w>h
nnoremap <silent> <Down> <C-w>j
nnoremap <silent> <Up> <C-w>k
nnoremap <silent> <Right> <C-w>l
nnoremap <silent> <Tab> <C-w><C-w>

"Highligh trailing whitespaces
set listchars=trail:·
set list

" Remove trailing whitespaces with \w
nnoremap <silent> <leader>w :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar>:nohl<Bar>:unlet _s <Bar>:%s/\($\n\s*\)\+\%$//e<Bar><CR>


" Code folding with <spacebar>
set foldmethod=indent
set foldlevel=99
nnoremap <space> za

" Tex compilation with \ll (and on save)
" \v to view file structure
let g:tex_flavor = 'latex'
nnoremap <leader>v <Esc>:Voom latex <CR>
" Markdown github style visualization with <C-p>
" Don't forget to: $ pip install grip
let vim_markdown_preview_github=1
