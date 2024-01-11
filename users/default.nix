{ config, pkgs, home-manager, ... }:

{
  users.groups.hx.gid = 1000;
  users.users.hx = {
    isNormalUser = true;
    extraGroups = [
      "wheel"
      "docker"
      "audio"
      "video"
      "screen"
      "plugdev"
      "libvirtd"
      "input"
      "lp"
      "scanner"
      "networkmanager"
      "wireshark"
      "vboxusers"
    ];
    group = "hx";
    shell = pkgs.zsh;
    openssh.authorizedKeys.keyFiles = [ ssh-keys.outPath ];
  };

  environment.variables = {
    PAGER = "less";
    BROWSER = "firefox";
    EDITOR = "vim";
    SHELL = "zsh";
  };

  home-manager.users = {
    hx = (import ./hx/core.nix);
  };
}
