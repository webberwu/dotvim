" vim-plug
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Valloric/YouCompleteMe
" https://github.com/Valloric/YouCompleteMe/issues/1751#issuecomment-273380629
function! BuildYCM(info)
  if a:info.status == 'installed' || a:info.force
    !./install.py --all
  endif
endfunction

call plug#begin('~/.vim/plugged')
Plug 'airblade/vim-gitgutter'
Plug 'ap/vim-css-color'
Plug 'arnaud-lb/vim-php-namespace', { 'for': 'php' }
Plug 'avakhov/vim-yaml'
Plug 'c9s/colorselector.vim'
Plug 'cakebaker/scss-syntax.vim', { 'for': ['sass', 'scss'] }
Plug 'chase/vim-ansible-yaml'
Plug 'derekwyatt/vim-scala', { 'for': 'scala' }
Plug 'dietsche/vim-lastplace'
Plug 'editorconfig/editorconfig-vim'
Plug 'ekalinin/Dockerfile.vim'
Plug 'guns/xterm-color-table.vim'
Plug 'hail2u/vim-css3-syntax'
Plug 'heavenshell/vim-jsdoc', { 'for': ['js', 'vue'] }
Plug 'isRuslan/vim-es6', { 'for': ['js', 'vue'] }
Plug 'jelera/vim-javascript-syntax', { 'for': ['js', 'vue'] }
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'junegunn/vim-easy-align'
Plug 'jwalton512/vim-blade', { 'for': 'php' }
Plug 'kien/ctrlp.vim'
Plug 'klen/python-mode', { 'for': 'py' }
Plug 'ludovicchabant/vim-gutentags'
Plug 'lvht/phpcd.vim', { 'for': 'php', 'do': 'composer install' }
Plug 'majutsushi/tagbar'
Plug 'mattn/emmet-vim'
Plug 'mikehaertl/pdv-standalone', { 'for': 'php' }
Plug 'mkitt/tabline.vim'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'othree/javascript-libraries-syntax.vim', { 'for': 'js' }
Plug 'plasticboy/vim-markdown', { 'for': 'md' }
Plug 'posva/vim-vue', { 'for': ['js', 'vue'] }
Plug 'scrooloose/nerdtree'
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/syntastic'
Plug 'StanAngeloff/php.vim', { 'for': 'php' }
Plug 'terryma/vim-multiple-cursors'
Plug 'tpope/vim-dotenv'
Plug 'tpope/vim-ragtag'
Plug 'tpope/vim-surround'
Plug 'Townk/vim-autoclose'
Plug 'Valloric/YouCompleteMe', { 'do': function('BuildYCM') }
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'vim-scripts/Align'
Plug 'vim-scripts/L9'
Plug 'vim-scripts/matchit.zip'
Plug 'vim-scripts/OOP-javascript-indentation', { 'for': ['js', 'vue'] }
Plug 'webberwu/html.vim'
Plug 'webberwu/snipmate.vim'
Plug 'webberwu/vim-fugitive'
call plug#end()

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
set tags+=tags,tags.vendors

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

autocmd BufNewFile,BufRead *.yml set filetype=yaml

highlight ExtraWhitespace ctermbg=1 guibg=red
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()

set foldmethod=indent
set foldlevelstart=99
autocmd BufWinLeave *.* silent! mkview
autocmd BufWinEnter *.* silent! loadview
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
let g:ctrlp_custom_ignore = {
    \ 'dir':  'bower_components$\|dist$\|node_modules$\|project_files$\|test$',
    \ 'file': '\.exe$\|\.so$\|\.dll$\|\.pyc$'
    \ }

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
let g:syntastic_scala_checkers=[]
let g:syntastic_javascript_checkers=['jshint']

"tagbar
nmap <F8> :TagbarToggle<CR>
let g:tagbar_autofocus = 1

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
let g:airline#extensions#tabline#show_tab_type = 0
let g:airline#extensions#tabline#close_symbol = '×'
let g:airline#extensions#tabline#fnamemod = ':t'
"airline-theme
"screenshots: https://github.com/vim-airline/vim-airline/wiki/Screenshots
let g:airline_theme='powerlineish'
let g:airline_section_warning = airline#section#create_right(['%{gutentags#statusline()}', 'ycm_warning_count', 'whitespace'])

"vim-gutentags
let g:gutentags_cache_dir = '~/.cache/vim-gutentags'
let g:gutentags_project_root = ['.project', '.vimtag']
" :ts list match file
" :ptselect same with :ts
" :tp previous match file
" :tn next match file
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
autocmd InsertLeave * if pumvisible() == 0|pclose|endif
inoremap <C-c> <ESC>

"vim-multiple-cursors
let g:multi_cursor_quit_key='<C-c>'
nnoremap <C-c> :call multiple_cursors#quit()<CR>

"junegunn/fzf.vim
nnoremap <C-j> :Files<CR>
let g:fzf_tags_command = 'ctags --extra=+f -R'
let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Identifier'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Identifier'],
  \ 'info':    ['fg', 'Delimiter'],
  \ 'prompt':  ['fg', 'Comment'],
  \ 'pointer': ['fg', 'Identifier'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }
