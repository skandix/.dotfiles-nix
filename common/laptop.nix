{ config, ... }:

{
  programs.light = {
    enable = true;
    brightnessKeys = {
      enable = true;
      step = 5;
    };
  };

  services = {
    libinput = {
      enable = true;
      touchpad = {
        disableWhileTyping = true;
      };
    };

    tlp = {
      enable = true;
      settings = {
        CPU_SCALING_GOVERNOR_ON_BAT = "powersave";
        CPU_ENERGY_PERF_POLICY_ON_BAT = "power";
        CPU_MIN_PERF_ON_BAT = 0;
        CPU_MAX_PERF_ON_BAT = 20;

        CPU_SCALING_GOVERNOR_ON_AC = "performance";
        CPU_ENERGY_PERF_POLICY_ON_AC = "performance";
        CPU_MIN_PERF_ON_AC = 0;
        CPU_MAX_PERF_ON_AC = 100;

        # Optional helps save long term battery health
        START_CHARGE_THRESH_BAT0 = 40; # 40 and below it starts to charge
        STOP_CHARGE_THRESH_BAT0 = 80;  # 80 and above it stops charging
      };
    };

    logind = {
      settings = {
        Login = {
          HandleLidSwitchDocked = "ignore";
          HandleLidSwitchExternalPower = "suspend";
          HandleLidSwitch = "suspend";
        };
      };
    };

    thermald = {
      enable = true;
    };
  };

  powerManagement = {
    enable = true;
    powertop = {
      enable = true;
    };
  };

}
