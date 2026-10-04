{ config, pkgs, ... }:

{
  imports = [
    ./hm/configurations/git
    ./hm/configurations/zsh
  ];

  programs.home-manager = {
    enable = true;
  };

  home.sessionPath = [
    "$HOME/.go/bin"
    "$HOME/.local/bin"
    "$HOME/.cargo/bin"
  ];

}
