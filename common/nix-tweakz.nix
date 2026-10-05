{
  ...
}:

{

  services.fstrim.enable = true;
  documentation.nixos.enable = false;

  boot.tmp.useTmpfs = true;

  nix = {
    settings = {
      experimental-features = [
        "nix-command"
        "flakes"
      ];
      trusted-users = [
        "root"
        "hx"
      ];
    };

    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 7d";
    };

    optimise = {
      automatic = true;
    };
  };

  security.pam = {
    loginLimits = [
      {
        domain = "*";
        type = "soft";
        item = "nofile";
        value = "524288";
      }
    ];
  };
}
