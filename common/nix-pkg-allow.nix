{config, ...}:

{
    nixpkgs.config = {
        allowBroken = false;
        allowUnfree = true;
    };
}
