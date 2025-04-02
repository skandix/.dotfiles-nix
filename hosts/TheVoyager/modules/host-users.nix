{ ... }:
{
  networking.hostName = "TheVoyager";
  networking.computerName = "TheVoyager";
  system.defaults.smb.NetBIOSName = "TheVoyager";

  users.users."skandix" = {
    home = "/Users/skandix";
    description = "skandix";
  };

  nix.settings.trusted-users = [ "skandix" ];
}
