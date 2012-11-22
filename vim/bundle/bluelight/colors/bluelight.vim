hi clear
if exists("syntax_on")
    syntax reset
endif
let colors_name="bluelight"
set background=light

hi Normal       guifg=#444444   guibg=#eeeeee   ctermfg=234    ctermbg=255       gui=none      cterm=none

hi Comment      guifg=#808080   guibg=NONE      ctermfg=240    ctermbg=NONE      gui=none      cterm=none

hi Constant     guifg=#af5f00   guibg=NONE      ctermfg=19    ctermbg=NONE      gui=none      cterm=none
hi BConstant    guifg=#af5f00   guibg=NONE      ctermfg=19    ctermbg=NONE      gui=bold      cterm=bold

hi Identifier   guifg=#008700   guibg=NONE      ctermfg=17     ctermbg=NONE      gui=none      cterm=none
hi BIdentifier  guifg=#008700   guibg=NONE      ctermfg=17     ctermbg=NONE      gui=bold      cterm=bold

hi Statement    guifg=#005faf   guibg=NONE      ctermfg=26     ctermbg=NONE      gui=none      cterm=none
hi BStatement   guifg=#005faf   guibg=NONE      ctermfg=26     ctermbg=NONE      gui=bold      cterm=bold

hi PreProc      guifg=#008787   guibg=NONE      ctermfg=30     ctermbg=NONE      gui=none      cterm=none
hi BPreProc     guifg=#008787   guibg=NONE      ctermfg=30     ctermbg=NONE      gui=bold      cterm=bold

hi Type         guifg=#005f87   guibg=NONE      ctermfg=24     ctermbg=NONE      gui=none      cterm=none
hi BType        guifg=#005f87   guibg=NONE      ctermfg=24     ctermbg=NONE      gui=bold      cterm=bold

hi Special      guifg=#870087   guibg=NONE      ctermfg=202     ctermbg=NONE      gui=none      cterm=none
hi BSpecial     guifg=#870087   guibg=NONE      ctermfg=202     ctermbg=NONE      gui=bold      cterm=bold

" ## Text Markup ##
hi Underlined   guifg=fg        guibg=NONE      ctermfg=fg     ctermbg=NONE      gui=underline cterm=underline
hi Error        guifg=#af0000   guibg=#d7afaf   ctermfg=124    ctermbg=181       gui=none      cterm=none
hi Todo         guifg=#875f00   guibg=#ffffaf   ctermfg=94     ctermbg=229       gui=none      cterm=none
hi MatchParen   guifg=NONE      guibg=#5fd7d7   ctermfg=NONE   ctermbg=80        gui=none      cterm=none
hi NonText      guifg=#afafd7   guibg=NONE      ctermfg=146    ctermbg=NONE      gui=none      cterm=none
hi SpecialKey   guifg=#afd7af   guibg=NONE      ctermfg=151    ctermbg=NONE      gui=none      cterm=none
hi Title        guifg=#005faf   guibg=NONE      ctermfg=25     ctermbg=NONE      gui=bold      cterm=bold

" ## Text Selection ##
hi Cursor       guifg=bg        guibg=#5f87af   ctermfg=bg     ctermbg=67        gui=none      cterm=none
hi CursorIM     guifg=bg        guibg=#5f87af   ctermfg=bg     ctermbg=67        gui=none      cterm=none
hi CursorColumn guifg=NONE      guibg=#dadada   ctermfg=NONE   ctermbg=253       gui=none      cterm=none
hi CursorLine   guifg=NONE      guibg=#dadada   ctermfg=NONE   ctermbg=253       gui=none      cterm=none
hi Visual       guifg=NONE      guibg=#afd7ff   ctermfg=NONE   ctermbg=153       gui=none      cterm=none
hi VisualNOS    guifg=fg        guibg=NONE      ctermfg=fg     ctermbg=NONE      gui=underline cterm=underline
hi IncSearch    guifg=fg        guibg=#57d7d7   ctermfg=fg     ctermbg=80        gui=none      cterm=none
hi Search       guifg=fg        guibg=#ffaf00   ctermfg=fg     ctermbg=214       gui=none      cterm=none

