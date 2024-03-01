{ config, ... }:

{
  nixpkgs.config = {
    allowBroken = true;
    allowUnfree = true;
  };
}
