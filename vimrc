set nofoldenable "disable folding

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()
Plugin 'gmarik/vundle'

" Main plugins

Plugin 'vim-pandoc/vim-pandoc'
Plugin 'vim-pandoc/vim-pandoc-syntax'
Plugin 'junegunn/goyo.vim'
Plugin 'junegunn/limelight.vim'
Plugin 'ervandew/supertab'
Plugin 'mbbill/undotree'

"Color Schemes
Plugin 'flazz/vim-colorschemes'

call vundle#end()

autocmd! User GoyoEnter Limelight
autocmd! User GoyoLeave Limelight!

"Pandoc options
let g:pandoc#filetypes#handled = ["pandoc", "markdown"]

"Supertab options
let g:SuperTabDefaultCompletionType = "context"

"Key mappings
nnoremap <F5> :Goyo<cr>
nnoremap <F6> :UndotreeToggle<cr>
nnoremap <F7> :earlier<cr>
nnoremap <F8> :later<cr>

"set colorscheme
colorscheme 256-grayvim
