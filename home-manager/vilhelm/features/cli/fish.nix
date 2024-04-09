{config, ...}: let
  zellij = import ./zellij/zellij.nix {inherit config;};
in {
  programs.fish = {
    enable = true;
    shellInit = ''
      set --erase fish_greeting
      zoxide init fish | source
      if set -q ZELLIJ
      else
        zellij --config ${zellij.configPath} --layout ${zellij.layoutPath}
      end
    '';
  };
}
