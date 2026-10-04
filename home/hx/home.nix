{ config, pkgs, ... }:

{
  imports = [
    ./hm/configurations/git
    #./hm/configurations/fish
    ./hm/configurations/zsh
  ];

  programs.home-manager = {
    enable = true;
  };

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

}
