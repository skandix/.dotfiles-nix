{ pkgs, configs, ... }:
let
  general = builtins.readFile ./general.vim;
in
{
  home-manager.users.hx = {
    programs.neovim = {
      enable = true;
      vimAlias = true;
      viAlias = true;
      vimdiffAlias = true;
      defaultEditor = true;
      plugins = with pkgs.vimPlugins; [
        srcery-vim
        vim-nix
        nerdtree
        vim-indent-guides
        nerdcommenter
        ctrlp
        vim-startify
        vim-json
        vim-better-whitespace
        lightline-vim
        lexima-vim
        ale
        vim-gitgutter
        telescope-nvim
        ansible-vim
        vim-polyglot
        rainbow
        nvim-lspconfig
      ];
      extraConfig = ''
        ${general}
      '';
    };
  };
}
