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
      goPath = ".go";
      package = unstable.go_1_22;
    };
  };
}
