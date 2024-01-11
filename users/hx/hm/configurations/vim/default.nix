{pkgs, configs, ...}:
let
  general = builtins.readFile ./files/general.vim;
in
  {
  home-manager.users.hx = {
  programs.neovim = {
    enable = true;
    vimAlias = true;
    vimdiffAlias = true;
    plugins = with pkgs.vimPlugins; [
      vim-nix
      nerdtree
      rust-vim
      vim-indent-guides
      nerdcommenter
      The_NERD_tree
      ctrlp
      polyglot
      vim-startify
      vim-json
      vim-better-whitespace
      lightline-vim
      ale
      vim-gitgutter
      lexima-vim
      gruvbox
    ];
    extraConfig = ''
      ${general}
    '';
  };
};
}


# 'rust-lang/rust.vim'
# 'pearofducks/ansible-vim'
# 'nathanaelkane/vim-indent-guides'
# 'scrooloose/nerdtree'
# 'vimsence/vimsence'
# 'scrooloose/nerdcommenter'
# 'Yggdroot/LeaderF'
# 'sheerun/vim-polyglot'
# 'mhinz/vim-startify'
# 'elzr/vim-json'
# 'ntpeters/vim-better-whitespace'
# 'bling/vim-airline'
# 'vim-airline/vim-airline-themes
# 'w0rp/ale'
# 'airblade/vim-gitgutter'
# 'luochen1990/rainbow'
# 'ray-x/aurora'
# 'cohama/lexima.vim'