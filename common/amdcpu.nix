{ config, ... }:

{
  hardware.cpu.amd = {
    updateMicrocode = true;
    sev.enable = true;
  };
}
