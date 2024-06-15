{ config, pkgs, ... }:

{
  imports = [ ./configurations/git ./configurations/fish ./git.nix ];

  xdg.configFile = {
    "nixpkgs/config.nix".source = ./configurations/nixpkgs-config.nix;
  };

  programs.home-manager.enable = true;

  home.sessionPath = [ "$HOME/.go/bin" "$HOME/.local/bin" "$HOME/.cargo/bin" ];
  nixpkgs.config = { allowUnfree = true; };
}
