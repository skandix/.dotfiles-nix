{ pkgs, ... }:

# options: https://daiderd.com/nix-darwin/manual/index.html#sec-options
{
  ids.uids.nixbld = 350;

  system = {
    startup.chime = false;
    stateVersion = 5;
    # activationScripts are executed every time you boot the system or run `nixos-rebuild` / `darwin-rebuild`.
    activationScripts.postUserActivation.text = ''
      # activateSettings -u will reload the settings from the database and apply them to the current session,
      # so we do not need to logout and login again to make the changes take effect.
      /System/Library/PrivateFrameworks/SystemAdministration.framework/Resources/activateSettings -u
    '';
    


    defaults = {
      menuExtraClock.Show24Hour = true; # show 24 hour clock
      screencapture.location = "$HOME/Pictures/screenshots";
      loginwindow.LoginwindowText = "yeeeet, 99227030";

      finder = {
        AppleShowAllExtensions = true;

      };

      dock = {
        autohide = true; # automatically hide and show
        show-recents = false; # do not show recent apps in dock
        mru-spaces = false;
        expose-group-apps = true; # Group windows by application
        launchanim = false;
        largesize = 16;
      };

      NSGlobalDomain = {
        # `defaults read NSGlobalDomain "xxx"`
        "com.apple.swipescrolldirection" = false; # enable natural scrolling(default to true)
        "com.apple.sound.beep.feedback" = 0; # disable beep sound when pressing volume up/down key

        # Appearance
        AppleInterfaceStyle = "Dark"; # dark mode
        AppleKeyboardUIMode = 3; # Mode 3 enables full keyboard control.
        ApplePressAndHoldEnabled = true; # enable press and hold
        InitialKeyRepeat = 15; # normal minimum is 15 (225 ms), maximum is 120 (1800 ms)
        KeyRepeat = 2; # normal minimum is 2 (30 ms), maximum is 120 (1800 ms
    };
  };
};
security.pam.enableSudoTouchIdAuth = true;
  # Create /etc/zshrc that loads the nix-darwin environment.
  # this is required if you want to use darwin's default shell - zsh
  programs.fish.enable = true;
}
