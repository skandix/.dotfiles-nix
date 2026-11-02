{ pkgs, lib, ... }:

let
  isDarwin = pkgs.stdenv.hostPlatform.isDarwin;
in

{
  programs.firefox = {
    enable = true;
    package = lib.mkIf isDarwin null;
    policies = {
      AIControls = {
        Default = {
          Value = "blocked";
          Locked = true;
        };
        SidebarChatbot = {
          Value = "blocked";
          Locked = true;
        };
        SmartWindow = {
          Value = "blocked";
          Locked = true;
        };
      };
      VisualSearchEanbled = false;
      DisableFirefoxStudies = true;
      DisableTelemetry = true;
      DisableFeedbackCommands = true;
      AutofillCreditCardEnabled = false;
    };
    preferences = {
      "browser.ml.enable" = {
        Value = false;
        Status = "locked";
      };
      "browser.ml.chat.menu" = {
        Value = false;
        Status = "locked";
      };
      "browser.ml.chat.shortcuts" = {
        Value = false;
        Status = "locked";
      };
      "browser.ml.chat.sidebar" = {
        Value = false;
        Status = "locked";
      };
      "browser.ml.chat.page.footerBadge" = {
        Value = false;
        Status = "locked";
      };
      "browser.ml.chat.page.menuBadge" = {
        Value = false;
        Status = "locked";
      };
      "browser.ml.pageAssist.enabled" = {
        Value = false;
        Status = "locked";
      };
      "browser.tabs.groups.smart.enabled" = {
        Value = false;
        Status = "locked";
      };
      "browser.smartwindow.enabled" = {
        Value = false;
        Status = "locked";
      };
      "extensions.ml.enabled" = {
        Value = false;
        Status = "locked";
      };
      "browser.crashReports.unsubmittedCheck.enabled" = {
        Value = false;
        Status = "locked";
      };
      "browser.crashReports.unsubmittedCheck.autoSubmit2" = {
        Value = false;
        Status = "locked";
      };
      "browser.tabs.crashReporting.sendReport" = {
        Value = false;
        Status = "locked";
      };
      "browser.tabs.crashReporting.includeURL" = {
        Value = false;
        Status = "locked";
      };
    };
    profiles.default = {
      id = 0;
      isDefault = true;
      settings = {
        "webgl.disabled" = false;
        "privacy.resistFingerprinting" = false;
        "privacy.sanatize.sanatizeOnShutdown" = true;
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
