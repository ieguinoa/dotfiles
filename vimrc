 "############# Vundle
set nocompatible              " required
filetype off                  " required


" START - Setting up Vundle - the vim plugin bundler
let iCanHazVundle=1
let vundle_readme=expand('~/.vim/bundle/Vundle.vim/README.md')
if !filereadable(vundle_readme)
  echo "Installing Vundle.."
  echo ""
  silent !mkdir -p ~/.vim/bundle
  silent !git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
  let iCanHazVundle=0
endif
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim/
call vundle#rc()




" Install with :VundleInstall
" to remove just remove the line and run :PluginClean
call vundle#begin('~/.vim/bundle')
" let Vundle manage Vundle, required
" add all your plugins here (note older versions of Vundle
" used Bundle instead of Plugin)
Plugin 'gmarik/Vundle.vim'
Plugin 'tmhedberg/SimpylFold'
Plugin 'vim-scripts/indentpython.vim'
Plugin 'dense-analysis/ale'
" this plugin requires compiling, you will get an error about YCM server
" restart at first. 
" check https://github.com/ycm-core/YouCompleteMe for compiling instructions
Plugin 'Valloric/YouCompleteMe'
Plugin 'severin-lemaignan/vim-minimap'
Plugin 'Yggdroot/indentLine'
Plugin 'matze/vim-move'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'vim-ctrlspace/vim-ctrlspace'
Plugin 'scrooloose/nerdcommenter'
call vundle#end()


" install any new plugins listed in vundle section
if iCanHazVundle == 0
    echo "Installing Bundles, please ignore key map error messages"
    echo ""
    :PluginInstall
endif   




execute pathogen#infect()


" install vim-plug (small vim plugin manager)
if empty(glob('~/.vim/autoload/plug.vim'))
	  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
	      \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
    endif

" Install with :PlugInstall
call plug#begin('~/.vim/plugged')
" Put your plugins here.
Plug 'tpope/vim-unimpaired'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'scrooloose/nerdtree'
Plug 'mg979/vim-visual-multi', {'branch': 'master'}
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
call plug#end()


" use :FormatJSON to reformat file to human readable json
com! FormatJSON %!python -m json.tool

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
"let b:SimpylFold_fold_docstring	= 2
"let g:SimpylFold_fold_import = 1
"let b:SimpylFold_fold_import = 1

"set foldmethod=syntax

" NERDTree shourtcuts
" Use ctrl+p to open and close NERDTree file tree
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

nnoremap <C-t> :FZF<Cr>
nnoremap <C-r> :Rg<Cr>



" toggle on/off with :IndentLinesToggle
" to smooth the lines patch the font following guide in https://github.com/Yggdroot/indentLine
let g:indentLine_char = '┆'



" copy/cut/paste/...  stuff
" while in visual mode: copy and switch to insert mode 
"vmap <C-c> y<Esc>i
"" while in visual mode cut and switch to insert mode
"vmap <C-x> d<Esc>i
"" while in instert 
"imap <C-v> <Esc>pi
"imap <C-y> <Esc>ddi
"map <C-z> <Esc>
"imap <C-z> <Esc>ui

" vim-move 
" use shift + arrows to move lines (or blocks using visual mode select) of text up and down
let g:move_key_modifier = 'C-s'

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


" display minimap of the file on the right side
noremap mm :Minimap<CR>
" close minimap using mc
let g:minimap_close='mc'

" resize split windows, keep pressed Ctrl+Shift and arrow
"noremap <silent> <C-s-h> :vertical resize +1<CR>
"noremap <silent> <C-s-l> :vertical resize -1<CR>
"noremap <silent> <C-s-j> :res -1<CR>
"noremap <silent> <C-s-k> :res +1<CR>

" use ctrl+s to save
"nmap <c-s> :w<CR>
"imap <c-s> <Esc>:w<CR>a


" map commands to comment lines/blocks 
noremap <silent> cc :call NERDComment("cc","Toggle")<CR>
"noremap <silent> cs :call NERDComment("cs","Sexy")<CR>
"noremap <silent> cl :call NERDComment("cl","AlignLeft")<CR>
"noremap <silent> ce :call NERDComment("ce","ToEOL")<CR>
":TCommentBlock
":set hlsearch
":set expandtab
":set tabstop=4
":set softtabstop=4
":set shiftwidth =4

" Use Ctrl + left/right arrows to move around the tabs within VIM
"nnoremap <C-Left> :tabprevious<CR>
"nnoremap <C-Right> :tabnext<CR>
"
"
"" Use Ctrl + left/right arrows to move around the tabs within VIM
"nnoremap <C-Left> :tabprevious<CR>
"nnoremap <C-Right> :tabnext<CR>
"
"
"nnoremap <Tab> >>_
"nnoremap <S-Tab> <<_
"inoremap <S-Tab> <C-D>
"vnoremap <Tab> >gv
"vnoremap <S-Tab> <gv

" gv can reselect the lines last selected with visual mode
"

" move to end of last nonblank char of the line and switch to insert mode     
"map <C-e> g_i
"map <C-w> ^
"map ^ ^i
"map $ $i
"map <S-a> g_i

" delete until end of line
noremap <C-d> d$i 
inoremap <C-d> <Esc>d$i


" Mappings from vim-visual-multi
" https://github.com/mg979/vim-visual-multi/wiki/Mappings
let g:VM_maps = {}
let g:VM_maps["Add Cursor Down"]='<C-Down>'
let g:VM_maps["Add Cursor Up"]='<C-Up>'
let g:VM_maps["Select h"]           = '<C-Left>'
let g:VM_maps["Select l"]           = '<C-Right>'
"let g:VM_maps["Toggle Mappings"]    = '<Space>'
"C-c and up and down arrows to create cursos in multiple lines. then $ to move the cursors to end of line
"C-n: selects the current word, if I keep hitting C-n it selects the next occurence of that word, ideal for replacing a subset of occurences of a word



nmap <F8> :TagbarToggle<CR>
set updatetime=500


"https://github.com/dense-analysis/ale
let g:ale_sign_column_always = 0

" cheatsheet
" d$ = delete until end of line
" d0 = delete until beginning of line
" diw = delete the word you are currently on (even if you are in the middle of
" the word)
" ciw = same as diw but switches to insert afterwards (=change current word)
" dw = /delete next word
" dt{character} = deletes until first character occurence
" d/{word}+enter = deletes until next ocurrence of that word
"
" using C-w would conflict with switching between file list and window
"noremap <C-w> dwi 
"inoremap <C-w> <Esc>dwi
source ~/.vscoderc