" ## UI ##
hi Pmenu        guifg=bg        guibg=#808080   ctermfg=bg     ctermbg=244       gui=none      cterm=none
hi PmenuSel     guifg=fg        guibg=#afd7ff   ctermfg=fg     ctermbg=153       gui=none      cterm=none
hi PmenuSbar    guifg=#808080   guibg=#444444   ctermfg=244    ctermbg=238       gui=none      cterm=none
hi PmenuThumb   guifg=fg        guibg=#9e9e9e   ctermfg=fg     ctermbg=247       gui=none      cterm=none
hi StatusLine   guifg=bg        guibg=#808080   ctermfg=bg     ctermbg=244       gui=bold      cterm=bold
hi StatusLineNC guifg=#e4e4e4   guibg=#808080   ctermfg=254    ctermbg=244       gui=none      cterm=none
hi TabLine      guifg=bg        guibg=#808080   ctermfg=bg     ctermbg=244       gui=none      cterm=none
hi TabLineFill  guifg=#b2b2b2   guibg=#808080   ctermfg=249    ctermbg=244       gui=none      cterm=none
hi TabLineSel   guifg=fg        guibg=#afd7ff   ctermfg=fg     ctermbg=153       gui=none      cterm=none
hi VertSplit    guifg=#e4e4e4   guibg=#808080   ctermfg=254    ctermbg=244       gui=none      cterm=none
hi Folded       guifg=#626262   guibg=#bcbcbc   ctermfg=241    ctermbg=250       gui=bold      cterm=none
hi FoldColumn   guifg=#626262   guibg=#bcbcbc   ctermfg=241    ctermbg=250       gui=bold      cterm=none

" ## Spelling ##
hi SpellBad     guisp=#d70000                   ctermfg=160    ctermbg=NONE      gui=undercurl cterm=underline
hi SpellCap     guisp=#00afd7                   ctermfg=38     ctermbg=NONE      gui=undercurl cterm=underline
hi SpellRare    guisp=#5faf00                   ctermfg=70     ctermbg=NONE      gui=undercurl cterm=underline
hi SpellLocal   guisp=#d7af00                   ctermfg=178    ctermbg=NONE      gui=undercurl cterm=underline

" ## Diff ##
hi DiffAdd      guifg=fg        guibg=#afd7af   ctermfg=fg     ctermbg=151       gui=none      cterm=none
hi DiffChange   guifg=fg        guibg=#d7d7af   ctermfg=fg     ctermbg=187       gui=none      cterm=none
hi DiffDelete   guifg=fg        guibg=#d7afaf   ctermfg=fg     ctermbg=181       gui=none      cterm=none
hi DiffText     guifg=#d75f00   guibg=#d7d7af   ctermfg=166    ctermbg=187       gui=bold      cterm=bold

" ## Misc ##
hi Directory    guifg=#00875f   guibg=NONE      ctermfg=29     ctermbg=NONE      gui=none      cterm=none
hi ErrorMsg     guifg=#af0000   guibg=NONE      ctermfg=124    ctermbg=NONE      gui=none      cterm=none
hi SignColumn   guifg=#626262   guibg=#d0d0d0   ctermfg=241    ctermbg=252       gui=none      cterm=none
hi LineNr       guifg=#9e9e9e   guibg=#dadada   ctermfg=241    ctermbg=253       gui=none      cterm=none
hi CursorLineNr guifg=#9e9e9e   guibg=#dadada   ctermfg=241    ctermbg=253       gui=none      cterm=none
hi MoreMsg      guifg=#005fd7   guibg=NONE      ctermfg=26     ctermbg=NONE      gui=none      cterm=none
hi ModeMsg      guifg=fg        guibg=NONE      ctermfg=fg     ctermbg=NONE      gui=none      cterm=none
hi Question     guifg=fg        guibg=NONE      ctermfg=fg     ctermbg=NONE      gui=none      cterm=none
hi WarningMsg   guifg=#af5700   guibg=NONE      ctermfg=130    ctermbg=NONE      gui=none      cterm=none
hi WildMenu     guifg=fg        guibg=#afd7ff   ctermfg=fg     ctermbg=153       gui=none      cterm=none
hi ColorColumn  guifg=NONE      guibg=#d7d7af   ctermfg=NONE   ctermbg=187       gui=none      cterm=none
hi Ignore       guifg=bg                        ctermfg=bg

" ## Vimwiki Colors ##
hi link VimwikiHeader1 BIdentifier
hi link VimwikiHeader2 BPreProc
hi link VimwikiHeader3 BStatement
hi link VimwikiHeader4 BSpecial
hi link VimwikiHeader5 BConstant
hi link VimwikiHeader6 BType

" ## Tagbar Colors ##
hi link TagbarAccessPublic Constant
hi link TagbarAccessProtected Type
hi link TagbarAccessPrivate PreProc
