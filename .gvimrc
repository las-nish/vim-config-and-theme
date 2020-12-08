" Lasan Nishshanka
" 24 October 2020 @ 11:14 P.M.

" -------------- "
" ---- Note ---- "
" -------------- "

" Install Airline : sudo apt-install vim-airline ( Status Bar - On Linux )
" Plugin Manager : https://github.com/junegunn/vim-plug

" -------------- "
" ---- Help ---- "
" -------------- "

" CTRL + F               -> Find Dialog
" CTRL + H               -> Replace Dialog
" CTRL + TAB             -> Next Window
" CTRL + A               -> Select All
" CTRL + C               -> Copy
" CTRL + V               -> Paste
" CTRL + X               -> Cut
" CTRL + Z               -> Undo
" CTRL + SHIFT + Y       -> Redo
" CTRL + SHIFT + W       -> Wordwrap ( Enable / Disable )


" =============== Custom commands =============== "

" Install Custom Plugins
call plug#begin()
	Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
	Plug 'ayu-theme/ayu-vim'
	Plug 'gruvbox-community/gruvbox'
	Plug 'vim-scripts/AutoComplPop'
	Plug 'srcery-colors/srcery-vim'
	Plug 'xolox/vim-misc'
	Plug 'xolox/vim-session'
call plug#end()

set termguicolors     " enable true colors support

" -------------
" Gruvbox Theme
" -------------

" colorscheme gruvbox
" set bg=dark
" let g:gruvbox_contrast = medium
" colorscheme gruvbox

" ---------
" Ayu Theme
" ---------

" let ayucolor="light"  " for light version of theme
" let ayucolor="mirage" " for mirage version of theme
" let ayucolor="dark"   " for dark version of theme
" colorscheme ayu

" ------------
" Srcery Theme ( By Default )
" ------------

colorscheme srcery

" ---------
" NERD Tree
" ---------

let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'

let g:NERDTreeChDirMode=2
let g:NERDTreeShowBookmarks=1
let g:nerdtree_tabs_focus_on_files=1
let g:NERDTreeMapOpenInTabSilent = '<RightMouse>'

autocmd VimEnter * :NERDTree

" ------------------
" Vim-Session Plugin
" ------------------

let g:session_autoload = 'yes'
let g:session_autosave = 'yes'
let g:session_autosave_to = 'default'
let g:session_verbose_messages = 0

set nobackup
set noswapfile
set noundofile

" Disable scrollbars (real hackers don't use scrollbars for navigation!)
" set guioptions-=r
" set guioptions-=R
set guioptions-=l
set guioptions-=L

" Invert
" set invlist

" Height of the command bar
set cmdheight=1

"Always show current position
set ruler

" Turn on the Wild menu
set wildmenu
set wildmode=list:longest,full

set guioptions-=m  "menu bar
set guioptions-=T  "toolbar
set number
":highlight LineNr guifg=#005D57 " Line Number Color Change

" Delete trailing white space on save, useful for some filetypes ;)
fun! CleanExtraSpaces()
let save_cursor = getpos(".")
let old_query = getreg('/')
silent! %s/\s\+$//e
call setpos('.', save_cursor)
call setreg('/', old_query)
endfun

if has("autocmd")
autocmd BufWritePre *.txt,*.js,*.py,*.wiki,*.sh,*.coffee,*.c,*.h,*.asm,*.s :call CleanExtraSpaces()
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Git gutter (Git diff)
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:gitgutter_enabled=0
nnoremap <silent> <leader>d :GitGutterToggle<cr>

""""""""""""""""""""""""""""""
" => Status line
""""""""""""""""""""""""""""""
" Always show the status line
set laststatus=2

" Format the status line
set statusline=\ %{HasPaste()}%F%m%r%h\ %w\ \ CWD:\ %r%{getcwd()}%h\ \ \ Line:\ %l\ \ Column:\ %c

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Text, tab and indent related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Use spaces instead of tabs
set expandtab

" Be smart when using tabs ;)
set smarttab

" 1 tab == 4 spaces
set shiftwidth=4
set tabstop=4
set autoindent
set noexpandtab

" Linebreak on 500 characters
set lbr
set tw=500

set ai "Auto indent
set si "Smart indent
set wrap "Wrap lines

" Toggle F1, F2, F3
nnoremap <C-F1> :if &go=~#'m'<Bar>set go-=m<Bar>else<Bar>set go+=m<Bar>endif<CR>
nnoremap <C-F2> :if &go=~#'T'<Bar>set go-=T<Bar>else<Bar>set go+=T<Bar>endif<CR>
nnoremap <C-F3> :if &go=~#'r'<Bar>set go-=r<Bar>else<Bar>set go+=r<Bar>endif<CR>

" Remove Splitter Bars
hi LineNr guibg=bg
set foldcolumn=2
hi foldcolumn guibg=bg
hi VertSplit guibg=bg guifg=bg

" Treeview
" let g:netrw_banner = 0
" let g:netrw_liststyle = 3
" let g:netrw_browse_split = 4
" let g:netrw_altv = 1
" let g:netrw_winsize = 25
" set guioptions-=L
" set guioptions-=S  "statusbar
" noremap <C-P>		:Vexplore<CR> " Shortcut Key
" augroup ProjectDrawer
" autocmd!
" autocmd VimEnter * :Vexplore
" augroup END

