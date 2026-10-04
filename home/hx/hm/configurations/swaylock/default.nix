{ ... }:

{
  programs.swaylock = {
    enable = true;
    settings = {
      show-failed-attempts = true;
      image = "${../../../wall/22477588234.jpg}";
      scaling = "fill";
    };
  };
}
