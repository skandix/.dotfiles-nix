{config, pkgs, ...}:

let
  relativeXDGConfigPath = ".config";
  relativeXDGDataPath = ".local/share";
  relativeXDGCachePath = ".cache";


  LS_COLORS = pkgs.fetchgit {
    url = "https://github.com/trapd00r/LS_COLORS";
    rev = "6fb72eecdcb533637f5a04ac635aa666b736cf50";
    sha256 = "0czqgizxq7ckmqw9xbjik7i1dfwgc1ci8fvp1fsddb35qrqi857a";
  };
  ls-colors = pkgs.runCommand "ls-colors" { } ''
    mkdir -p $out/bin $out/share
    ln -s ${pkgs.coreutils}/bin/ls $out/bin/ls
    ln -s ${pkgs.coreutils}/bin/dircolors $out/bin/dircolors
    cp ${LS_COLORS}/LS_COLORS $out/share/LS_COLORS
  '';

in {
    home.packages = [ ls-colors ];
    xdg.enable = true;
    xdg.configHome = "/home/skandix/${relativeXDGConfigPath}";
    xdg.dataHome = "/home/skandix/${relativeXDGDataPath}";
    xdg.cacheHome = "/home/skandix/${relativeXDGCachePath}";

    programs.home-manager.enable = true;
    programs.bat.enable = true;

    programs.neovim = {
        enable = true;
        vimAlias = true;
        # extraConfig = bultins.readFile "../../confs/vim/.vimrc"
        plugins = with pkgs.vimPlugins; [
            vim-nix
            nerdtree
            rust-vim
            vim-indent-guides
            nerdcommenter
            ctrlp
            polyglot
            vim-startify
            vim-json
            vim-better-whitespace
            lightline-vim
            ale
            vim-gitgutter
            lexima-vim
            vim-wakatime
            gruvbox
        ];
    };
}
