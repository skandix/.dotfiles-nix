{pkgs, ...}:

{
  home.packages = with pkgs; [
    unstable.flameshot
  ];
  xdg.configFile = {
    "flameshot/flameshot.ini".source = ./flameshot.ini;
  };
}
