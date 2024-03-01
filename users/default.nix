{ config, home-manager, pkgs, ... }:

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
    # openssh.authorizedKes.keyFiles = [ ssh-keys.outPath ];
  };

  home-manager.users = { hx = (import ./hx/hm/base.nix); };
}
