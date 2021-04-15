{pkgs, configs, ...}:
let
  general = builtins.readFile ./vimrc/general.vim;
in
  {
  home-manager.users.skandix = {
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
      vim-wakatime
      gruvbox
    ];
    extraConfig = ''
      ${general}
    '';
  };
};
}
