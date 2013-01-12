" Modified from https://github.com/pivotalforks/vim-config/blob/master/init/keybindings.vim
" Keybindings
" -----------

let mapleader = ","
let maplocalleader = ";"

" kj - The intuitive way to get out of insert mode
imap kj <Esc>

" Make Y consistent with D and C
map Y y$

" Search
nmap <leader>s :%s/
vmap <leader>s :s/

" Split screen
map <leader>v :vsp<CR>

" Move between screens
map <leader>w ^Ww
map <leader>= ^W=
map <leader>j ^Wj
map <leader>k ^Wk
nmap <C-j> <C-w>j
nmap <C-k> <C-w>k
nmap <C-h> <C-w>h
nmap <C-l> <C-w>l

" Reload .vimrc
map <leader>rv :source ~/.vimrc<CR>

" Auto-indent whole file
nmap <leader>= gg=G``
map <silent> <F7> gg=G``:echo "Reformatted."<CR>

" Fast scrolling
nnoremap <C-e> 3<C-e>
nnoremap <C-y> 3<C-y>

" File tree browser
map \ :NERDTreeToggle<CR>

" File tree browser showing current file - pipe (shift-backslash)
map \| :NERDTreeFind<CR>

"indent/unindent visual mode selection with tab/shift+tab
vmap <tab> >gv
vmap <s-tab> <gv

" FuzzyFinder and switchback commands
map <leader>e :e#<CR>
map <leader>b :FufBuffer<CR>
map <leader><C-N> :FufFile **/<CR>
map <leader>n :FufFile **/<CR>

" refresh the FuzzyFinder cache
map <leader>rf :FufRenewCache<CR>

" Command-T
map <D-N> :CommandTFlush<CR>:CommandT<CR>
map <leader>f :CommandTFlush<CR>:CommandT<CR>

" Comment/uncomment lines
map <leader>/ <plug>NERDCommenterToggle
map <C-/> <plug>NERDCommenterToggle
imap <C-/> <Esc><plug>NERDCommenterToggle i

" In command-line mode, <C-A> should go to the front of the line, as in bash.
cmap <C-A> <C-B>

" Disable middle mouse button, F1
map <MiddleMouse> <Nop>
imap <MiddleMouse> <Nop>
map <F1> <Nop>
imap <F1> <Nop>

" Easy access to the shell
map <Leader><Leader> :!

" AckGrep current word
map <leader>a :call AckGrep()<CR>
" AckVisual current selection
vmap <leader>a :call AckVisual()<CR>

" Recalculate diff when it gets messed up.
nmap du :diffupdate<CR>

" Gundo.vim
map <leader>u :GundoToggle<CR>
