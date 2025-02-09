{ config, pkgs, ... }:

{
  imports = [
    ./hm/configurations/git
    #./hm/configurations/zsh
    ./hm/configurations/fish
  ];

  xdg.configFile = {
    "nixpkgs/config.nix".source = ./hm/configurations/nixpkgs-config.nix;
  };
  xdg.portal.xdgOpenUsePortal = true;

  programs.home-manager.enable = true;

  # dark mode in gtk apps
  gtk = {
    enable = true;
    theme = {
      name = "Adwaita-dark";
      package = pkgs.gnome-themes-extra;
    };
  };

  home.sessionPath = [
    "$HOME/.go/bin"
    "$HOME/.local/bin"
    "$HOME/.cargo/bin"
  ];

  nixpkgs.config = {
    allowUnfree = true;
  };
}
