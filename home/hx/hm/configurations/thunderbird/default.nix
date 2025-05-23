
{ pkgs, configs, unstable, ... }:

{
  home-manager.users.hx = {
      programs.thunderbird = {
          enable = true;
          package = unstable.thunderbird;
      };
  };
}
