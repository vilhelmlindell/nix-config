# This is your home-manager configuration file
# Use this to configure your home environment (it replaces ~/.config/nixpkgs/home.nix)
{
  inputs,
  outputs,
  lib,
  config,
  pkgs,
  ...
}: let
  zellijConfig = import ./zellij.nix {inherit config;};
  i3statusColorScheme = import ./i3/colorscheme.nix {inherit config;};
in {
  # You can import other home-manager modules here
  imports = [
    inputs.nix-colors.homeManagerModules.default

    ./wezterm.nix
    ./i3/i3.nix
    ./i3/i3status-rust.nix
    ./git.nix
    ./firefox.nix
    ./fish.nix
    ./starship.nix
    ./direnv.nix
    ./zoxide.nix
  ];

  colorScheme = inputs.nix-colors.colorSchemes.catppuccin-mocha;

  nixpkgs = {
    # You can add overlays here
    overlays = [
      # Add overlays your own flake exports (from overlays and pkgs dir):
      outputs.overlays.additions
      outputs.overlays.modifications
      outputs.overlays.unstable-packages

      # You can also add overlays exported from other flakes:
      # neovim-nightly-overlay.overlays.default

      # Or define it inline, for example:
      # (final: prev: {
      #   hi = final.hello.overrideAttrs (oldAttrs: {
      #     patches = [ ./change-hello-to-hi.patch ];
      #   });
      # })
    ];
    # Configure your nixpkgs instance
    config = {
      # Disable if you don't want unfree packages
      allowUnfree = true;
      # Workaround for https://github.com/nix-community/home-manager/issues/2942
      permittedInsecurePackages = [
        "electron-25.9.0"
      ];
    };
  };

  # TODO: Set your username
  home = {
    username = "vilhelm";
    homeDirectory = "/home/vilhelm";
  };

  home.sessionVariables = {
    EDITOR = "nvim";
    BROWSER = "firefox";
    TERMINAL = "wezterm";
    NIX_STORE = "/nix/store";
    STARCRAFT = "/home/vilhelm/.wine/drive_c/StarCraft/";
    #WINEARCH = "win64";
    #WINEPREFIX = "/home/vilhelm/.wine64";
  };

  home.file.${zellijConfig.configPath}.text = zellijConfig.configKdl;
  home.file.${zellijConfig.layoutPath}.text = zellijConfig.layoutKdl;
  home.file.${i3statusColorScheme.path}.text = i3statusColorScheme.toml;

  # Add stuff for your user as you see fit:

  fonts.fontconfig.enable = true;

  home.packages = with pkgs; [
    # Fonts
    (pkgs.nerdfonts.override {fonts = ["JetBrainsMono" "NerdFontsSymbolsOnly"];})
    font-awesome
    powerline-fonts
    powerline-symbols

    inputs.nixvim.packages.${system}.default
    intel-gpu-tools
    steam
    blueberry
    immersed-vr
    lutris
    wireplumber
    xclip

    # awesome cli tools
    ripgrep
    imagemagick
    powertop
    feh
    fzf
    neofetch
    lshw
    python3
    maven
    godot_4
    (wineWowPackages.full.override {
      wineRelease = "staging";
      mingwSupport = true;
    })
    winetricks
    gcc
    cmake
    graphviz
    linuxKernel.packages.linux_zen.perf
    libreoffice
    obsidian
    cutechess
    zellij

    (import ./scripts/nvidia-offload.nix {inherit pkgs;})
  ];

  # Enable home-manager
  programs.home-manager.enable = true;

  # Nicely reload system units when changing configs
  systemd.user.startServices = "sd-switch";

  # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  home.stateVersion = "23.11";
}
