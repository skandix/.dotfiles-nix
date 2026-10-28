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
      };
      AIChatbot = {
        BuiltIn = {
          "Anthropic Claude" = false;
          ChatGPT = false;
          Copilot = false;
          "Google Gemini" = false;
          HuggingChat = false;
          "Le Chat Mistral" = false;
          localhost = false;
        };
      };
      DisableFirefoxStudies = true;
      DisableTelemetry = true;
      AutoFillCreditCardEnabled = false;
      CrashReportsSubmit = {
        Enabled = false;
      };

    };
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
    preferences = {
      "browser.ml.enable" = "locked"; # remove if you keep Translations and they break
      "browser.ml.chat.enabled" = "locked";
      "browser.ml.chat.menu" = "locked";
      "browser.ml.chat.page" = "locked";
      "browser.ml.chat.page.footerBadge" = "locked";
      "browser.ml.chat.page.menuBadge" = "locked";
      "browser.ml.chat.shortcuts" = "locked";
      "browser.ml.chat.sidebar" = "locked";
      "browser.ml.linkPreview.enabled" = "locked";
      "browser.ml.pageAssist.enabled" = "locked";
      "browser.tabs.groups.smart.enabled" = "locked";
      "browser.tabs.groups.smart.userEnabled" = "locked";
      "extensions.ml.enabled" = "locked";
      "browser.search.visualSearch.featureGate" = "locked"; # Google Lens image search
    };
  };
}
