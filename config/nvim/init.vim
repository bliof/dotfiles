set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath
source ~/.vimrc

let test#strategy = "neovim"
tnoremap <C-W>N <C-\><C-n>


" lua << EOF
" require('codecompanion').setup({
"   ollama = {
"     model = "gemma3:1b",
"     host = "http://localhost:11434"
"   },
"   strategies = {
"       chat = {
"           adapter = "ollama",
"       },
"       inline = {
"           adapter = "ollama",
"       },
"       agent = {
"           adapter = "ollama",
"       },
"   },
" })
" EOF
