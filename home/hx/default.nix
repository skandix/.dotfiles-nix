{
  inputs,
  unstable,
  pkgs,
  ...
}:

{
  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    extraSpecialArgs = { inherit inputs unstable; };
    backupFileExtension = "hm-backup";

    users.hx = {
      imports = [
        ./modules/git
        ./modules/zsh
      ];

      home.sessionPath = [
        "$HOME/.local/bin"
      ];
    };
  };

  time.timeZone = "Europe/Oslo";
  i18n.defaultLocale = "en_GB.UTF-8";
  console = {
    keyMap = "no";
  };

  users.groups.hx.gid = 1000;
  users.users.hx = {
    isNormalUser = true;
    group = "hx";
    shell = pkgs.zsh;
    extraGroups = [
      "wheel"
      "docker"
      "audio"
      "video"
      "libvirtd"
      "input"
      "lp"
      "scanner"
      "networkmanager"
      "wireshark"
    ];
    initialPassword = "hunter2k"; # used for build-vm and init deployment of nixos-anywhere
  };

  programs = {
    zsh = {
      enable = true;
      enableGlobalCompInit = false;
    };
    dconf = {
      enable = true;
    };
  };

  environment.variables = {
    PAGER = "less";
    BROWSER = "librewolf";
  };

}
