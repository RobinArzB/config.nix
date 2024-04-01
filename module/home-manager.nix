{ pkgs, ... }: {
  # add home-manager user settings here
  home.packages = with pkgs; [
    fd
    gnused
    ripgrep
    tree
    wget
    cloc
    jq
    yq-go
    bat
    watch
    btop
    watch
    k9s
    kubectl
    asciinema
    gopls
    nodejs
    reveal-md
    sops
    age
    dig
    slides
    pass
    tldr
    gh
    doppler
    cachix
    terraform
    opentofu
    just
    ocaml
    python3
    uv
    lua51Packages.lua
    azure-cli
    raycast
    pwgen
    wireguard-tools
  ];

  home.stateVersion = "23.11";

  programs.direnv = {
    enable = true;
    enableZshIntegration = true;
    nix-direnv.enable = true;
  };

  programs.zsh = {
    enable = true;
    enableAutosuggestions = true;
    enableCompletion = true;
    shellAliases = import ../config/zsh/aliases.nix;
    syntaxHighlighting = {
      enable = true;
    };
    completionInit = ''
      bindkey '^ ' autosuggest-accept
      bindkey '^n' autosuggest-accept
    '';
  };

  programs.starship = {
    enable = true;
    enableZshIntegration = true;
  };

  programs.fzf = {
    enable = true;
    enableZshIntegration = true;
  };

  programs.tmux = {
    enable = true;
    terminal = "xterm-256color";
    extraConfig = builtins.readFile ../config/tmux/tmux.conf;
  };

  programs.git = {
    enable = true;
    userName = "RobinArzB";
    userEmail = "robin.arzinierebaffert@gmail.com";
    delta.enable = true;
    extraConfig = {
      color.ui = true;
      core.editor = "nvim";
      gpg.format = "ssh";
      init.defaultBranch = "master";
      pull.rebase = true;
      user.signingkey = "~/.ssh/id_ed25519.pub";
    };
  };

  programs.atuin = {
    enable = true;
    enableZshIntegration = true;
  };

  programs.go = {
    enable = true;
    goPath = "code/go";
  };
}
