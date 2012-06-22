call pathogen#runtime_append_all_bundles()
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
set sw=4
"set tabstop=4

colorscheme desert

set laststatus=2
set statusline=%0*\ w\ %*
set statusline+=%2*\ %*
set statusline+=%3*%m%r%*
set statusline+=%2*%f\ %*
set statusline+=%1*\ %{&ff},%{&fileencoding}%Y%H%W
set statusline+=%=%*
set statusline+=%1*\ dec:\%3.b,\ hex:\%2.B\ %*
set statusline+=%2*\ row:%4.l/%4.L,\ col:%3.c\ %*
set statusline+=%0*\ %3.p%%\ %*
highlight User1 cterm=none ctermbg=234 ctermfg=grey
highlight User2 cterm=none ctermbg=236 ctermfg=white
highlight User3 cterm=none ctermbg=236 ctermfg=darkred
highlight StatusLine cterm=bold ctermbg=darkmagenta ctermfg=lightmagenta
highlight StatusLineNC cterm=none ctermbg=234 ctermfg=grey
highlight LineNr cterm=none ctermbg=black ctermfg=238
highlight IncSearch cterm=none ctermbg=6 ctermfg=black
highlight Search cterm=none ctermbg=6 ctermfg=black
highlight TabLine cterm=none ctermbg=238 ctermfg=grey
highlight TabLineFill cterm=none ctermbg=236 ctermfg=grey
highlight TabLineSel cterm=none ctermbg=darkmagenta ctermfg=lightmagenta
highlight Visual cterm=none ctermbg=236
highlight CursorLine cterm=none ctermbg=233

filetype plugin indent on

autocmd BufNewFile,BufRead *.phtml set filetype=php
autocmd BufNewFile,BufRead *.html set filetype=php
autocmd BufNewFile,BufRead *.htm set filetype=php

highlight ExtraWhitespace ctermbg=1 guibg=red
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()

inoremap jj <ESC>
inoremap mm $
inoremap ,, ->

"let NERDTreeIgnore=['\~$', '\.lo$', '\.la$']
let g:EasyMotion_leader_key = '<Leader>'

"fix conflict about sparkup <c-n>
let g:sparkupNextMapping = '<c-a>'
