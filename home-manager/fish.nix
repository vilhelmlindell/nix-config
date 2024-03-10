{
  programs.fish = {
    enable = true;
    shellInit = ''
      zoxide init fish | source
    '';
  };
}
