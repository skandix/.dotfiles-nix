
{ ... }:
{
  networking.hostName = "SpaceCruiser";
  networking.computerName = "SpaceCruiser";
  system.defaults.smb.NetBIOSName = "SpaceCruiser";

  users.users."hx"= {
    home = "/Users/hx";
    description = "hx";
  };

  nix.settings.trusted-users = [ "hx" ];
}