{ pkgs, ... }:

{
  home-manager.users.hx = {
    services.flameshot = {
      enable = true;
      settings = {
        General = {
          disabledTrayIcon = true;
          contrastOpacity = 204;
          drawThickness = 10;
          filenamePattern = "%H%M%S%j%Y%y";
          saveAfterCopy = true;
          savePath = "/home/hx/Pictures";
          showDesktopNotification = false;
          showHelp = false;
          showSidePanelButton = true;
          showStartupLaunchMessage = false;
          uiColor = "#009688";
        };
      };
    };
  };
}
