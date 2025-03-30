{
  config,
  pkgs,
  lib,
  unstable,
  ...
}:

{
  nixpkgs.config.allowUnfreePredicate = pkg: builtins.elem (lib.getName pkgs) [
    "winbox4"
  ];
  environment.systemPackages = with pkgs; [
    winbox4
  ];
}
