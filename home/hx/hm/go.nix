# source: https://github.com/fbegyn/nixos-configuration/blob/main/users/francis/hm/go.nix

{
  pkgs,
  config,
  unstable,
  ...
}:

{

  home-manager.users.hx = {
    programs.go = {
      enable = true;
      env.GOPATH = ".go";
      package = unstable.go;
    };
  };
}
