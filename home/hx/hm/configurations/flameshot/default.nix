{ unstable, pkgs, ... }:

{
  home-manager.users.hx = {
    services.flameshot = {
      enable = true;
      package = unstable.flameshot.override { enableWlrSupport = true; };
      settings = {
        General = {
          useGrimAdapter = true;
          disabledGrimWarning = true;
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
