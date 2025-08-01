au BufNewFile,BufRead *.py
    \ set tabstop=4
    \| set softtabstop=4
    \| set shiftwidth=4
    \| set textwidth=79
    \| set autoindent
    \| set fileformat=unix

au BufNewFile,BufRead *.js, *.html, *.css
    \ set tabstop=2
    \| set softtabstop=2
    \| set shiftwidth=2

""" Lettings
let mapleader=" "
let g:go_version_warning = 0

""" KEYBINDS
"""" F-Keys
nnoremap <F1> :set hlsearch!<CR>
nnoremap <F2> :StripWhitespace<CR>

map <C-d> :NERDTreeToggle<CR>
map  <C-f> :tabn<CR>
map  <C-t> :tabnew<CR>
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
nnoremap <BS> X

""" LEADER
nnoremap <Leader>w :write <CR>
nnoremap <Leader>x :xit <CR>
nnoremap <Leader>q :quit <CR>
nnoremap <Leader>b :!python3 %<CR>

nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>

"""" Splitting Keybinds
"split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

""" ligthline config
syntax enable
colorscheme srcery

hi! Normal ctermbg=NONE guibg=NONE
hi! NonText ctermbg=NONE guibg=NONE guifg=NONE ctermfg=NONE

let g:lightline = {'colorscheme': 'seoul256',}

hi Normal     ctermbg=NONE guibg=NONE
hi LineNr     ctermbg=NONE guibg=NONE
hi SignColumn ctermbg=NONE guibg=NONE

""" Startify
let g:startify_session_dir = '~/.vim/session'

if &term =~ '256color'
  set t_ut=
endif

""" BEHAVE
set wildmode=list:longest,full	" Show vim completion menu
set encoding=utf-8				" encoding
set undolevels=256				" how many times one can undo
set updatetime=250				" Faster update of internals
set numberwidth=6				" with of the 'gutter' col for numbering
set foldmethod=indent
set termguicolors
set foldlevel=99
set splitright
set backspace=indent,eol,start
set matchpairs+=<:>
set splitright
set textwidth=128
set shiftwidth=4
set laststatus=2				" Display statusline
set cmdheight=1					" Height of the command bar
set history=256					" How much history to save.
set noshowmode 					" Lightline handle this
set autoindent					" copies indent from prev line, to next new line
set cursorline          		" highlight current line
set ignorecase					" Ignore case when searching.
set smartcase					" Dont ignore case if there is capitals in the search pattern
set showmatch           		" highlight matching [{()}]
set incsearch           		" search as characters are entered
set tabstop=4
set shiftwidth=4
set expandtab
set wildmenu            		" visual autocomplete for command men
set hlsearch            		" highlight matches
set autoread 					" checks if file has changed externally
set showcmd                     " show command in bottom bar
set number              		" show line numbers
set rnu							" Relative line numbering


""" COMMMANDS (taken from lasseh .vimrc)
command! Q q
command! W w

""" NERDTREE SETTINGS (taken from lasseh .vimrc)
" Open Nerdtree if no files specified
autocmd StdinReadPre * let s:std_in=1
"autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" Close vim if nerdtree is only buffer left when :q
function! s:CloseIfOnlyControlWinLeft()
    if winnr("$") != 1
        return
    endif
    if (exists("t:NERDTreeBufName") && bufwinnr(t:NERDTreeBufName) != -1)
                \ || &buftype == 'quickfix'
        q
    endif
endfunction

augroup CloseIfOnlyControlWinLeft
    au!
    au BufEnter * call s:CloseIfOnlyControlWinLeft()
augroup END

""" unbinde the fucking arrow keys also they are broken on my cooler master keyboard ;_;
noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>
