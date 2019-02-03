filetype plugin on
syntax on

let mapleader=','

call plug#begin('~/.vim/bundle')

Plug 'https://bliof@bitbucket.org/bliof/snowlight.git'
Plug 'https://github.com/AndrewRadev/switch.vim.git'
Plug 'https://github.com/bling/vim-airline.git'
Plug 'https://github.com/embear/vim-localvimrc.git'
Plug 'https://github.com/jnwhiteh/vim-golang.git'
Plug 'https://github.com/junegunn/fzf.git', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'https://github.com/junegunn/fzf.vim.git'
Plug 'https://github.com/junegunn/goyo.vim.git'
Plug 'https://github.com/junegunn/vim-peekaboo.git'
Plug 'https://github.com/kchmck/vim-coffee-script.git'
Plug 'https://github.com/mattn/emmet-vim.git'
Plug 'https://github.com/mbbill/undotree.git'
Plug 'https://github.com/mhinz/vim-startify.git'
Plug 'https://github.com/scrooloose/nerdcommenter.git'
Plug 'https://github.com/scrooloose/nerdtree.git'
Plug 'https://github.com/scrooloose/syntastic.git'
Plug 'https://github.com/slim-template/vim-slim.git'
Plug 'https://github.com/tpope/vim-fugitive.git'
Plug 'https://github.com/tpope/vim-rails.git'
Plug 'https://github.com/tpope/vim-surround.git'
Plug 'https://github.com/tpope/vim-unimpaired.git'
Plug 'https://github.com/veloce/vim-aldmeris.git'
Plug 'https://github.com/vim-airline/vim-airline-themes.git'
Plug 'https://github.com/vim-perl/vim-perl.git', { 'for': 'perl', 'do': 'make clean carp dancer highlight-all-pragmas moose test-more try-tiny' }
Plug 'https://github.com/chrisbra/vim-diff-enhanced'
Plug 'https://github.com/morhetz/gruvbox.git'
Plug 'https://github.com/chrisbra/Colorizer.git'
Plug 'https://github.com/rizzatti/dash.vim.git'

call plug#end()

"set nocompatible
set backupdir=~/.vim/backup,.
set directory=~/.vim/backup,.
set undodir=~/.vim/backup,.
set undofile
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
set wildmenu
set nomodeline

set shiftwidth=4
set softtabstop=4
set expandtab
set backspace=indent,eol,start

set termguicolors

" fixes vim and tmux background color problems
if &term =~ '256color'
    set t_ut=
endif

set t_Co=256

if $COLORSCHEME == 'dark'
    set background=dark
    colorscheme gruvbox
    let g:gruvbox_contrast_dark='hard'
else
    set background=light
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

vnoremap <c-c> "+y<ESC>
inoremap <c-v> <ESC>"+Pa

" make tab in normal mode ident code
nnoremap <tab> I<tab><esc>
nnoremap <s-tab> ^i<bs><esc>

inoremap <c-h> <ESC> :bp <CR>
inoremap <c-l> <ESC> :bn <CR>
nnoremap <silent> <c-h> :bp <CR>
nnoremap <silent> <c-l> :bn <CR>
"nnoremap <F3> :buffers<CR>:buffer<Space>

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
    autocmd FileType cpp setlocal sw=4 sts=4 ts=4
augroup END

augroup SpellCheck
    autocmd!

    autocmd FileType gitcommit setlocal spell
    autocmd FileType markdown setlocal spell
    autocmd FileType text setlocal spell
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

autocmd InsertLeave * match Error /\(\s\+$\|\t \| \t\)/

set listchars=
set list

"======================================================================
" Plugins config
"======================================================================

function! s:find_git_root()
    return system('git rev-parse --show-toplevel 2> /dev/null')[:-2]
endfunction

command! ProjectFiles execute 'Files' s:find_git_root()

set rtp+=~/.fzf
let g:fzf_layout = { 'down': '~30%' }
nnoremap <silent> <C-p> :ProjectFiles<CR>
nnoremap <F3> :Buffers<CR>

let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/](\.git|\.hg|\.svn|tmp\/cache|mnesia)$',
  \ 'file': '\v\.(exe|so|dll|cache|jpg|gif|png|pdf|woff|ttf|eot|doc|ico)$',
  \ }

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

let g:ctrlp_reuse_window = 'startify'
let g:startify_custom_header = map(split(system('vim --version | head -n 4'), '\n'), '"   ". v:val') + ['', '', '']
let g:startify_custom_footer = ['', '', '', '   Onward through the mist.']
let g:startify_list_order = [
    \ ['   MRU (here):'],
    \ 'dir',
    \ ['   MRU:'],
    \ 'files',
    \ ['   Sessions:'],
    \ 'sessions',
    \ ['   Bookmarks:'],
    \ 'bookmarks',
    \ ]
let g:startify_bookmarks = [
    \ '~/.vimrc',
    \ ]

if $COLORSCHEME != 'dark'
    hi StartifyBracket ctermfg=245
    hi StartifyFile    ctermfg=24
    hi StartifyFooter  ctermfg=0
    hi StartifyHeader  ctermfg=0
    hi StartifyNumber  ctermfg=0
    hi StartifyPath    ctermfg=238
    hi StartifySlash   ctermfg=238
    hi StartifySpecial ctermfg=24
endif

nnoremap <F2> :UndotreeToggle<CR>:UndotreeFocus<CR>
let g:undotree_WindowLayout=2

let g:goyo_width=100

command! -bang -nargs=* Ag
  \ call fzf#vim#grep(
  \   'ag  --nogroup --column --color --color-line-number "15" --color-match "106" --color-path "1;15" '.shellescape(<q-args>), 1,
  \   <bang>0 ? fzf#vim#with_preview('up:60%')
  \           : fzf#vim#with_preview('right:50%:hidden', '?'),
  \   <bang>0)

noremap <leader>a :Ag! <C-r>=expand('<cword>')<CR><CR>

:nmap <silent> <leader>m <Plug>DashSearch
