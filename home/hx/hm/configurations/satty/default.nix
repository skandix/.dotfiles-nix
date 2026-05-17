{ pkgs, ... }:

{
  home-manager.users.hx = {
    programs.satty = {
      enable = true;
      # settings = {
      #   general = {
      #     output-filename = "/home/hx/Pictures/%Y-%m-%d_%H:%M:%S.png"
      #   }
      # };
      # TODO: something is not working as it should, so i'll look into this late, just need to get the rest working
    };
  };
}
