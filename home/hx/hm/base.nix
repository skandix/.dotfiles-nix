{ config, pkgs, ... }:

{
  xdg.configFile = {
    "nixpkgs/config.nix".source = ./configurations/nixpkgs-config.nix;
  };

  programs.home-manager.enable = true;

  imports = [ ./configurations/git ./configurations/zsh ];

  home.sessionPath = [ "$HOME/.go/bin" "$HOME/.local/bin" "$HOME/.cargo/bin" ];
  nixpkgs.config = { allowUnfree = true; };
}
