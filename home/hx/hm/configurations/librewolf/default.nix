{ pkgs, config, unstable, ... }:

{
  home-manager.users.hx = {
    programs.librewolf = {
      enable = true;
      #package = pkgs.librewolf;
      settings = {
        "webgl.disabled" = false;

        "privacy.resistFingerprinting" = false;
        "privacy.clearOnShutdown.history" = true;
        "privacy.clearOnShutdown.cookies" = false;
        "privacy.donottrackheader.enabled" = true;

        "cookiebanners.service.mode.privateBrowsing" = 2;
        "cookiebanners.service.mode" = 2;

        "network.cookie.lifetimePolicy" = 0;

        "identity.fxaccounts.enabled" = true;

        "browser.sessionstore.resume_from_crash" = false;
      };
    };
  };
}
