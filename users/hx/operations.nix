{config, pkgs, ...}:

{
  virtualisation.virtualbox = {
    host = {
      enable = true;
      enableExtensionPack = true;
    };
  };
  users.extraGroups.vboxusers.members = ["hx"];

  home-manager.users.hx = {
    home.packages = with pkgs; [
      kubectl
      kubectx
      k9s
      vagrant
      terraform
      ansible-core
      openstackclient
    ];
  };
}
