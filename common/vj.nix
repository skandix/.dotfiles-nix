{ config, pkgs, unstable, ... }:


{
  environment.systempackages = with pkgs; [
    unstable.cables
  ];
}
