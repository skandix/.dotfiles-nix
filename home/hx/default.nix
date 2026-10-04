{ config, pkgs, ... }:

{
  environment.variables = {
    PAGER = "less";
    BROWSER = "librewolf";
  };
}
