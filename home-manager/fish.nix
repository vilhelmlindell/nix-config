{
  programs.fish = {
    enable = true;
    shellInit = ''
      set --erase fish_greeting
      zoxide init fish | source
    '';
  };
}