"let g:netrw_banner = 0
"noremap <C-P>		:Explore<CR> " Shortcut Key

" Autoclosing Brackets
inoremap " ""<left>
inoremap ' ''<left>
inoremap ( ()<left>
inoremap [ []<left>
inoremap { {}<left>
"inoremap < <><left>
inoremap {<CR> {<CR>}<ESC>O
inoremap {;<CR> {<CR>};<ESC>O

" Bail out if this isn't wanted.
if exists("g:skip_loading_mswin") && g:skip_loading_mswin
finish
endif

" set the 'cpoptions' to its Vim default
if 1	" only do this when compiled with expression evaluation
let s:save_cpo = &cpoptions
endif
set cpo&vim

" set 'selection', 'selectmode', 'mousemodel' and 'keymodel' for MS-Windows
behave mswin

" backspace and cursor keys wrap to previous/next line
set backspace=indent,eol,start whichwrap+=<,>,[,]

" backspace in Visual mode deletes selection
vnoremap <BS> d

if has("clipboard")
" CTRL-X and SHIFT-Del are Cut
vnoremap <C-X> "+x
vnoremap <S-Del> "+x

" CTRL-C and CTRL-Insert are Copy
vnoremap <C-C> "+y
vnoremap <C-Insert> "+y

" CTRL-V and SHIFT-Insert are Paste
map <C-V>		"+gP
map <S-Insert>		"+gP

cmap <C-V>		<C-R>+
cmap <S-Insert>		<C-R>+
endif

" Ctrl + Shift + W Word Wrap
noremap <C-S-W>		:set wrap!<CR>
vnoremap <C-S-W>		<C-C>:set wrap!<CR>
inoremap <C-S-W>		<Esc>:set wrap!<CR>gi

" Pasting blockwise and linewise selections is not possible in Insert and
" Visual mode without the +virtualedit feature.  They are pasted as if they
" were characterwise instead.
" Uses the paste.vim autoload script.
" Use CTRL-G u to have CTRL-Z only undo the paste.

if 1
exe 'inoremap <script> <C-V> <C-G>u' . paste#paste_cmd['i']
exe 'vnoremap <script> <C-V> ' . paste#paste_cmd['v']
endif

imap <S-Insert>		<C-V>
vmap <S-Insert>		<C-V>

" Use CTRL-Q to do what CTRL-V used to do
noremap <C-Q>		<C-V>

" Use CTRL-S for saving, also in Insert mode (<C-O> doesn't work well when
" using completions).
noremap <C-S>		:update<CR>
vnoremap <C-S>		<C-C>:update<CR>
inoremap <C-S>		<Esc>:update<CR>gi

" For CTRL-V to work autoselect must be off.
" On Unix we have two selections, autoselect can be used.
if !has("unix")
set guioptions-=a
endif

" CTRL-Z is Undo; not in cmdline though
noremap <C-Z> u
inoremap <C-Z> <C-O>u

" CTRL-Y is Redo (although not repeat); not in cmdline though
noremap <C-Y> <C-R>
inoremap <C-Y> <C-O><C-R>

" Alt-Space is System menu
if has("gui")
noremap <M-Space> :simalt ~<CR>
inoremap <M-Space> <C-O>:simalt ~<CR>
cnoremap <M-Space> <C-C>:simalt ~<CR>
endif

" CTRL-A is Select all
noremap <C-A> gggH<C-O>G
inoremap <C-A> <C-O>gg<C-O>gH<C-O>G
cnoremap <C-A> <C-C>gggH<C-O>G
onoremap <C-A> <C-C>gggH<C-O>G
snoremap <C-A> <C-C>gggH<C-O>G
xnoremap <C-A> <C-C>ggVG

" CTRL-Tab is Next window
noremap <C-Tab> <C-W>w
inoremap <C-Tab> <C-O><C-W>w
cnoremap <C-Tab> <C-C><C-W>w
onoremap <C-Tab> <C-C><C-W>w

" CTRL-F4 is Close window
noremap <C-F4> <C-W>c
inoremap <C-F4> <C-O><C-W>c
cnoremap <C-F4> <C-C><C-W>c
onoremap <C-F4> <C-C><C-W>c

if has("gui")
" CTRL-F is the search dialog
noremap  <expr> <C-F> has("gui_running") ? ":promptfind\<CR>" : "/"
inoremap <expr> <C-F> has("gui_running") ? "\<C-\>\<C-O>:promptfind\<CR>" : "\<C-\>\<C-O>/"
cnoremap <expr> <C-F> has("gui_running") ? "\<C-\>\<C-C>:promptfind\<CR>" : "\<C-\>\<C-O>/"

" CTRL-H is the replace dialog,
" but in console, it might be backspace, so don't map it there
nnoremap <expr> <C-H> has("gui_running") ? ":promptrepl\<CR>" : "\<C-H>"
inoremap <expr> <C-H> has("gui_running") ? "\<C-\>\<C-O>:promptrepl\<CR>" : "\<C-H>"
cnoremap <expr> <C-H> has("gui_running") ? "\<C-\>\<C-C>:promptrepl\<CR>" : "\<C-H>"
endif

" restore 'cpoptions'
set cpo&
if 1
let &cpoptions = s:save_cpo
unlet s:save_cpo
endif
