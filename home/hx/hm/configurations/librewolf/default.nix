{ pkgs, config, unstable, ... }:

{
  home-manager.users.hx = {
    programs.librewolf = {
      enable = true;
      package = unstable.librewolf;
      settings = {
        "webgl.disabled" = false;
        "privacy.resistFingerprinting" = false;
        "privacy.clearOnShutdown.history" = true;
        "privacy.clearOnShutdown.cookies" = false;
        "network.cookie.lifetimePolicy" = 0;
        "identity.fxaccounts.enabled" = true;
        "browser.sessionstore.resume_from_crash" = false;
      };
    };
  };
}
