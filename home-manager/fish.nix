{config, ...}: let
  zellijConfig = import ./zellij.nix {inherit config;};
in {
  programs.fish = {
    enable = true;
    shellInit = ''
      set --erase fish_greeting
      zoxide init fish | source
      if set -q ZELLIJ
      else
        zellij --config ${zellijConfig.configPath} --layout ${zellijConfig.layoutPath}
      end
    '';
  };
}
