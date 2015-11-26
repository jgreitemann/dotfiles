set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
"Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
"Plugin 'L9'
" Git plugin not hosted on GitHub
"Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
"Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
"Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Avoid a name conflict with L9
"Plugin 'user/L9', {'name': 'newL9'}

" My plugins
Plugin 'bling/vim-airline'
Plugin 'airblade/vim-gitgutter'
Plugin 'guns/xterm-color-table.vim'
Plugin 'majutsushi/tagbar'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

if $COLORTERM == 'gnome-terminal'
  set t_Co=256
endif

" General settings
syntax on
set background=dark
set scrolloff=999
set tabstop=4
set shiftwidth=4
set expandtab
autocmd FileType make setlocal noexpandtab

" Custom keybindings
nmap <F8>  :TagbarToggle<CR>
nmap <F9>  :tabp<CR>
nmap <F10> :tabn<CR>

" Gutter
set nu
set rnu
highlight LineNr ctermfg=darkgrey
let g:gitgutter_sign_column_always = 1

" 80 character highlight
highlight ColorColumn ctermbg=235
let &colorcolumn=join(range(81,999),",")

" Keep swap files in separate directory
set backupdir=~/.vim/backup//
set directory=~/.vim/swap//
set undodir=~/.vim/undo//

" Run checktime in buffers, but avoiding the "Command Line" (q:) window
set updatetime=1000 "1 sec"
au CursorHold,CursorHoldI * silent! checktime
