{ pkgs, ... }:

{
  programs = {
    ssh = {
      startAgent = true;
      agentTimeout = "4h";
    };
    gnupg.agent = {
      enableSSHSupport = true;
    };
  };
}
