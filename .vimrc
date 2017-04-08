" vundle
let vundle_readme=expand('~/.vim/bundle/Vundle.vim/README.md')
if !filereadable(vundle_readme)
    echo 'Installing Vundle ...'
    silent !mkdir -p ~/.vim/bundle
    silent !git clone https://github.com/gmarik/vundle ~/.vim/bundle/Vundle.vim
endif
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'ap/vim-css-color'
Plugin 'arnaud-lb/vim-php-namespace'
Plugin 'avakhov/vim-yaml'
Plugin 'c9s/colorselector.vim'
Plugin 'cakebaker/scss-syntax.vim'
Plugin 'chase/vim-ansible-yaml'
Plugin 'dietsche/vim-lastplace'
Plugin 'ekalinin/Dockerfile.vim'
Plugin 'guns/xterm-color-table.vim'
Plugin 'jelera/vim-javascript-syntax'
Plugin 'junegunn/vim-easy-align'
Plugin 'kien/ctrlp.vim'
Plugin 'klen/python-mode'
Plugin 'ludovicchabant/vim-gutentags'
Plugin 'L9'
Plugin 'Lokaltog/vim-easymotion'
Plugin 'mattn/emmet-vim'
Plugin 'mikehaertl/pdv-standalone'
Plugin 'mkitt/tabline.vim'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'othree/html5.vim'
Plugin 'othree/javascript-libraries-syntax.vim'
Plugin 'pangloss/vim-javascript'
Plugin 'plasticboy/vim-markdown'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/nerdcommenter'
Plugin 'scrooloose/syntastic'
Plugin 'StanAngeloff/php.vim'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'tpope/vim-ragtag'
Plugin 'tpope/vim-surround'
Plugin 'Townk/vim-autoclose'
Plugin 'Valloric/YouCompleteMe'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'vim-scripts/Align'
Plugin 'vim-scripts/matchit.zip'
Plugin 'vim-scripts/OOP-javascript-indentation'
Plugin 'vim-scripts/taglist.vim'
Plugin 'webberwu/html.vim'
Plugin 'webberwu/snipmate.vim'
Plugin 'webberwu/vim-fugitive'
call vundle#end()

set encoding=utf-8
set fileencodings=utf-8,big5

syntax on
set t_Co=256
set incsearch
set hls
set nu
set ru
set ic
set encoding=utf-8
set fileencoding=utf-8
" set mouse=a
set modeline
set cursorline
set background=dark
set nocompatible
set backspace=indent,eol,start
set suffixes=.bak,~,.swp,.o,.info,.aux,.log,.dvi,.bbl,.blg,.brf,.cb,.ind,.idx,.ilg,.inx,.out,.toc
set history=100
set expandtab
set tabstop=4
set sw=4
set showtabline=2                     " always show tab
set wildmode=longest,list             " use emacs-style tab completion when selecting files, etc
set wildmenu                          " make tab completion for files/buffers act like bash

"colorscheme desert
colorscheme webberwu

