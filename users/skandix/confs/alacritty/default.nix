{pkgs, ...}:

{
home-manager.users.skandix = {
  home.packages = with pkgs; [
    alacritty
  ];
  xdg.configFile = {
    "alacritty/alacritty.yml".source = ./alacritty.yml;
  };
};
}
