{ pkgs, configs, ... }:
let
  general = builtins.readFile ./general.vim;
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
        vim-indent-guides
        nerdcommenter
        ctrlp
        vim-startify
        vim-json
        vim-better-whitespace
        lightline-vim
        ale
        vim-gitgutter
        #lexima-vim
        telescope-nvim
        srcery-vim
        ansible-vim
        vim-polyglot
        rainbow
      ];
      extraConfig = ''
        ${general}
      '';
    };
  };
}
