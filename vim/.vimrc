" set UTF-8 encoding
set enc=utf-8
set fenc=utf-8
set termencoding=utf-8

" make searching more tolerable
set ignorecase " case insensitive
set smartcase  " use case if any caps used 
set incsearch  " show match as search proceeds
set hlsearch   " search highlighting

" use indentation of previous line
set autoindent

" use intelligent indentation for C
set smartindent

" configure tabwidth and insert spaces instead of tabs
set tabstop=4        " tab width is 4 spaces
set shiftwidth=4     " indent also with 4 spaces
set expandtab        " expand tabs to spaces

" turn syntax highlighting on
set t_Co=256
syntax on

" kill backwards compatability
set nocompatible
filetype off

" antiquated but standardized...
set textwidth=80

" enable line numbers
set number

" highlighted matching braces
set showmatch

" intelligent comments
set comments=sl:/*,mb:\ *,elx:\ */

" DoxygenToolkit (http://www.vim.org/scripts/script.php?script_id=987)
let g:DoxygenToolkit_authorName="Taha Azzaoui <tazzaoui@cs.uml.edu>"

"=================BEGIN Vundle Plugins=============
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'gmarik/Vundle.vim'
Plugin 'scrooloose/nerdtree'
Bundle 'Valloric/YouCompleteMe'
Plugin 'vim-syntastic/syntastic'
"Plugin 'nvie/vim-flake8'
Plugin 'kien/ctrlp.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}
Plugin 'DoxygenToolkit.vim'
Plugin 'xolox/vim-misc'
Plugin 'xolox/vim-notes'
Plugin 'lervag/vimtex'
call vundle#end()
filetype plugin indent on
"==================END Vundle Plugins=============

"split navigations
nnoremap <C-J> <C-W><C-J> # Move to split below
nnoremap <C-K> <C-W><C-K> # Move to split above
nnoremap <C-L> <C-W><C-L> # Move to split right
nnoremap <C-H> <C-W><C-H> # Move to split left

"ensures that the auto-complete window goes away when you’re done
let g:ycm_autoclose_preview_window_after_completion=1

"defines a shortcut for goto definition.
map <leader>g  :YcmCompleter GoToDefinitionElseDeclaration

let python_highlight_all=1

" C filetype detection
augroup project
    autocmd!
    autocmd BufRead,BufNewFile *.h,*.c set filetype=c
augroup END

" Automatic insertion of C/C++ header guards
function! s:insert_guards()
  let guard = substitute(toupper(expand("%:t")), "\\.", "_", "g")
  execute "normal! i#ifndef " . guard
  execute "normal! o#define " . guard . " "
  execute "normal! Go#endif /* " . guard . " */"
  normal! kk
endfunction
autocmd BufNewFile *.{h,hpp} call <SID>insert_guards()

" tell ycm how to compile c/c++ source code by default
let g:ycm_global_ycm_extra_conf = "/home/taha/.vim/.ycm_extra_conf.py"
let &path.="/usr/include/,/usr/local/include"

" create new tabs  {{
nnoremap <leader>t :tabnew<Enter>
" Close all except current tab
nnoremap <leader>\ :tabonly<Enter>
nnoremap <F1> :buffers<CR>:buffer<Space>
" Navigating tabs
nnoremap <leader>1 1gt
nnoremap <leader>2 2gt
nnoremap <leader>3 3gt
nnoremap <leader>4 4gt
nnoremap <leader>5 5gt
nnoremap <leader>6 6gt
nnoremap <leader>7 7gt
nnoremap <leader>8 8gt
nnoremap <leader>9 9gt
"Previous and next window
nnoremap <leader>w gt
nnoremap <leader>W gT
" }}
