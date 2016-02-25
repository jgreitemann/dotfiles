" --- VUNDLE ---
set nocompatible     " be iMproved, required
filetype off         " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" Operators, motions, and text objects
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-commentary'
Plugin 'vim-scripts/ReplaceWithRegister'
Plugin 'kana/vim-textobj-user'
Plugin 'kana/vim-textobj-indent'
Plugin 'kana/vim-textobj-line'

" Git support
Plugin 'airblade/vim-gitgutter'
Plugin 'tpope/vim-fugitive'

" Color
Plugin 'guns/xterm-color-table.vim'
Plugin 'nanotech/jellybeans.vim'

" Language support
Plugin 'majutsushi/tagbar'
Plugin 'derekwyatt/vim-scala'
Plugin 'rust-lang/rust.vim'

 " Misc
Plugin 'itchyny/lightline.vim'
Plugin 'christoomey/vim-system-copy'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" see :h vundle for more details or wiki for FAQ
" --- END VUNDLE ---

if !has('gui_running')
  set t_Co=256
endif


" General settings
syntax on
set background=dark
set scrolloff=999
set incsearch
let g:tagbar_autoclose = 1


" GVim
set guifont=Source\ Code\ Pro\ 11


" Configure lightline
set laststatus=2
let g:lightline = {
    \ 'colorscheme': 'jellybeans',
    \ 'active': {
    \   'left': [ ['mode', 'paste'],
    \             ['fugitive', 'readonly', 'filename', 'modified' ] ]
    \ },
    \ 'component': {
    \   'fugitive' : '%{exists("*fugitive#head")?fugitive#head():""}',
    \ },
    \ 'component_visible_condition': {
    \   'fugitive': '(exists("*fugitive#head") && ""!=fugitive#head())'
    \ }
    \ }
set noshowmode


" Indentation
set tabstop=4
set shiftwidth=4
set expandtab
autocmd FileType make setlocal noexpandtab


" Custom keybindings
nmap <F8>  :TagbarOpen f<CR>
nmap <F9>  :tabp<CR>
nmap <F10> :tabn<CR>
" Disable arrow keys
inoremap  <Up>     <NOP>
inoremap  <Down>   <NOP>
inoremap  <Left>   <NOP>
inoremap  <Right>  <NOP>
noremap   <Up>     <NOP>
noremap   <Down>   <NOP>
noremap   <Left>   <NOP>
noremap   <Right>  <NOP>


" Gutter
set nu
set rnu
highlight LineNr ctermfg=darkgrey
let g:gitgutter_sign_column_always = 1


" Background colors

" Highlight trailing whitespaces
autocmd ColorScheme * highlight TrailingWhitespace ctermbg=red
colorscheme jellybeans
highlight Normal ctermbg=234
highlight ColorColumn ctermbg=233
let &colorcolumn=join(range(81,999),",")
autocmd FileType * match TrailingWhitespace /\s\+$/
autocmd FileType tex highlight clear ColorColumn
autocmd FileType tex highlight clear CursorLine

" Highlight current line
highlight CursorLine cterm=NONE ctermbg=236
set cursorline


" Keep swap files in separate directory
set backupdir=~/.vim/backup//
set directory=~/.vim/swap//
set undodir=~/.vim/undo//


" Run checktime in buffers, but avoiding the "Command Line" (q:) window
set updatetime=1000 "1 sec"
au CursorHold,CursorHoldI * silent! checktime


" Delete trailing whitespaces
" fun! <SID>StripTrailingWhitespaces()
"     let l = line(".")
"     let c = col(".")
"     %s/\s\+$//e
"     call cursor(l, c)
" endfun
" autocmd BufWritePre * :call <SID>StripTrailingWhitespaces()
