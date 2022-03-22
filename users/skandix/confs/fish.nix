{ pkgs, config, ...}:

{
  programs.fish = {
    enable = true;
    shellAliases = {
      "sprunge" = "curl -F 'sprunge=<-' http://sprunge.us";
      ".." = "cd ..";
      "ls" = "ls --color";
      "ip" = "ip -c";
      "nf" = "set a (pwd);cd && cd .nix-conf && vim && cd $a";
      "pressmd" = "reveal-md --theme solarized --highlight-theme solarized-dark ";
    };
    # Colors for shell, not sure if this is the prefered way to do it
    loginShellInit = ''
      set -U fish_color_normal normal
      set -U fish_color_command 009999
      set -U fish_color_quote 5CCCCC
      set -U fish_color_redirection BF7130
      set -U fish_color_end FFB273
      set -U fish_color_error FF7400
      set -U fish_color_param 33CCCC
      set -U fish_color_selection white --bold --background=brblack
      set -U fish_color_search_match bryellow --background=brblack
      set -U fish_color_history_current --bold
      set -U fish_color_operator 00a6b2
      set -U fish_color_escape 00a6b2
      set -U fish_color_cwd green
      set -U fish_color_cwd_root red
      set -U fish_color_valid_path --underline
      set -U fish_color_autosuggestion 006363
      set -U fish_color_user brgreen
      set -U fish_color_host normal
      set -U fish_color_cancel -r
      set -U fish_pager_color_completion normal
      set -U fish_pager_color_description B3A06D yellow
      set -U fish_pager_color_prefix white --bold --underline
      set -U fish_pager_color_progress brwhite --background=cyan
      set -U fish_color_match --background=brblue
      set -U fish_color_comment FF9640
    '';
    promptInit = ''
        pfetch
    '';
    plugins = [
      {
        name = "z";
        src = pkgs.fetchFromGitHub {
          owner = "jethrokuan";
          repo = "z";
          rev = "ddeb28a7b6a1f0ec6dae40c636e5ca4908ad160a";
          sha256 = "0c5i7sdrsp0q3vbziqzdyqn4fmp235ax4mn4zslrswvn8g3fvdyh";
        };
      }
      {
        name = "fzf";
        src = pkgs.fetchFromGitHub {
          owner = "jethrokuan";
          repo = "fzf";
          rev = "24f4739fc1dffafcc0da3ccfbbd14d9c7d31827a";
          sha256 = "0kz057nr07ybh0y06ww3p424rgk8pi84pnch9jzb040qqn9a8823";
        };
      }
    ];
  };

  programs.dircolors = {
    enable = true;
    enableFishIntegration = true;
  };
}
