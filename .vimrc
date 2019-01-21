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
Plug 'ctrlpvim/ctrlp.vim'
Plug 'davidhalter/jedi-vim', { 'for': 'python' }
Plug 'derekwyatt/vim-scala', { 'for': 'scala' }
Plug 'dietsche/vim-lastplace'
Plug 'editorconfig/editorconfig-vim'
Plug 'ekalinin/Dockerfile.vim'
Plug 'guns/xterm-color-table.vim'
Plug 'hail2u/vim-css3-syntax'
Plug 'heavenshell/vim-jsdoc', { 'for': ['js', 'vue'] }
Plug 'honza/vim-snippets'
Plug 'isRuslan/vim-es6', { 'for': ['js', 'vue'] }
Plug 'jelera/vim-javascript-syntax', { 'for': ['js', 'vue'] }
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'junegunn/vim-easy-align'
Plug 'jwalton512/vim-blade', { 'for': ['blade', 'php'] }
Plug 'kristijanhusak/vim-carbon-now-sh'
Plug 'ludovicchabant/vim-gutentags'
Plug 'lvht/phpcd.vim', { 'for': 'php', 'do': 'composer install' }
Plug 'majutsushi/tagbar'
Plug 'mattn/emmet-vim'
Plug 'mkitt/tabline.vim'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'othree/javascript-libraries-syntax.vim', { 'for': 'js' }
Plug 'phpactor/phpactor', {'for': 'php', 'do': 'composer install'}
Plug 'plasticboy/vim-markdown', { 'for': 'md' }
Plug 'ryanoasis/vim-devicons'
Plug 'scrooloose/nerdtree'
Plug 'scrooloose/nerdcommenter'
Plug 'sheerun/vim-polyglot'
Plug 'SirVer/ultisnips'
Plug 'StanAngeloff/php.vim', { 'for': 'php' }
Plug 'terryma/vim-multiple-cursors'
Plug 'tobyS/vmustache', { 'for': 'php' }
Plug 'tpope/vim-dotenv'
Plug 'tpope/vim-ragtag'
Plug 'tpope/vim-surround'
Plug 'Townk/vim-autoclose'
Plug 'Valloric/YouCompleteMe', { 'do': function('BuildYCM') }
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'vim-scripts/Align'
Plug 'vim-scripts/indentpython.vim'
Plug 'vim-scripts/L9'
Plug 'vim-scripts/matchit.zip'
Plug 'vim-scripts/OOP-javascript-indentation', { 'for': ['js', 'vue'] }
Plug 'w0rp/ale'
Plug 'webberwu/html.vim'
Plug 'webberwu/vim-fugitive'
Plug 'YaroslavMolchan/pdv', { 'for': 'php' }
call plug#end()

set encoding=utf-8
set fileencodings=utf-8,big5

syntax on
set t_Co=256
set incsearch
set hlsearch
set number
set ruler
set ignorecase
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
set tabstop=4
set shiftwidth=4
set expandtab
set showtabline=2                     " always show tab
set wildmode=longest,list             " use emacs-style tab completion when selecting files, etc
set wildmenu                          " make tab completion for files/buffers act like bash
set tags+=tags,tags.vendors
set autoindent
set smartindent
set smarttab
"set autochdir

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
autocmd filetype crontab set nobackup nowritebackup
autocmd FileType python nnoremap <LocalLeader>= :0,$!yapf<CR>

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
noremap gb :Buffers<CR>
noremap bp :bp<CR>
noremap bn :bn<CR>

"forked from tobyS/pdv, YaroslavMolchan/pdv has implemented feature which return type.
"dependence: SirVer/ultisnips, tobyS/vmustache
let g:pdv_cfg_Uses = 1
let g:pdv_template_dir = $HOME . '/.vim/plugged/pdv/templates_snip'
nnoremap <C-K> :call pdv#DocumentWithSnip()<CR> :%s/\s\+$//<CR>
vnoremap <C-K> :call pdv#DocumentWithSnip()<CR> :%s/\s\+$//<CR>

"nerdtree
let NERDTreeShowHidden = 1

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

"tagbar
nmap <F8> :TagbarToggle<CR>
let g:tagbar_autofocus = 1

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
let g:airline_powerline_fonts = 1
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
"https://github.com/Quramy/tsuquyomi/issues/24
let g:ycm_semantic_triggers = {
    \   'html': ['<', '"', '</', ' '],
    \   'javascript,typescript,python,scala,go': ['.'],
    \   'php': ['->', '::', '"', "'", 'use ', 'namespace ', '\'],
    \   'scss,sass,css': [ 're!^\s{4}', 're!:\s+' ],
    \ }

"vim-multiple-cursors
let g:multi_cursor_quit_key='<C-c>'
nnoremap <C-c> :call multiple_cursors#quit()<CR>

"junegunn/fzf.vim
nnoremap <C-j> :Files<CR>
let $FZF_DEFAULT_COMMAND = 'ag --hidden --ignore .git --ignore "*.swp" -f -U -g ""'
let g:fzf_history_dir = '~/.local/share/fzf-history'
let g:fzf_tags_command = 'ctags --extra=+f -R'
let g:fzf_colors = {
    \ 'fg':      ['fg', 'Normal'],
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

" phpactor/phpactor
" Include use statement
nmap <C-u> :call phpactor#UseAdd()<CR>
" Goto definition of class or class member under the cursor
nmap <C-o> :call phpactor#GotoDefinition()<CR>
" Show brief information about the symbol under the cursor
nmap <C-h> :call phpactor#Hover()<CR>
autocmd FileType php setlocal omnifunc=phpactor#Complete

" ryanoasis/vim-devicons
" refs. https://github.com/ryanoasis/nerd-fonts#font-installation
" install font on macOS
" cd ~/Library/Fonts && curl -fLo 'Droid Sans Mono for Powerline Nerd Font Complete.otf' https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/DroidSansMono/complete/Droid%20Sans%20Mono%20Nerd%20Font%20Complete.otf

" w0rp/ale
let g:airline#extensions#ale#enabled = 1
let g:ale_lint_on_enter = 0
let g:ale_open_list = 1
let g:ale_python_auto_pipenv = 1
let g:ale_python_pylint_options = '--disable=line-too-long,missing-docstring,too-few-public-methods'
