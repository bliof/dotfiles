filetype plugin on
syntax on

let mapleader=','

runtime bundle/vim-pathogen/autoload/pathogen.vim

call pathogen#infect()
call pathogen#helptags()

set nocompatible
set backupdir=~/.vim/backup,.
set directory=~/.vim/backup,.
set number
set hlsearch
set incsearch
set smartcase
set autowrite
set autoindent
set smartindent
filetype indent on
set smarttab
set complete-=i
set pastetoggle=<F4>
set foldmethod=marker

set shiftwidth=4
set softtabstop=4
set expandtab
set backspace=indent,eol,start

" fixes vim and tmux background color problems
if &term =~ '256color'
    set t_ut=
endif

set t_Co=256

if $COLORSCHEME == 'dark'
    colorscheme aldmeris
else
    colorscheme snowlight
endif

nnoremap <c-a> ^
inoremap <c-a> <esc>^I

nnoremap <c-e> $
inoremap <c-e> <esc>$i

nnoremap - o<esc>
nnoremap _ O<esc>

" make tab in v mode ident code
vnoremap <tab> >gv
vnoremap <s-tab> <gv

" make tab in normal mode ident code
nnoremap <tab> I<tab><esc>
nnoremap <s-tab> ^i<bs><esc>

imap <c-h> <ESC> :bp <CR>
imap <c-l> <ESC> :bn <CR>
nnoremap <silent> <c-h> :bp <CR>
nnoremap <silent> <c-l> :bn <CR>
nnoremap <F3> :buffers<CR>:buffer<Space>

" Swap the word under the cursor and the cursor stay at the begining of the new word under the cursor
nnoremap <silent> gw "_yiw:s/\(\%#\w\+\)\(\_W\+\)\(\w\+\)/\3\2\1/<CR><C-o>:noh<CR>
" Swap the word under the cursor position with the one on the left and move the cursor to the new position
nnoremap <silent> gl "_yiw?\w\+\_W\+\%#<CR>:s/\(\%#\w\+\)\(\_W\+\)\(\w\+\)/\3\2\1/<CR><c-o><c-l>:noh<CR>
" Swap the word under the cursor position with the one on the right and move the cursor to the new position
nnoremap <silent> gr "_yiw:s/\(\%#\w\+\)\(\_W\+\)\(\w\+\)/\3\2\1/<CR><c-o>/\w\+\_W\+<CR><c-l>:noh<CR>

"sudo save
cmap w!! %!sudo tee > /dev/null %

augroup FileTypeOptions
    autocmd!

    autocmd FileType yaml,haml,ruby,coffee setlocal sw=2 sts=2 ts=2
    autocmd FileType xsd,xml,html,eruby setlocal sw=2 sts=2 ts=2
    autocmd FileType jade,css,scss setlocal sw=2 sts=2 ts=2
    autocmd FileType javascript setlocal sw=4 sts=4 ts=4
    autocmd FileType go setlocal noet sw=4 sts=4 ts=4
    autocmd FileType go autocmd BufWritePre <buffer> :Fmt
    autocmd FileType cpp setlocal sw=4 sts=4 ts=4 noet
augroup END

let perl_include_pod = 1
let perl_extended_vars = 1

function! s:FixWhitespace(line1,line2)
    let l:save_cursor = getpos(".")
    silent! execute ':' . a:line1 . ',' . a:line2 . 's/\s\+$//'
    call setpos('.', l:save_cursor)
endfunction

" Run :FixWhitespace to remove end of line white space.
command! -range=% FixWhitespace call <SID>FixWhitespace(<line1>,<line2>)

au InsertEnter * match Error /\s\+\%#\@<!$/
au InsertLeave * match Error /\s\+$/

autocmd FileType gitcommit setlocal spell

"======================================================================
" Plugins config
"======================================================================

let g:notes_directories = ['~/Documents/notes']

let g:encodingOptions = ['cp1251']

" localvimrc
let g:localvimrc_sandbox = 0
let g:localvimrc_persistent = 1

set laststatus=2
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#fnamemod = ':t'

let g:airline#extensions#tabline#buffer_idx_mode = 1
nmap <leader>1 <Plug>AirlineSelectTab1
nmap <leader>2 <Plug>AirlineSelectTab2
nmap <leader>3 <Plug>AirlineSelectTab3
nmap <leader>4 <Plug>AirlineSelectTab4
nmap <leader>5 <Plug>AirlineSelectTab5
nmap <leader>6 <Plug>AirlineSelectTab6
nmap <leader>7 <Plug>AirlineSelectTab7
nmap <leader>8 <Plug>AirlineSelectTab8
nmap <leader>9 <Plug>AirlineSelectTab9

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

" unicode symbols
let g:airline_left_sep = '»'
let g:airline_left_sep = '▶'
let g:airline_right_sep = '«'
let g:airline_right_sep = '◀'
let g:airline_symbols.linenr = '␊'
let g:airline_symbols.linenr = '␤'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.whitespace = 'Ξ'

let g:airline_theme = 'lucius'
