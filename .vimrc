"Runs Pathogen package manager on vim start	
	execute pathogen#infect()
"CORE FUNCTIONALITY
"	Sets syntax highlighting
		syntax on
"	Sets filetype differentiators
		filetype plugin indent on
"	Sets line wrapping if it gets too long
		set wrap
"	Sets line numbers
		set number
"	Sets logical line numbers for wrapped tex
"		set relativenumber
"	Sets number of spaces used with tab
		set tabstop=4
"	Sets existing Tabs to a number of spaces
		set shiftwidth=4
"   Makes backspace treat four sequential Spaces as a single character
        set softtabstop=4
"	Sets Tab to Spaces
		set expandtab
"	Automatically changes Tabs to Spaces when file is opened
		retab
"	
"NERDTree
"	Auto launch NERDTree if no file is slected
		autocmd StdinReadPre * let s:std_in=1
		autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
"	Auto launches NERDTree on Vim startup
"		autocmd vimenter * NERDTree
"	Keyboard shortcut to open NERDTree
		map <C-n> :NERDTreeToggle<CR>
"VIM-AIRLINE
"	Sets on by default
		"let laststatus = 2
"	Sets smartbar on by default <false = 0; true = 1>
		"let g:airline#extensions#tabline#enabled = 1 
"	Sets vim-airline theme <favorite: murmur, *16>
		"let g:airline_theme_theme='murmur'
"	Auto-populate the 'g:airline_symblos' directoy
		"let g:airline_powerline_fonts = 1		
"VIM-GITGUTTER
"	Sets the update time for the automatic git diff
		set updatetime=250
"	Sets the git diff sign column to always on
		let g:gitgutter_sign_column_always = 1
"	Sets on by default
		let g:gitgutter_enabled = 1
"	Sets diff line highlighting by default
		let g:gitgutter_lighlight_lines = 1
"File Type Macros

"	inobindsysm: only available in 'insert mode'
"	<bash>
"		inobindsym ;#! 
"	<C/C++>
"	<HTML>
"		inobindsym ;p <p><Space></p><Esc>
"	<SQL>
"		inobindsym sql ;s SELECT<Space>
"	<Python>
"	<Rust>
