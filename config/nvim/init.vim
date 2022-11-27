set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath
source ~/.vimrc

let test#strategy = "neovim"
tnoremap <C-W>N <C-\><C-n>
