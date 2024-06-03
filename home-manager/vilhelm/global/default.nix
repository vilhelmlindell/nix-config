# This is your home-manager configuration file
# Use this to configure your home environment (it replaces ~/.config/nixpkgs/home.nix)
{
  inputs,
  outputs,
  lib,
  config,
  system,
  pkgs,
  ...
}: {
  # You can import other home-manager modules here
  imports = [
    inputs.nix-colors.homeManagerModules.default

    ../features/cli
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
      allowUnfree = true;
      permittedInsecurePackages = [
        "electron-25.9.0"
      ];
    };
  };

  home = {
    username = "vilhelm";
    homeDirectory = "/home/vilhelm";
  };

  home.sessionVariables = {
    EDITOR = "nvim";
    BROWSER = "firefox";
    TERMINAL = "wezterm";
    NIX_STORE = "/nix/store";
    #STARCRAFT = "/home/vilhelm/.wine/drive_c/StarCraft/";
    #WINEARCH = "win64";
    #WINEPREFIX = "/home/vilhelm/.wine64";
  };

  # Add stuff for your user as you see fit:

  fonts.fontconfig.enable = true;

  home.packages = with pkgs; [
    # Fonts
    (pkgs.nerdfonts.override {fonts = ["JetBrainsMono" "IosevkaTerm"];})
    comic-mono
    font-awesome
    powerline-fonts
    powerline-symbols

    #inputs.nixvim.packages.${system}.default
    #intel-gpu-tools
    #steam
    #blueberry
    #immersed-vr
    #lutris
    #wireplumber
    #xclip

    # awesome cli tools
    #ripgrep
    #imagemagick
    #powertop
    #feh
    #fzf
    #neofetch
    #lshw
    #python3
    #maven
    #godot_4
    #(wineWowPackages.full.override {
    #  wineRelease = "staging";
    # mingwSupport = true;
    #)
    #winetricks
    #gcc
    #cmake
    #graphviz
    #linuxKernel.packages.linux_zen.perf
    #libreoffice
    #obsidian
    #cutechess
    zellij

    #(import ./scripts/nvidia-offload.nix {inherit pkgs;})
  ];

  programs = {
    home-manager.enable = true;
    git.enable = true;
  };

  # Nicely reload system units when changing configs
  systemd.user.startServices = "sd-switch";

  # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  home.stateVersion = "23.11";
}
