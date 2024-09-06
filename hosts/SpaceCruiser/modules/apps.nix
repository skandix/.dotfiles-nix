{ pkgs, unstable, ...}: {
  #options: https://daiderd.com/nix-darwin/manual/index.html

  environment.systemPackages = with pkgs; [
    git
  ];

  # TODO To make this work, homebrew need to be installed manually, see https://brew.sh
  homebrew = {
    enable = true;
    onActivation = {
      autoUpdate = false;
      # cleanup = "zap";
      upgrade = false;
    };
    brewPrefix = "/opt/homebrew/bin";
    caskArgs = {
      no_quarantine = true;
    };

    taps = [
      "homebrew/services"
    ];

    # `brew install`
    brews = [
      # "aria2"  # download tool
    ];

    # `brew install --cask`
    casks = [
      telegram
      libreoffice
      signal
      tailscale
    ];
  };
}
