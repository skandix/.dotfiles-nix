{ pkgs, ... }:

{
  #home-manager.users.hx = {
  programs.git = {
    package = pkgs.gitFull;
    enable = true;
    userName = "hx";
    userEmail = "skandix.94@gmail.com";
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
      user.personal.name = "Bendik";
      user.personal.email = "hx@datapor.no";
    };
  };
  #};
}
