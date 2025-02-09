{ pkgs, config, ... }:

{
  home-manager.users.hx = {
    programs.librewolf = {
      enable = true;
      #package = pkgs.librewolf-unwrapped;
      settings = {
        "webgl.disabled" = false;
        "privacy.resistFingerprinting" = false;
        "privacy.clearOnShutdown.history" = false;
        "privacy.clearOnShutdown.cookies" = false;
        "network.cookie.lifetimePolicy" = 0;
        "identity.fxaccounts.enabled" = true;
        "browser.sessionstore.resume_from_crash" = false;
      };
    };
  };
}
