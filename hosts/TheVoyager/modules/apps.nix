{ unstable, ... }:

{
  #options: https://daiderd.com/nix-darwin/manual/index.html

  services.defaultBrowser = {
    enable = true;
    browser = "librewolf";
  };

  environment.systemPackages = with unstable; [
    docker
    docker-compose
  ];

  nix-homebrew = {
    enable = true;
    enableRosetta = false;
    user = "hx";
    mutableTaps = false;
    autoMigrate = true;
  };
  homebrew = {
    enable = true;

    onActivation = {
      autoUpdate = true;
      cleanup = "zap";
      upgrade = true;
    };

    # brewPrefix = "/opt/homebrew/bin";
    caskArgs = {
      no_quarantine = true;
    };

    global = {
      brewfile = true;
    };

    #taps = [];
    # `brew install`
    brews = [
      "mas"
      "wireguard-tools"
      "nmap"
      "speedtest-cli"
    ];

    # `brew install --cask`
    casks = [
      "telegram"
      "slack"
      "signal"
      "tor-browser"
      "sublime-text"
      "ghostty"
      "discord"
      "librewolf"
      "microsoft-teams"
      "visual-studio-code"
      "plex"
      "wireshark-app"
      "steam"
      "obsidian"
      "plexamp"
      "rectangle"
      "zotero"
      "1password"
    ];

    masApps = {
      Wireguard = 1451685025;
      Tailscale = 1475387142;
    };
  };
}
