" use pathogen to manage Vim plugins
execute pathogen#infect()
call pathogen#infect('bundle/{}')

" use space to start commands
let mapleader=" "

" reload .vimrc without exiting vim
map <leader>s :source ~/.vimrc<CR>

" do not create backup files
set nobackup

" show and toggle line numbers
set number
nmap <leader>n :set number!<cr>

" Ttab = 4 spaces
set tabstop=4
set expandtab

" figure out when to autoindent (2 spaces)
set smartindent
set shiftwidth=4

" allow deleting prior to the start of the current insert/edit
set backspace=indent,eol,start

" show current position (ruler) in bottom right corner
set ruler

" jump to last cursor position when opening a file
if has("autocmd")
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
    \| exe "normal! g'\"" | endif
endif

" highlight searches as they happen
set ignorecase
set smartcase
set incsearch
set hlsearch

" clear highlighting for current search
noremap <leader>h :noh<cr>

" wrap to top of file when searching
set wrapscan

" keep more in memory to speed things up
set hidden
set history=100

" set color scheme and syntax highlighting based on file type
filetype on
syntax enable
set background=dark
colorscheme desert

" classify files with no extension as Perl
autocmd BufNewFile,BufRead * if expand('%:t') !~ '\.' | set syntax=perl | endif
"
" turn off # exiting left
inoremap # X<C-H>#

nmap <F4> :!rake test %<cr>

" Toggle paste mode
map <leader>p :call Toggle_paste_mode()<cr>i
set pastetoggle=<leader>p
let paste_mode = 0 " 0 = normal, 1 = paste

func! Toggle_paste_mode()
        if g:paste_mode == 0
                set paste
                let g:paste_mode = 1
        else
                set nopaste
                let g:paste_mode = 0
        endif
        return
endfunc


" Delimiters
imap (( (  )<left><left>
imap [[ []<left>
imap {{ {}<left>
imap {<cr> {<cr>}<up><esc>$a<cr>
imap '' ''<left>
imap "" ""<left>
imap `` ``<left>

" Add a semi-colon at the end of this line and go to the next.
nmap ; $a;<cr>

" Run Perl commands on the curent file
map <leader>1 :!perl -c %<cr>
map <leader>2 :!perl -d %<cr>
map <leader>3 :%!perltidy<cr>
map <leader>4 :!prove -v %<cr>

" Go to the next double underscore and replace the word that follows it.
nmap _ /__<cr>cw

" Syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_loc_list_height=5

let g:syntastic_enable_perl_checker = 1
let g:syntastic_perl_checkers = ['perl', 'podchecker']

