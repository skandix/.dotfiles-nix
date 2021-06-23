{config, pkgs, ...}:

{
  home-manager.users.skandix = {
    home.packages = with pkgs; [
      bat
      powertop
      tlp
    ];
  };
}
