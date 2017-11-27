set nocompatible " might be redundant
set nofoldenable "disable folding
filetype plugin indent on
syntax on "turns on syntax highlighting
set omnifunc=syntaxcomplete#Complete "turn on omnicompletion
set laststatus=2 "turn statusline on

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

"Wordcount from stackoverflow.com/questions/114431
function! WordCount()
   let s:old_status = v:statusmsg
   let position = getpos(".")
   exe ":silent normal g\<c-g>"
   let stat = v:statusmsg
   let s:word_count = 0
   if stat != '--No lines in buffer--'
     let s:word_count = str2nr(split(v:statusmsg)[11])
     let v:statusmsg = s:old_status
   end
   call setpos('.', position)
   return s:word_count 
endfunction

"Create status line
set statusline=%f%=%{WordCount()}\ words\ -\ %{strftime('%R')}

"Key mappings
nnoremap <F5> :Goyo<cr>
nnoremap <F6> :UndotreeToggle<cr>
nnoremap <F7> :earlier<cr>
nnoremap <F8> :later<cr>

"set colorscheme
colorscheme 256-grayvim
