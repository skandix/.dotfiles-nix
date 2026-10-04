{ pkgs, ... }:

{

  imports = [ ./lsp.nix ];

  programs.neovim = {
    enable = true;
    vimAlias = true;
    viAlias = true;
    vimdiffAlias = true;
    defaultEditor = true;
    plugins = with pkgs.vimPlugins; [
      # LOOK AND FEEL
      srcery-vim
      lightline-vim
      rainbow

      # LANGUAGES
      ansible-vim
      vim-nix

      # NAVIGATION
      nvim-tree-lua
      telescope-nvim
      vim-startify

      # EDITING
      nerdcommenter
      lexima-vim
      vim-better-whitespace

      # GIT AND LINTING
      vim-gitgutter

      # TREESITTER
      (nvim-treesitter.withPlugins (p: [
        p.nix
        p.bash
        p.python
        p.go
        p.rust
        p.yaml
        p.json
        p.toml
        p.markdown
      ]))

    ];
    initLua = ''
      vim.g.loaded_netrw = 1
      vim.g.loaded_netrwPlugin = 1
      vim.opt.termguicolors = true
      require("nvim-tree").setup()

      vim.api.nvim_create_autocmd("FileType", {
        callback = function()
          pcall(vim.treesitter.start)
        end,
      })
    '';
    extraConfig = /* vim */ ''
      au BufNewFile,BufRead *.py
          \ set tabstop=4
          \| set softtabstop=4
          \| set shiftwidth=4
          \| set textwidth=79
          \| set autoindent
          \| set fileformat=unix

      au BufNewFile,BufRead *.js,*.html,*.css
          \ set tabstop=2
          \| set softtabstop=2
          \| set shiftwidth=2

      let mapleader=" "
      let g:rainbow_active = 1

      nnoremap <F1> :set hlsearch!<CR>
      nnoremap <F2> :StripWhitespace<CR>

      map <C-d> :NvimTreeToggle<CR>
      map  <C-f> :tabn<CR>
      map  <C-t> :tabnew<CR>
      nnoremap <C-J> <C-W><C-J>
      nnoremap <C-K> <C-W><C-K>
      nnoremap <C-L> <C-W><C-L>
      nnoremap <C-H> <C-W><C-H>
      nnoremap <BS> X

      nnoremap <Leader>w :write <CR>
      nnoremap <Leader>x :xit <CR>
      nnoremap <Leader>q :quit <CR>
      nnoremap <Leader>b :!python3 %<CR>

      nnoremap <leader>ff <cmd>Telescope find_files<cr>
      nnoremap <leader>fg <cmd>Telescope live_grep<cr>
      nnoremap <leader>fb <cmd>Telescope buffers<cr>
      nnoremap <leader>fh <cmd>Telescope help_tags<cr>

      syntax enable
      colorscheme srcery

      hi! Normal ctermbg=NONE guibg=NONE
      hi! NonText ctermbg=NONE guibg=NONE guifg=NONE ctermfg=NONE

      let g:lightline = {'colorscheme': 'seoul256',}

      hi Normal     ctermbg=NONE guibg=NONE
      hi LineNr     ctermbg=NONE guibg=NONE
      hi SignColumn ctermbg=NONE guibg=NONE

      let g:startify_session_dir = '~/.vim/session'

      set wildmode=list:longest,full	" Show vim completion menu
      set undolevels=256				" how many times one can undo
      set updatetime=250				" Faster update of internals
      set numberwidth=6				" with of the 'gutter' col for numbering
      set foldmethod=indent
      set foldlevel=99
      set backspace=indent,eol,start
      set matchpairs+=<:>
      set splitright
      set textwidth=128
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

      """ unbinde the fucking arrow keys also they are broken on my cooler master keyboard ;_;
      noremap <Up> <Nop>
      noremap <Down> <Nop>
      noremap <Left> <Nop>
      noremap <Right> <Nop>
    '';
  };
}
