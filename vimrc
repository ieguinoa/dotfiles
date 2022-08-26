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
Plugin 'nvie/vim-flake8'
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
Plugin 'davidhalter/jedi-vim'
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
:set splitright

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

" Find files by fuzzy search of names/paths
nnoremap <C-f> :FZF<Cr>
" Find files by ripgrepping the content
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
"vmap <C-S-Down') '<Plug>MoveBlockDown'
"vmap s:MoveKey('Up') '<Plug>MoveBlockUp'
"vmap s:MoveKey('Left') '<Plug>MoveBlockLeft'
"vmap s:MoveKey('Right') '<Plug>MoveBlockRight'
"
"nmap s:MoveKey('Down') '<Plug>MoveLineDown'
"nmap s:MoveKey('Up') '<Plug>MoveLineUp'
"nmap s:MoveKey('Left') '<Plug>MoveCharLeft'
"nmap s:MoveKey('Right') '<Plug>MoveCharRight'



" Ctrl-d: delete rest of line and switch to insert mode
" Default shortcuts
" Ctrl-d: delete rest of line and stay in normal mode
"
":set number
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

":setl tw=100
"autocmd FileType python :set colorcolumn=100

" Youcompleteme settings
highlight BadWhitespace ctermbg=red guibg=red
au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/
" also defined ~/tox.ini with max-line-length = 100

" vim-flake8 settings
let g:flake8_show_in_file=0
"autocmd BufWritePost *.py call flake8#Flake8()
let g:flake8_show_in_gutter=0  " show


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
"noremap <silent> cc :call NERDComment("cc","Toggle")<CR>
noremap <silent> cc :call nerdcommenter#Comment("cc","Toggle")<CR>
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


"add side bar with list of tags (e.g python class and functions)
nmap <F8> :TagbarToggle<CR>
set updatetime=500


"https://github.com/dense-analysis/ale
let g:ale_sign_column_always = 0


"let g:ycm_disable_signature_help = 1
"let g:ycm_add_preview_to_completeopt = 1
"let g:ycm_autoclose_preview_window_after_completion = 1
"let g:ycm_autoclose_preview_window_after_insertion = 1
"let g:ycm_key_list_stop_completion = ['<C-y>', '<CR>']
"let g:ycm_semantic_triggers = {
	"\   'python': [ 're!\w{2}' ]
	"\ }
let g:ycm_auto_trigger=0

"jedi plugin config
"let g:pymode_rope = 0
"let g:pymode_folding=0
"let g:jedi#show_call_signatures = "0"
"let g:jedi#popup_select_first = 0
"let g:jedi#completions_command = "<Tab>"
"let g:jedi#popup_on_dot = 0
"let g:jedi#completions_enabled = 0
set completeopt-=preview

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
"
noremap <C-h> <C-w>left
noremap <C-j> <C-w>up
noremap <C-k> <C-w>down
noremap <C-l> <C-w>right
:nnoremap <F5> :buffers<CR>:buffer<Space>


:set hlsearch
" Clear highlighting on double escape in normal mode
"nnoremap <esc><esc> :noh<return>
"nnoremap <esc> :noh<return><esc>
"nnoremap <esc>^[ <esc>^[
source ~/.vscoderc




:set number relativenumber
:set nu rnu
" C-t  toggles on-off the numbering and indentation symbols
" Use this before copy-pasting 
nnoremap <C-t> :set number! relativenumber!<CR> :IndentLinesToggle <CR>
"<CR> :set number!<CR>
"


" SELECT A BLOCK WITH VISUAL MODE AND EXECUTE PYTHON ON IT USING \[
: vnoremap <silent> <leader>[ :w ! python3<CR>
: nnoremap <silent> <leader>[[ :%w ! python3<CR>
: vnoremap <silent> <leader>] :Tyank<CR>
: vnoremap <silent> <leader>] :Twrite bottom<CR>


"Open terminal options
"noremap <C-d> :sh<cr>
"map <C-z> :sh<Cr>

 "open terminal mode vim 
noremap tt :term bash<CR>
"Exit from it
tnoremap <C-z> <C-w>:q!<CR>
"Change to "readable buffer" mode, where the terminal text is just a buffer
"You can go back to terminal mode with just  i
tnoremap <C-x> <C-\><C-N>  
tnoremap <C-d> <C-\><C-N>  

" Ctrl + z   -> open shell
" Ctrl + d   -> return to vim

