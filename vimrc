set nocompatible               " be iMproved
filetype off                   " required!

call vundle#rc()

Plugin 'airblade/vim-gitgutter'
Plugin 'altercation/vim-colors-solarized'
Plugin 'austintaylor/vim-indentobject'
Plugin 'juvenn/mustache.vim'
Plugin 'leafgarland/typescript-vim'
Plugin 'majutsushi/tagbar'
Plugin 'garbas/vim-snipmate'
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'tomtom/tlib_vim'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'nono/vim-handlebars'
Plugin 'pangloss/vim-javascript'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/syntastic'
Plugin 'slim-template/vim-slim'
Plugin 'tpope/vim-rails'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-vividchalk'
Plugin 'eventualbuddha/vim-protobuf'
Plugin 'vim-ruby/vim-ruby'
Plugin 'vim-scripts/Align'
Plugin 'elixir-lang/vim-elixir'

filetype plugin indent on     " required!

syntax on

set autoread
set backspace=2
set backupcopy=yes
set clipboard=unnamed
set directory-=.
set encoding=utf-8
set expandtab
set ignorecase
set incsearch
set laststatus=2
set number
set ruler
set scrolloff=3
set shiftwidth=2
set showcmd
set smartcase
set softtabstop=2
set tabstop=8
set wildignore=log/**,node_modules/**,target/**,tmp/**,*.rbc
set wildmenu
set wildmode=longest,list,full

set cc=80,120
