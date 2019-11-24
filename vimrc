" ############# Vundle
set nocompatible              " required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim


" Install with :VundleInstall
" to remove just remove the line and run :PluginClean
call vundle#begin('~/.vim/bundle')
" let Vundle manage Vundle, required
" add all your plugins here (note older versions of Vundle
" used Bundle instead of Plugin)
Plugin 'gmarik/Vundle.vim'
Plugin 'tmhedberg/SimpylFold'
Plugin 'vim-scripts/indentpython.vim'
Plugin 'Valloric/YouCompleteMe'
Plugin 'severin-lemaignan/vim-minimap'
Plugin 'Yggdroot/indentLine'
Plugin 'matze/vim-move'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'vim-ctrlspace/vim-ctrlspace'
call vundle#end()

execute pathogen#infect()

" Install with :PlugInstall
call plug#begin('~/.vim/plugged')
" Put your plugins here.
Plug 'tpope/vim-unimpaired'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'scrooloose/nerdtree'
call plug#end()


" use :FormatJSON to reformat file to human readable json
com! FormatJSON %!python -m json.tool

syntax on


" set filetype + plugin + indent 
filetype plugin indent on


set rtp+=~/.fzf

" vim split windows
set splitbelow
set splitright

"nnoremap <silent> <C-Right> <c-w>l
"nnoremap <silent> <C-Left> <c-w>h
"*** this one clash with ctrl-up of "nnoremap <silent> <C-Up> <c-w>k
"nnoremap <silent> <C-Down> <c-w>j

"move to split below
nnoremap <C-J> <C-W><C-J>
" move to split above
nnoremap <C-K> <C-W><C-K>
" move to split to the right
nnoremap <C-L> <C-W><C-L>
" move to split to the left
nnoremap <C-H> <C-W><C-H>

"simplyfold
" zc to close a fold and zo to open one
"set foldmethod=indent
"let g:SimpylFold_docstring_preview = 1 " do not fold it by default
"let g:SimpylFold_fold_docstring	= 1 
"let b:SimpylFold_fold_docstring	= 1
"let g:SimpylFold_fold_import = 1
"let b:SimpylFold_fold_import = 1

"set foldmethod=syntax

" NERDTree shourtcuts
nmap <C-o> :NERDTreeToggle<CR>
"nmap <C-l> :NERDTreeFind<CR>
"t: Open the selected file in a new tab
"i: Open the selected file in a horizontal split window
"s: Open the selected file in a vertical split window
"I: Toggle hidden files
"m: Show the NERD Tree menu 
"      ma: create a new file in the location where  the cursor is
"      md: delete  file where the cursor is
"R: Refresh the tree, useful if files change outside of Vim
"?: Toggle NERD Tree's quick help

" toggle on/off with :IndentLinesToggle
" to smooth the lines patch the font following guide in https://github.com/Yggdroot/indentLine
let g:indentLine_char = '┆'

" while in visual mode: copy and switch to insert mode 
vmap <C-c> y<Esc>i
" while in visual mode cut and switch to insert mode
vmap <C-x> d<Esc>i
" while in instert 
imap <C-v> <Esc>pi
imap <C-y> <Esc>ddi
map <C-z> <Esc>
imap <C-z> <Esc>ui

" vim-move 
" use shift + j or k to move blocks of text up and down
let g:move_key_modifier = 's'


" Ctrl-d: delete rest of line and switch to insert mode
" Default shortcuts
" Ctrl-d: delete rest of line and stay in normal mode
"
:set number
syntax enable
set background=dark
let g:solarized_termcolors=256
"colorscheme solarized
"colorscheme afterglow
let g:gruvbox_termcolors=256
"colorscheme gruvbox
"let g:alduin_termcolors=256
"colorscheme alduin
"let g:vimdeus_termcolors=256
colorscheme vimdeus

set nocompatible
set hidden

let g:airline_powerline_fonts = 1
"let g:airline#extensions#branch#enabled = 1
let g:airline_theme='powerlineish'

set foldlevel=99
nnoremap <space> za

highlight BadWhitespace ctermbg=red guibg=red
au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/



" resize split windows, keep preset Ctrl+Shift and arrow
noremap <silent> <C-S-Left> :vertical resize +1<CR>
noremap <silent> <C-S-Right> :vertical resize -1<CR>
noremap <silent> <C-S-Down> :res -1<CR>
noremap <silent> <C-S-Up> :res +1<CR>
