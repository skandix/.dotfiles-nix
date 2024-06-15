{ pkgs, ... }:

{
  programs.git = {
    package = pkgs.unstable.gitAndTools.gitFull;
    enable = true;
    extraConfig = {
      core.editor = "vim";
      init.defaultBranch = "main";
      pull.rebase = true;
      push.autoSetupRemote = true;
      rebase.autosquash = true;
      commit.verbose = true;
      diff.algorithm = "histogram";
      url."ssh://git@github.com:".insteadOf = "git://github.com";
      rerere.enabled = true;
      # identities
      user.useConfigOnly = true;
      user.personal.name = "Bendik Dyrli";
      user.personal.email = "bendik.dyrli@gmail.com";
      user.personal.signingkey = "";
      user.work.name = "Bendik Dyrli";
      user.work.email = "bendik.dyrli@uia.no";
      user.work.signingkey = "";
    };
  };
}