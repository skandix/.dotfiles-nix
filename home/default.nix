{ home-manager, pkgs, ... }:

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
      "podman"
    ];
    group = "hx";
    shell = pkgs.fish;
  };

  users.users.hx.ignoreShellProgramCheck = true;

  home-manager.users = {
    hx = (import ./hx/home.nix);
  };
}
