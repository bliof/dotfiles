filetype plugin on

set nocompatible   " Disable vi-compatibility

nmap , \

runtime bundle/vim-pathogen/autoload/pathogen.vim

call pathogen#infect()
call pathogen#helptags()

syntax on
set number
set backupdir=~/.vim/backup,.
set directory=~/.vim/backup,.
set hlsearch
set autoindent "makes a copy of the tabs on the previous line 
"set smartindent "adds an extra tab on cetain situations
set tabstop=4
set shiftwidth=4

nnoremap <F4> :set invpaste paste?<CR>
set pastetoggle=<F4>
set showmode
set t_Co=256

colorscheme aldmeris
"set background=light
"colorscheme solarized
"let g:solarized_termcolors=256
"let g:solarized_contrast="high"
"let g:solarized_visibility="high"

nnoremap - o<esc>
nnoremap _ O<esc>

" make tab in v mode ident code
vnoremap <tab> >gv
vnoremap <s-tab> <gv

" make tab in normal mode ident code
nnoremap <tab> I<tab><esc>
nnoremap <s-tab> ^i<bs><esc>

"File navigation
nnoremap <silent> <F1> :bp <CR>
nnoremap <silent> <F2> :bn <CR>
imap <F1> <ESC>
imap <F2> <ESC>
nnoremap <F3> :buffers<CR>:buffer<Space>

" Swap the word under the cursor and the cursor stay at the begining of the
" new word under the cursor
nnoremap <silent> gw "_yiw:s/\(\%#\w\+\)\(\_W\+\)\(\w\+\)/\3\2\1/<CR><C-o>:noh<CR>
" Swap the word under the cursor position with the one on the left and move the cursor to the new position
nnoremap <silent> gl "_yiw?\w\+\_W\+\%#<CR>:s/\(\%#\w\+\)\(\_W\+\)\(\w\+\)/\3\2\1/<CR><c-o><c-l>:noh<CR>
" Swap the word under the cursor position with the one on the right and move the cursor to the new position
nnoremap <silent> gr "_yiw:s/\(\%#\w\+\)\(\_W\+\)\(\w\+\)/\3\2\1/<CR><c-o>/\w\+\_W\+<CR><c-l>:noh<CR>

"sudo save
cmap w!! %!sudo tee > /dev/null %

autocmd FileType perl set complete-=i
autocmd FileType perl let perl_include_pod = 1
autocmd FileType perl let perl_extended_vars = 1

" check perl code with :make
autocmd FileType perl set makeprg=perl\ -c\ %\ $*
autocmd FileType perl set errorformat=%f:%l:%m
autocmd FileType perl set autowrite
autocmd FileType perl noremap <Leader>kk :!perldoc %<CR>
autocmd FileType perl noremap K :!echo <cWORD> <cword> <bar> perl -e '$line = <STDIN>; if ($line =~ /(\w+::\w+)/){exec("perldoc $1")} elsif($line =~ /(\w+)/){exec "perldoc -f $1 <bar><bar> perldoc $1"}'<cr><cr>

autocmd FileType yaml set tabstop=2
autocmd FileType yaml set shiftwidth=2
autocmd FileType yaml set expandtab

autocmd FileType ruby set tabstop=2
autocmd FileType ruby set shiftwidth=2
autocmd FileType ruby set expandtab

autocmd FileType haml set tabstop=2
autocmd FileType haml set shiftwidth=2
autocmd FileType haml set expandtab

function! s:FixWhitespace(line1,line2)
    let l:save_cursor = getpos(".")
    silent! execute ':' . a:line1 . ',' . a:line2 . 's/\s\+$//'
    call setpos('.', l:save_cursor)
endfunction

" Run :FixWhitespace to remove end of line white space.
command! -range=% FixWhitespace call <SID>FixWhitespace(<line1>,<line2>)

"======================================================================
" Plugins config
"======================================================================

let g:miniBufExplMapWindowNavVim = 1

let g:SuperTabDefaultCompletionType = "context"

let g:notes_directory = '~/Documents/notes'

let g:encodingOptions = ['cp1251']

" Setup snipMate
let g:snippets_dir = $HOME . '/.vim/bundle/bliof/snippets/'

let g:template_dir = $HOME . '/.vim/bundle/bliof/templates/'
let g:user = 'Aleksandar Ivanov'
let g:email = 'aivanov92@gmail.com'
let g:templates_no_autocmd = 0

nmap <leader>j :SplitjoinSplit<cr>
nmap <leader>k :SplitjoinJoin<cr>


