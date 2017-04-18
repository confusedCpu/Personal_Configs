"Adds support for pathogen plug-in manager

execute pathogen#infect()
syntax on
filetype plugin indent on

"Adds NERDTree functionality
"	Auto launch NERDTree if no file is slected

	autocmd StdinReadPre * let s:std_in=1
	autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

"	Auto launches NERDTree on Vim startup

"	autocmd vimenter * NERDTree

"	Keyboard shortcut to open NERDTree

	map <C-n> :NERDTreeToggle<CR>
