set nocompatible
set nofoldenable "disable folding
filetype plugin indent on
syntax on "turns on syntax highlighting
set omnifunc=syntaxcomplete#Complete

" Uncomment the below two lines to enable persistent undo
" set undodir=~/.vim
" set undofile

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
Plugin 'reedes/vim-litecorrect'

"Color Schemes
Plugin 'flazz/vim-colorschemes'

call vundle#end()

autocmd! User GoyoEnter Limelight
autocmd! User GoyoLeave Limelight!

" start litecorrect for markdown
augroup litecorrect
  autocmd!
  autocmd FileType markdown,mkd call litecorrect#init()
augroup END

"Pandoc options
let g:pandoc#filetypes#handled = ["pandoc", "markdown"]

"Supertab options
let g:SuperTabDefaultCompletionType = "<c-x><c-o>"

"Key mappings
nnoremap <F5> :Goyo<cr>
nnoremap <F6> :UndotreeToggle<cr>
nnoremap <F7> :earlier<cr>
nnoremap <F8> :later<cr>

"set colorscheme
colorscheme 256-grayvim
