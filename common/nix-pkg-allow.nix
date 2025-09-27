{ config, ... }:

{
  nixpkgs.config = {
    allowBroken = false;
    allowUnfree = true; # feelsshartman
    allowUnfreePredicate = _: true;
  };
}
