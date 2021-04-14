{pkgs, ...}:

{
home-manager.users.skandix = {
  home.packages = with pkgs; [
    unstable.alacritty
  ];
  xdg.configFile = {
    "alacritty/alacritty.yml".source = ./alacritty.yml;
  };
};
}
