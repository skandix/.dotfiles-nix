{ config, pkgs, home-manager, ... }:

{
  imports = [
    ./configurations/git
    ./configurations/zsh
  ];

  xdg.configFile = {
    "nixpkgs/config.nix".source = ./configurations/nixpkgs-config.nix;
  };

  programs.home-manager.enable = true;
  programs.neovim = {
    enable = true;
    vimAlias = true;
    vimdiffAlias = true;
  };

  home.sessionPath = [
    "$HOME/.go/bin"
    "$HOME/.local/bin"
    "$HOME/.cargo/bin"
  ];

  nixpkgs.config = {
    allowUnfree = true;
  };

  nixpkgs.config = {
    allowUnfree = true;
  };
}
