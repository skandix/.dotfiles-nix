# source: https://github.com/fbegyn/nixos-configuration/blob/main/users/francis/hm/go.nix

{ config, unstable, ... }:

{
  programs.go = {
    enable = true;
    package = unstable.go;
    env.GOPATH = "${config.home.homeDirectory}/.go";
  };

  home.sessionPath = [ "${config.home.homeDirectory}/.go/bin" ];
}
