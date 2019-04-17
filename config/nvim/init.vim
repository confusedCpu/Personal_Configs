""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""" Dein
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if &compatible
  set nocompatible
endif

" Add the dein installation directory into runtimepath
set runtimepath+=~/.local/share/dein/repos/github.com/Shougo/dein.vim


" Run this after making changes
" :call dein#install

if dein#load_state('~/.local/share/dein')
  call dein#begin('~/.local/share/dein')
  call dein#add('~/.local/share/dein/repos/github.com/Shougo/dein.vim')

  call dein#add('yggdroot/indentline')
  call dein#add('scrooloose/nerdtree')
  call dein#add('neomake/neomake')
  call dein#add('raimondi/delimitmate')
  call dein#add('rust-lang/rust.vim')
  call dein#add('klen/python-mode')
  call dein#add('~/.local/share/dein/repos/github.com/python-mode/plugin/pymode.vim')

  "Deoplete
  call dein#add('Shougo/deoplete.nvim')
  if !has('nvim')
    call dein#add('roxma/nvim-yarp')
    call dein#add('roxma/vim-hug-neovim-rpc')
  endif

  call dein#end()
  call dein#save_state()
endif

  "Deoplete Completion
  call dein#add('Shougo/deoplete-clangx')
  call dein#add('sebastianmarkow/deoplete-rust')
  call dein#add('deoplete-plugins/deoplete-jedi')

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""" General
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
filetype plugin indent on
syntax enable

set number 
set relativenumber
set laststatus=2
set showtabline=2
set noshowmode
set splitbelow
set splitright

" If make file then adjust spacing for compatability
if &filetype ==# 'make'
    set tabstop=8
    set shiftwidth=8
    set softtabstop=0
    set noexpandtab
else
    " Tell vim to interperet a \t as having a character width of X
    set tabstop=4
    " Sets indent character width to X
    set shiftwidth=4
    " Sets the number of columns consumed by a tab
    set softtabstop=4
    " Convert tabs to spaces
    set expandtab
endif

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""" Keybindings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Split navigation
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap 


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""" Deoplete General
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:deoplete#enable_at_startup = 1

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""" Deoplete Clangx
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
call deoplete#custom#var('clangx', 'clang_binary', '/usr/local/bin/clang')
call deoplete#custom#var('clangx', 'default_c_options', '')
call deoplete#custom#var('clangx', 'default_cpp_options', '')

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""" Deoplete Jedi
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:deoplete#sources#jedi#statement_length = 80
let g:deoplete#sources#jedi#enable_typeinfo = 1
let g:deoplete#sources#jedi#show_docstring = 1
" let g:deoplete#sources#jedi#extra_path = ''
let g:deoplete#sources#jedi#ignore_errors = 0

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""" Deoplete Rust
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:deoplete#sources#rust#racer_binary='~/.cargo/bin/racer'
let g:deoplete#sources#rust#rust_source_path='~/.local/src/rust/src'
let g:deoplete#sources#rust#show_duplicates=1
let g:deoplete#sources#rust#documentation_max_height=20

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""" Syntastic
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
"set statusline+=%*

"let g:syntastic_always_populate_loc_list = 1
"let g:syntastic_auto_loc_list = 1
"let g:syntastic_check_on_open = 1
"let g:syntastic_check_on_wq = 0

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""" Nerd Tree
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Open NerdTree if no file specified
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" Open NerdTree if on dir
autocmd StdinReadPre * let s:std_in=1 autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif

" Toggle NerdTree
map <C-n> :NERDTreeToggle<CR>

" Change default arrows
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""" Powerline
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:powerline_pycmd="py3"
set rtp+=${HOME}/.local/lib/python3.7/site-packages/powerline/bindings/vim
python from powerline.vim import setup as powerline_setup
python powerline_setup()
python del powerline_setup
