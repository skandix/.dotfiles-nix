{ pkgs, configs, ... }:

{
  services.wpaperd = {
    enable = true;
    settings = {
      default = {
        path = "${../../../wall}";
        duration = "60m";
        sorting = "random";
      };
      default.transition.hexagonalize = {
        steps = 50;
        horizontal-hexagons = 20.0;
      };
    };
  };
}
