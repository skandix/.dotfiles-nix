{ pkgs, configs, ... }:
let
  general = builtins.readFile ./general.vim;
in
{
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
      telescope-nvim
      srcery-vim
      ansible-vim
      vim-polyglot
      aurora
      rainbow
      vim-airline
      vim-airline-themes
    ];
    extraConfig = ''
      ${general}
    '';
  };
}
