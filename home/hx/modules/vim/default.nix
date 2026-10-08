{ pkgs, ... }:

{

  imports = [ ./lsp.nix ];

  programs.neovim = {
    enable = true;
    viAlias = true;
    vimAlias = true;
    vimdiffAlias = true;
    defaultEditor = true;
    extraPackages = with pkgs; [
      ripgrep
      fd
      tree-sitter
    ];
    plugins = with pkgs.vimPlugins; [
      # LOOK AND FEEL
      lightline-vim
      rainbow

      # LANGUAGES
      ansible-vim
      vim-nix

      # SNIPPETS
      friendly-snippets

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
      " Set custom config for files

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

      au BufNewFile,BufRead *.yml,*.yaml
          \ set tabstop=2
          \| set softtabstop=2
          \| set shiftwidth=2

      let mapleader=" "
      let g:rainbow_active = 1

      " Remapp
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
      colorscheme retrobox

      hi! Normal ctermbg=NONE guibg=NONE
      hi! NonText ctermbg=NONE guibg=NONE guifg=NONE ctermfg=NONE

      let g:lightline = {'colorscheme': 'deus',}

      hi Normal     ctermbg=NONE guibg=NONE
      hi LineNr     ctermbg=NONE guibg=NONE
      hi SignColumn ctermbg=NONE guibg=NONE

      let g:startify_session_dir = '~/.vim/session'

      set wildmode=list:longest,full
      set undolevels=256
      set updatetime=250
      set numberwidth=6
      set foldmethod=indent
      set foldlevel=99
      set backspace=indent,eol,start
      set matchpairs+=<:>
      set splitright
      set textwidth=128
      set laststatus=2
      set cmdheight=1
      set history=256
      set noshowmode
      set autoindent
      set cursorline
      set ignorecase
      set smartcase
      set showmatch
      set incsearch
      set tabstop=4
      set shiftwidth=4
      set expandtab
      set wildmenu
      set hlsearch
      set autoread
      set noswapfile
      set undofile
      set showcmd
      set number
      set rnu
      set nobomb


      " COMMMANDS (taken from lasseh .vimrc)
      command! Q q
      command! W w

      " unbinde the fucking arrow keys also they are broken on my cooler master keyboard ;_;
      noremap <Up> <Nop>
      noremap <Down> <Nop>
      noremap <Left> <Nop>
      noremap <Right> <Nop>
    '';
  };
}
