{ ... }:

{
  programs.fzf = {
    enable = true;
    enableZshIntegration = true;
  };
  programs.zsh = {
    enable = true;
    enableCompletion = false;
    defaultKeymap = "emacs";

    antidote = {
      enable = true;
      plugins = [
        "trapd00r/LS_COLORS"
        "zsh-users/zsh-autosuggestions kind:defer post:_zsh_autosuggest_start"
        "zsh-users/zsh-history-substring-search kind:defer"
        "zdharma-continuum/fast-syntax-highlighting kind:defer"
      ];
    };
    history = {
      path = "$HOME/.histfile";
      size = 10000;
      save = 10000;
      extended = true;
      expireDuplicatesFirst = true;
      ignoreDups = true;
      ignoreSpace = true;
      share = true;
    };
    setOptions = [
      "AUTO_CD"
      "AUTO_PUSHD"
      "PUSHD_IGNORE_DUPS"
      "CORRECT"
    ];
    shellAliases = {
      # INTERACTION
      rm = "rm -i";
      cp = "cp -i";
      mv = "mv -i";
      ".." = "cd ..";

      # COLORS
      ip = "ip -c";
      ls = "ls --color";
      sl = "ls --color";
      cat = "bat --decorations never";
      grep = "grep --color=auto";
      egrep = "egrep --color=auto";
      fgrep = "fgrep --color=auto";

      # SRE
      k = "kubecolor";
      o = "openstack";
      t = "talosctl";
      tf = "tofu";
      dc = "docker compose";

      # MISC
      gname = "head -c 128 /dev/urandom | md5sum";
      gg = "lazygit";
    };

    localVariables = {
      REPORTTIME = 10;
    };
    initContent = ''
      bindkey '^[[H'    beginning-of-line
      bindkey '^[OH'    beginning-of-line
      bindkey '^[[1~'   beginning-of-line
      bindkey '^[[7~'   beginning-of-line
      bindkey '^[[F'    end-of-line
      bindkey '^[OF'    end-of-line
      bindkey '^[[4~'   end-of-line
      bindkey '^[[8~'   end-of-line

      bindkey '^[[3~'   delete-char
      bindkey '^[[1;5C' forward-word
      bindkey '^[[1;5D' backward-word

      zstyle ':completion:*' menu select
      zstyle ':completion:*' list-colors "''${("s.:.") LS_COLORS}"
      zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'

      _host_colors=(196 202 208 214 118 46 48 51 45 39 33 27 87 123)
      _sum=0
      for _c in ''${(s::)HOST}; do (( _sum += #_c )); done
      _host_color=''${_host_colors[$(( _sum % ''${#_host_colors} + 1 ))]}
      unset _sum _c

      PS1="%F{#ff10f0}%n%F{yellow}@%F{''${_host_color}}%m %B%F{#cc00ff}λ%f%b "
    '';
  };
  home = {
    sessionVariables = {
      COLORTERM = "truecolor";
    };
    sessionPath = [ "$HOME/.krew/bin" ];
  };
}
