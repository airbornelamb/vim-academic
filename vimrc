""" Auto Installation for Plug, FZF, and RipGrep credit to https://github.com/bag-man/dotfiles

  if empty(glob("~/.vim/autoload/plug.vim"))
    silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
          \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    auto VimEnter * PlugInstall
  endif

  if !empty(glob("~/.fzf/bin/fzf"))
    if empty(glob("~/.fzf/bin/rg"))
      silent !curl -fLo /tmp/rg.tar.gz
            \ https://github.com/BurntSushi/ripgrep/releases/download/0.7.1/ripgrep-0.7.1-x86_64-unknown-linux-musl.tar.gz
      silent !tar xzvf /tmp/rg.tar.gz --directory /tmp
      silent !cp /tmp/ripgrep-0.7.1-x86_64-unknown-linux-musl/rg ~/.fzf/bin/rg
    endif
endif


set nocompatible 	   "force Vim over vi
set nofoldenable 	   "disable folding
filetype plugin indent on  "Load plugins according to detected filetype
syntax on 		   "turns on syntax highlighting
set omnifunc=syntaxcomplete#Complete "set omnifunc to syntax completion

set laststatus =2          " Always show statusline.
set autoindent             " Indent according to previous line.
set expandtab              " Use spaces instead of tabs.
set softtabstop =4         " Tab key indents by 4 spaces.
set shiftwidth  =4         " >> indents by 4 spaces.
set shiftround             " >> indents to next multiple of 'shiftwidth'.
set backspace =indent,eol,start  " Make backspace work as you would expect.

" Uncomment the below two lines to enable persistent undo
" set undofile
" set undodir =$HOME/.vim/files/undo/

" PLUGINS

call plug#begin('~/.vim/plugged')

Plug 'vim-pandoc/vim-pandoc'			" Pandoc file support
Plug 'vim-pandoc/vim-pandoc-syntax'		" Pandoc syntax support
Plug 'junegunn/goyo.vim'			" Distraction-free mode
Plug 'junegunn/limelight.vim'			" Highlights current line
Plug 'ervandew/supertab'			" Helps tab completion
Plug 'mbbill/undotree'				" Visually displays the undo tree
Plug 'reedes/vim-litecorrect'			" Corrects common prose errors
Plug 'matze/vim-move'				" Allows move lines
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }	" Fuzzy file finder
Plug 'junegunn/fzf.vim'				" Vim bindings for fzf
"Plug 'suan/vim-instant-markdown'		" markdown preview, requires extra install
Plug 'flazz/vim-colorschemes'			" Colorscheme pack

call plug#end()

" Bind Goyo to Limelight
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

" Enable ripgrep for fulltext search with :F
let g:rg_command = '
  \ rg --column --line-number --no-heading --fixed-strings --ignore-case --no-ignore --hidden --follow --color "always"
  \ -g "*.{js,json,php,md,styl,jade,html,config,py,cpp,c,go,hs,rb,conf}"
  \ -g "!{.git,node_modules,vendor}/*" '

command! -bang -nargs=* F call fzf#vim#grep(g:rg_command .shellescape(<q-args>), 1, <bang>0)

"Key mappings
nnoremap <F5> :Goyo<cr>
nnoremap <F6> :UndotreeToggle<cr>
nnoremap <F7> :earlier<cr>
nnoremap <F8> :later<cr>

"set colorscheme
colorscheme 256-grayvim
