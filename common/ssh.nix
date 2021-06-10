{config, pkgs, ...}:

{
  services.sshd.enable = {
    startWhenNeeded = true;
    allowSFTP = true;
    ports = [3301];
  };
}