set laststatus=2
set statusline=%0*\ %{fugitive#statusline()}\ %*
set statusline+=%2*\ %*
set statusline+=%3*%m%r%*
set statusline+=%2*%f\ %*
set statusline+=%1*\ %{&ff},%{&fileencoding}%Y%H%W
set statusline+=%=%*
set statusline+=%1*\ dec:\%3.b,\ hex:\%2.B\ %*
set statusline+=%2*\ row:%4.l/%4.L,\ col:%3.c\ %*
set statusline+=%0*\ %3.p%%\ %*
highlight User1 cterm=none ctermbg=235 ctermfg=grey
highlight User2 cterm=none ctermbg=237 ctermfg=white
highlight User3 cterm=none ctermbg=237 ctermfg=darkred

filetype plugin indent on

autocmd BufNewFile,BufRead *.phtml set filetype=php
autocmd BufNewFile,BufRead *.html set filetype=php
autocmd BufNewFile,BufRead *.htm set filetype=php
autocmd BufNewFile,BufRead *.yml set filetype=yaml

highlight ExtraWhitespace ctermbg=1 guibg=red
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()

set foldmethod=indent
set foldlevelstart=99
"autocmd BufWinLeave * mkview
"autocmd BufWinEnter * silent loadview
"autocmd Syntax php normal zR

inoremap jj <ESC>
inoremap jm $
inoremap jk ->
inoremap jl =>
noremap me $
noremap ms ^
noremap .rs :%s/\s\+$//<CR>

"pdv-standalone
let g:pdv_cfg_Author = 'Webber Wu <chenshin0719@gmail.com>'
let g:pdv_cfg_ReturnVal = ''
let g:pdv_cfg_Uses = 1
nnoremap <C-K> :call PhpDocSingle()<CR>
vnoremap <C-K> :call PhpDocRange()<CR>

"let NERDTreeIgnore=['\~$', '\.lo$', '\.la$']
let g:EasyMotion_leader_key = '<Leader>'

"ctrlp
set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " MacOSX/Linux
set wildignore+=*\\tmp\\*,*.swp,*.zip,*.exe  " Windows

let g:ctrlp_max_files=0
let g:ctrlp_clear_cache_on_exit = 0
let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'

"vim-indent-guides
let g:indent_guides_auto_colors = 0
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_guide_size = 1
let g:indent_guides_start_level = 2
hi IndentGuidesOdd  ctermbg=233
hi IndentGuidesEven ctermbg=234

autocmd BufReadPre *.js let b:javascript_lib_use_jquery = 1
autocmd BufReadPre *.js let b:javascript_lib_use_underscore = 1
autocmd BufReadPre *.js let b:javascript_lib_use_backbone = 0
autocmd BufReadPre *.js let b:javascript_lib_use_prelude = 0
autocmd BufReadPre *.js let b:javascript_lib_use_angularjs = 1

"syntastic
let g:syntastic_auto_loc_list=1
let g:syntastic_php_checkers=['php', 'phpmd']
let g:syntastic_css_checkers=[]
let g:syntastic_html_checkers=[]
let g:syntastic_javascript_checkers=['jshint']

"taglist
nnoremap <silent> <F8> :TlistToggle<CR>
let g:Tlist_Show_One_File = 1
let g:Tlist_Exit_OnlyWindow = 1
let g:Tlist_GainFocus_On_ToggleOpen = 1

"pymode
let g:pymode_options_colorcolumn = 0

"vim-easy-align
"usage: vmode: ga*|
nmap ga <Plug>(EasyAlign)
xmap ga <Plug>(EasyAlign)
" https://robots.thoughtbot.com/align-github-flavored-markdown-tables-in-vim
vmap <Leader><Bslash> :EasyAlign*<Bar><Enter>

"airline
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_buffers = 0
"airline-theme
"screenshots: https://github.com/vim-airline/vim-airline/wiki/Screenshots
let g:airline_theme='powerlineish'

"vim-gutentags
let g:gutentags_cache_dir = '~/.cache/vim-gutentags'
nmap <C-]> :tab tag <C-R><C-W><CR>

"vim-php-namespace: use statements
let g:php_namespace_sort_after_insert = 1
function! IPhpInsertUse()
    call PhpInsertUse()
    call feedkeys('a',  'n')
endfunction
autocmd FileType php inoremap <Leader>nu <Esc>:call IPhpInsertUse()<CR>
autocmd FileType php noremap <Leader>nu :call PhpInsertUse()<CR>

"vim-php-namespace: fully qualified
function! IPhpExpandClass()
    call PhpExpandClass()
    call feedkeys('a', 'n')
endfunction
autocmd FileType php inoremap <Leader>nf <Esc>:call IPhpExpandClass()<CR>
autocmd FileType php noremap <Leader>nf :call PhpExpandClass()<CR>

"YouCompleteMe
let g:ycm_seed_identifiers_with_syntax = 1
let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
"https://github.com/Valloric/YouCompleteMe/issues/2015
set completeopt-=preview
"autocmd InsertLeave * if pumvisible() == 0|pclose|endif
"inoremap <C-c> <ESC>
