let g:python3_host_prog=$HOME."\\Anaconda3\\envs\\nvim37\\python.exe"
let g:python_host_prog=$HOME."\\Anaconda3\\envs\\nvim27\\python.exe"

call plug#begin($HOME."\\.vim\\plugged")
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-commentary'
Plug 'vim-airline/vim-airline'
Plug 'icymind/NeoSolarized'
" NERD
Plug 'scrooloose/nerdtree'
" GIT
Plug 'tpope/vim-fugitive'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'airblade/vim-gitgutter'
" Markdown <C-p>
Plug 'JamshedVesuna/vim-markdown-preview'
" LATEX
Plug 'lervag/vimtex'
Plug 'vim-voom/VOoM'
" Surround (cs)
Plug 'tpope/vim-surround'
" Python (<F7>, <F8>)
Plug 'nvie/vim-flake8'
Plug 'tell-k/vim-autopep8'
call plug#end()

cd $HOME

""""""""
" SAVE "
""""""""

" Save with <C-s>
" If the current buffer has never been saved, it will have no name,
" call the file browser to save it, otherwise just save it.
command -nargs=0 -bar Update if &modified
                           \|    if empty(bufname('%'))
                           \|        browse confirm write
                           \|    else
                           \|        confirm write
                           \|    endif
                           \|endif
nnoremap <silent> <C-s> :<C-u>Update<CR>
inoremap <C-s> <Esc>:Update<CR>

" Save and exit with <C-q>
nnoremap <C-q> :Update<CR>:q<CR>

"""""""""
" BASIC "
"""""""""

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

" Conclude search with \n
nnoremap <silent> <leader>n :nohl<CR>

" Use jj instead of <ESC>
inoremap jj <Esc>
" and save automatically when leaving insert mode (uncomment)
" inoremap jj <Esc>:w<CR>
inoremap <Esc> <NOP>

" Persistent undo (file-by-file)
set undofile
set undodir=$HOME\\.vim\\undodir

" Split navigation
nnoremap <silent> <C-h> <C-w>h
nnoremap <silent> <C-l> <C-w>l
nnoremap <silent> <C-j> <C-w>j
nnoremap <silent> <C-k> <C-w>k

"Highligh trailing whitespaces
set listchars=trail:·
set list

" Remove trailing whitespaces with \w
nnoremap <silent> <leader>w :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar>:nohl<Bar>:unlet _s <Bar>:%s/\($\n\s*\)\+\%$//e<Bar><CR>



try

""""""""""""""""
" VISUAL THEME "
""""""""""""""""

    colorscheme NeoSolarized
    set background=dark

    " default value is "normal", Setting this option to "high" or "low" does use the
    " same Solarized palette but simply shifts some values up or down in order to
    " expand or compress the tonal range displayed.
    let g:neosolarized_contrast = "high"

    " Special characters such as trailing whitespace, tabs, newlines, when displayed
    " using ":set list" can be set to one of three levels depending on your needs.
    " Default value is "normal". Provide "high" and "low" options.
    let g:neosolarized_visibility = "high"

    " I make vertSplitBar a transparent background color. If you like the origin solarized vertSplitBar
    " style more, set this value to 0.
    let g:neosolarized_vertSplitBgTrans = 1

    " If you wish to enable/disable NeoSolarized from displaying bold, underlined or italicized
    " typefaces, simply assign 1 or 0 to the appropriate variable. Default values:
    let g:neosolarized_bold = 1
    let g:neosolarized_underline = 1
    let g:neosolarized_italic = 0

    let g:gitgutter_override_sign_column_highlight = 0


""""""""""""
" NERDTREE "
""""""""""""

    " Launch NERDTree with \t
    nnoremap <silent> <leader>t :NERDTree<CR>
    autocmd vimenter * NERDTree " Launch on boot
    let NERDTreeMapActivateNode='<space>' " Open file/folders with <space>
    set splitright

"""""""""""
" FOLDING "
"""""""""""

    " with <spacebar>
    set foldmethod=indent
    set foldlevel=99
    nnoremap <space> za

"""""""""
" LATEX "
"""""""""

    " Tex compilation with \ll (and on save)
    " \v to view file structure
    let g:tex_flavor = 'latex'
    let g:vimtex_view_general_viewer = 'SumatraPDF'
    let g:vimtex_view_general_options
            \ = '-reuse-instance -forward-search @tex @line @pdf'
    let g:vimtex_view_general_options_latexmk = '-reuse-instance'
    nnoremap <leader>v <Esc>:Voom latex <CR>

""""""""""""
" MARKDOWN "
""""""""""""

    " Markdown github style visualization with <C-p>
    " Don't forget to: $ pip install grip
    let vim_markdown_preview_github=1

""""""""""
" PYTHON "
""""""""""

    " Flake (<F7>)
    " Auto Pep 8 (<F8>)
    autocmd FileType python noremap <buffer> <F8> :call Autopep8()<CR>

catch
endtry
