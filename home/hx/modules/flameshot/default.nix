{ config, unstable, ... }:

{
  services.flameshot = {
    enable = true;
    package = unstable.flameshot.override { enableWlrSupport = true; };
    settings.General = {
      disabledTrayIcon = true;
      contrastOpacity = 204;
      drawThickness = 10;
      filenamePattern = "%H%M%S-%j%Y%y";
      saveAfterCopy = true;
      savePath = "${config.home.homeDirectory}/Pictures";
      showDesktopNotification = false;
      showHelp = false;
      showSidePanelButton = true;
      showStartupLaunchMessage = false;
      uiColor = "#009688";
    };
  };
}
