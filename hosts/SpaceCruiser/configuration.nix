{ inputs, pkgs, lib, ... }:
{
  nixpkgs = {
    hostPlatform = "x86_64-darwin";
    config = {
      allowUnfree = true;
      allowUnfreePredicate = (_: true);
    };
  };

  
  # imports = [ <home-manager/nix-darwin> ];
  home-manager = {
    useGlobalPkgs = false; # makes hm use nixos's pkgs value
      extraSpecialArgs = { inherit inputs; }; # allows access to flake inputs in hm modules
      users.hx = { config, pkgs, ... }: {
        home.homeDirectory = lib.mkForce "/Users/hx";
        home.stateVersion = "24.05";

        imports = [
          # ../../home/hx
          # ../../home/hx/cli.nix
          # ../../home/hx/hm/configurations/tmux
          # ../../home/hx/hm/configurations/vim
          # ../../home/hx/hm/configurations/zsh
          # ../../home/hx/hm/configurations/mpv
        ];
      };
    backupFileExtension = "bak";
    useUserPackages = true;
  };
  nix = {
    settings = {
      max-jobs = "auto";
      auto-optimise-store = true;
      experimental-features = [ "nix-command" "flakes" ];
    };
    useDaemon = true;
    };

  homebrew = {
    enable = true;
    onActivation = {
      autoUpdate = true;
      cleanup = "zap";
      upgrade = true;
    };
    brewPrefix = "/opt/homebrew/bin";
    caskArgs = {
      no_quarantine = true;
    };
    brews = [
      "ansible"
      "ansible-lint"
      "pulumi"
    ];
    casks = [
      # "notion"
      "telegram"
      "libreoffice"
      "signal"
      # "karabiner-elements"
      # "grid"
      # "monitorcontrol"
      # "google-chrome"
      # "handbrake"
      "tailscale"
      # "bambu-studio"
      # "element"
    ];
  };
}