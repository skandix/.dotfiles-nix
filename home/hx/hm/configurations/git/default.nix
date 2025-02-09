{ pkgs, ... }:

{
  #home-manager.users.hx = {
  programs.git = {
    package = pkgs.gitAndTools.gitFull;
    enable = true;
    userName = "skandix";
    userEmail = "skandix@datapor.no";
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
      user.personal.email = "skandix@datapor.no";
    };
  };
  #};
}
