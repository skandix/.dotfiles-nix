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

  services.tailscale = {
    enable = true;
    package = unstable.tailscale; # same version line as the Linux machines
  };

  nix-homebrew = {
    enable = true;
    enableRosetta = false;
    user = "hx";
    mutableTaps = true;
    autoMigrate = true;
  };
  homebrew = {
    enable = true;

    onActivation = {
      autoUpdate = true;
      cleanup = "zap";
      upgrade = true;
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
  };
}
