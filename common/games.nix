{config, pkgs, ...}:

{
    # STEAM
    hardware.opengl = {
        enable = true;
        driSupport32Bit = true;
        driSupport = true;
        extraPackages32 = with pkgs.pkgsi686Linux; [ libva  ];
        extraPackages = with pkgs; [
        rocm-opencl-icd
        rocm-opencl-runtime
        ];
    };
    hardware.pulseaudio.support32Bit = true;
    hardware.steam-hardware.enable = true;
    programs.steam.enable = true;

    # OTHER
    environment.systemPackages = with pkgs; [
        lutris-unwrapped
        wine-staging
        gamemode
        mangohud
    ];
}
