{ pkgs, ... }:

# options: https://daiderd.com/nix-darwin/manual/index.html#sec-options
{
  ids.uids.nixbld = 350;
  security.pam.services.sudo_local.touchIdAuth = true;
  programs.fish.enable = true;
  system = {
    startup.chime = false;
    stateVersion = 5;
    primaryUser = "hx";

    defaults = {
      menuExtraClock.Show24Hour = true; # show 24 hour clock
      screencapture.location = "$HOME/Pictures/screenshots";
      loginwindow.LoginwindowText = "If lost, call +47 99 22 70 30 or email bendik.dyrli@gmail.com";

      finder = {
        AppleShowAllExtensions = true;

      };

      dock = {
        autohide = true;
        show-recents = false;
        mru-spaces = false;
        expose-group-apps = true;
        launchanim = false;
        largesize = 16;
      };

      NSGlobalDomain = {
        "com.apple.swipescrolldirection" = false;
        "com.apple.sound.beep.feedback" = 0;

        # Appearance
        AppleInterfaceStyle = "Dark";
        AppleKeyboardUIMode = 3;
        ApplePressAndHoldEnabled = true;
        InitialKeyRepeat = 15;
        KeyRepeat = 2;
      };
    };
  };
}
