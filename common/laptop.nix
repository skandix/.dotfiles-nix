{config, pkgs, ...}:

{
  home-manager.users.skandix = {
    home.packages = with pkgs; [
      powertop
      tlp
    ];
  };
}
