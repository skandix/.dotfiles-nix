{
  config,
  pkgs,
  unstable,
  lib,
  ...
}:

{
  environment.systemPackages = with pkgs; [
    jadx
    quark-engine
  ];
}
