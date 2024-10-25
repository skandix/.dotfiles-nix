
{ ... }:
{
  networking.hostName = "TheVoyager";
  networking.computerName = "TheVoyager";
  system.defaults.smb.NetBIOSName = "TheVoyager";

  users.users."hx"= {
    home = "/Users/hx";
    description = "hx";
  };

  nix.settings.trusted-users = [ "hx" ];
}