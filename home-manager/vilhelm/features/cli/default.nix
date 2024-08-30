{
  inputs,
  system,
  pkgs,
  ...
}: {
  imports = [
    ./direnv.nix
    ./fish.nix
    ./git.nix
    ./starship.nix
    ./zellij
    ./zoxide.nix
  ];

  xdg.configFile.nvim.source = ./nvim;

  home.packages = with pkgs; [
    #inputs.nixvim.packages."x86_64-linux".default
    go
    nodejs_20
    dotnetCorePackages.sdk_8_0
    gcc
    neovim
    unzip
    ripgrep
    xclip
    python3
    mpv
    feh
    zathura
    bat
    eza
    #lsd
    #delta
    #dust
    duf
    broot
    fd
    ripgrep
    #ag
    fzf
    #mcfly
    #choose
    #jq
    #sd
    #cheat
    tldr
    bottom
    #glances
    #gtop
    #hyperfine
    #gping
    #procs
    #httpie
    #curlie
    #xh
    #dog
  ];
}
