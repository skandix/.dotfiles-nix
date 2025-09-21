{
  config,
  pkgs,
  lib,
  unstable,
  ...
}:

{
  nixpkgs.config.allowUnfreePredicate = pkg: builtins.elem (lib.getName unstable) [
    "ndi-6"
  ];
  environment.systemPackages = with unstable; [
    unstable.ndi-6
  ];
}
