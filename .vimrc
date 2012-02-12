set clipboard=unnamed					" Universal clipboard
"set clipboard=autoselect
set mouse=a
set cindent
"set cinkeys=0{,0},0),:,!^F,o,O,e
"set cinoptions=>s,e0,n0,f0,{0,}0,^0,:s,=s,ps,t0,c4,C1,/0,+s,(2s,us,)20,*30,gs,hs
set smartindent
set ai							" Auto-indenting
set incsearch 	" incremental search
set ignorecase
set smartcase "don't ignore case if we explicitly searc for upper case char 
set scrolloff=2 "always 2 lines of context visible around the cursor
set wildmode=longest,list
"set nowrap
"-
set nobackup						" Turn backups off
"set backupext="~"					" Append `.bak' to backups
"set backupdir="~/tmp/"					" Directory to save backups in
"set redraw
set bufhidden=delete
set showmatch
"set textwidth=80					" Wordwrap
"set shiftwidth=4
set noerrorbells					" No error bells
set magic
set showmode
"set notitle
set ttyfast						" Smoother scrolling
set more						" Use more instead of flooding screen
"set tabstop=8
"tab
set tabstop=2
set expandtab
set sw=2
" backslash m/M/l
map \M <Esc>:set noexpandtab tabstop=8 shiftwidth=8<CR>
map \m <Esc>:set expandtab tabstop=2 shiftwidth=2<CR>
map \l <Esc>:set expandtab tabstop=4 shiftwidth=4<CR>
"endtab
set hidden						" permet de switcher entre les buffer sans sauver le buffer
							" et de sauvegarder
							" les undo
set showcmd
set mat=1
set viminfo=%,'50,\"100,:100,n~/.viminfo		" Options we want for ruler
set linebreak						" For when we have wrapping on
set number						" Show line numbers
set ruler						" Turn on ruler
set bs=indent,eol,start					" Backspacing over everything
set hls							" Highlight search patterns
set ic							" Case-insensitive searches
set shm+=I						" No start up message
set sm							" Show bracket match
set mat=1						" Bracket match highlight time
set dir=/tmp						" Temp dir
set nocp
"set compatible?
" set number format to hexa, (for use with Ctrl-A and Ctrl-X)
set nf=hex
syntax on						" Turn on syntax
filetype plugin indent on
so $VIMRUNTIME/syntax/syntax.vim			" Load filetypes for syntax highlighting

set foldmethod=indent   "fold based on indent
set foldnestmax=5      "deepest fold is 10 levels
set nofoldenable        "dont fold by default
set foldlevel=1         "this is just what i use

"GLSL syntax
au BufNewFile,BufRead *.frag, *.vert, *.fp, *.vp, *.glsl setf glsl

" buffer next/prev
map <C-n> :bn<CR>
map <C-p> :bp<CR>

" jptemplate
let g:jpTemplateKey='<C-A>'

" highlight trailing whitespaces
let c_space_errors=1

"-----------------------------------------------------------------------------------------
"   Key bidings
"-----------------------------------------------------------------------------------------

" NERDTree, map F3 to toggle for all modes
nnoremap <silent> <F3> :NERDTreeToggle<Cr> 

nnoremap <silent> <F4> :TlistToggle<Cr>

let Tlist_Show_One_File = 1
let Tlist_Use_Right_Window = 1
let NERDTreeMapActivateNode='<CR>'

map <silent> <C-k><C-m> :tabnext<Cr>
map <silent> <C-k><C-l> :tabprev<Cr>

"json tidy/compact using JSON::XS from CPAN
command JSONtidy  %!json_xs -f json -t json-pretty
command JSONcompact %!json_xs -f json -t json

map ,v :sp ~/.vimrc<CR><C-W>
map <silent> ,V :source ~/.vimrc<CR>:filetype detect<CR>:exe ":echo 'vimrc reloaded'"<CR>

" use 'hexedit' to switch to hexadecimal editor. 'hexedit -r' to switch back
" to normal
ca hexedit %!xxd 

"-----------------------------------------------------------------------------------------
"   Colors, fonts & gui
"-----------------------------------------------------------------------------------------

"if has ('gui_running')
"  colorscheme fruidle_black
"else
"  colorscheme desert
"endif
colorscheme fruidle_custom
"colorscheme desert

"colorscheme default
"colorscheme sienna

"set guifont=Bitstream\ Vera\ Sans\ Mono\ 9
"set guifont=Monaco\ 10
set guifont=Monospace\ 9
set guioptions-=T

"highlight cursor line
set cursorline

set t_vb=


" Eclim settings
"let g:EclimBrowser="firefox"
"let g:EclimJavaSrcValidate=1
"let g:EclimMakeLCD=1
"
"--------------
"Fast .h/.cpp switch
"--------------
function! SwitchSourceHeader()
  "update!
  let ext = expand("%:e")
  if (ext == "cpp" || ext == "cc")
    find %:t:r.h
  else
    ""Try cpp first and cc then
    try
      find %:t:r.cpp
    catch /E345:/
      find %:t:r.cc
    endtry
  endif
endfunction

nmap ,s :call SwitchSourceHeader()<CR>

" map :cn and :cp to simply cn and cp to easily browse through errors
map cn <esc>:cn<cr>
map cp <esc>:cp<cr>

" map F5 to :make and make it go back to the main window
map <F5> :make<cr><c-w><up>

" CS Approx for terminal better colorscheme support
" see : http://vim.wikia.com/wiki/Using_GUI_color_settings_in_a_terminal
"
" IMPORTANT: Uncomment one of the following lines to force
" using 256 colors (or 88 colors) if your terminal supports it,
" but does not automatically use 256 colors by default.
"set t_Co=256
"set t_Co=88
let g:CSApprox_attr_map = { 'bold' : 'bold', 'italic' : '', 'sp' : '' }

" highlight column 80
set colorcolumn=81
highlight colorcolumn ctermbg=darkgrey guibg=darkgrey

" % Will match html tags
"let loaded_matchit=1

" load _vimrc from current directory
" set exrc
" FIXME: Loading pathogen makes filetype detection malfunction (detects
" c++/python as 'conf')
"call pathogen#infect()

"au BufWritePost *.coffee silent CoffeeMake! -b | cwindow | redraw!
