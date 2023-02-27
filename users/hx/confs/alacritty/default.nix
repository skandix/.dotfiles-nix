{pkgs, ...}:

{
home-manager.users.hx = {
  home.packages = with pkgs; [
    alacritty
  ];
  xdg.configFile = {
    "alacritty/alacritty.yml".source = ./alacritty.yml;
  };
};
}
