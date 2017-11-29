" Preliminary setup
call plug#begin('~/.local/share/nvim/plugged')
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

" Statusline
set statusline=%f
set statusline+=%{fugitive#statusline()}
set statusline+=%=
set statusline+=(%04l
set statusline+=/
set statusline+=%04L)

" Highligh max columns (PEP8)
set colorcolumn=79

" Don't need to use shift for commands
nnoremap ; :

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

" Conclude search with \n
nnoremap <silent> <leader>n :nohl<CR>

" Break bad habits: disable arrows
inoremap <Up> <NOP>
inoremap <Down> <NOP>
inoremap <Left> <NOP>
inoremap <Right> <NOP>

noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>
"
" Break bad habits: moving with HJKL
" Toggle with \h
nnoremap <leader>h <Esc>:call ToggleHardMode()<CR>

" Uncomment following line to boot in HardMode:
" autocmd VimEnter,BufNewFile,BufReadPost * silent! call HardMode()

" Use jj instead of <ESC>
" and save automatically when leaving insert mode
inoremap jj <Esc>:w<CR>
inoremap <Esc> <NOP>

" Quit on write to lose habit of compulsive saving!
" TODO launch tests on explicit save with :w
:cnoreabbrev w w<bar>q

" Persistent undo (file-by-file)
set undofile
set undodir=~/.vim/undodir

" Relative line numbers (e.g. for easy deleting)
set number relativenumber

" Split navigation
nnoremap <silent> <C-h> :wincmd h<CR>
nnoremap <silent> <C-j> :wincmd j<CR>
nnoremap <silent> <C-k> :wincmd k<CR>
nnoremap <silent> <C-l> :wincmd l<CR>

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
let g:tex_flavor = 'latex'

" Markdown github style visualization with <C-p>
" Don't forget to: $ pip install grip
let vim_markdown_preview_github=1
