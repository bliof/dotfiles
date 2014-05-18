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
colorscheme snowlight

"colorscheme aldmeris
"colorscheme solarized
"let g:solarized_termcolors=256
"let g:solarized_contrast="high"
"let g:solarized_visibility="high"

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

    autocmd FileType yaml,haml,ruby,coffee,eruby setlocal sw=2 sts=2 ts=2
    autocmd FileType xml,html setlocal sw=2 sts=2 ts=2
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

"======================================================================
" Plugins config
"======================================================================

" opens nerdtree and moves the cursor to the current window
"autocmd VimEnter * NERDTree
"autocmd VimEnter * wincmd p

let g:miniBufExplMapWindowNavVim = 1

let g:SuperTabDefaultCompletionType = "context"

let g:notes_directories = ['~/Documents/notes']

let g:encodingOptions = ['cp1251']

let g:template_dir = $HOME . '/.vim/bundle/bliof/templates/'
let g:user = substitute(system('git config user.name'), '\%x00', '', 'g')
let g:email = substitute(system('git config user.email'), '\%x00', '', 'g')
let g:templates_no_autocmd = 0
