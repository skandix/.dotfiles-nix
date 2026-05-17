{ pkgs, ... }:

{
  home-manager.users.hx = {
    programs.satty = {
      enable = true;
      settings = {
        general = {
          output-filename = "/home/hx/Pictures/%Y-%m-%d_%H:%M:%S.png"
        }
      };
    };
  };
}
