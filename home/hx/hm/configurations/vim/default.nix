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
        nvim-tree-lua
        vim-indent-guides
        nerdcommenter
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
      extraLuaConfig = ''
        vim.g.loaded_netrw = 1
        vim.g.loaded_netrwPlugin = 1
        vim.opt.termguicolors = true
        require("nvim-tree").setup()
      '';
      extraConfig = ''
        ${general}
      '';
    };
  };
}
