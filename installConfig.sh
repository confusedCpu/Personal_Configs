#!/bin/bash

# Install pathogen.vim
	mkdir -p ~/.vim/autoload ~/.vim/bundle && \
		curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim
# Install fugitive.vim
	cd ~/.vim/bundle
	git clone git://github.com/tpope/vim-fugitive.git
	vim -u NONE -c "helptags vim-fugitive/doc" -c q
	git clone https://github.com/vim-airline/vim-airline-themes

# Install vim-gitgutter
	git clone git://github.com/airblade/vim-gitgutter.git

# Install 
	git clone https://github.com/tpope/vim-fugitive

# Install NERDTree
	git clone https://github.com/scrooloose/nerdtree

# Install 
