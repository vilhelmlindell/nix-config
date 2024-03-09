# This is your home-manager configuration file
# Use this to configure your home environment (it replaces ~/.config/nixpkgs/home.nix)
{
  inputs,
  outputs,
  lib,
  config,
  pkgs,
  ...
}: 
{
  # You can import other home-manager modules here
  imports = [
    inputs.nix-colors.homeManagerModules.default

    ./wezterm.nix
    ./i3.nix
    ./git.nix
    ./firefox.nix
    ./fish.nix
    ./starship.nix
    ./i3status-rust.nix
  ];

  #colorScheme = inputs.nix-colors.colorSchemes.catppuccin-mocha;
  colorScheme = inputs.nix-colors.colorSchemes.${outputs.colorScheme};
  #colorschemeTomlPath = colorschemeTomlPath;

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
      allowUnfreePredicate = _: true;
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
  };

  #home.file.${colorschemeTomlPath}.text = colorschemeToml;
  #home.file."test.txt" = "Jag gillar bananer";

  # Add stuff for your user as you see fit:

  fonts.fontconfig.enable = true;

  home.packages = with pkgs; [ 
    # Fonts
    (pkgs.nerdfonts.override { fonts = [ "JetBrainsMono" "NerdFontsSymbolsOnly"]; })
    font-awesome
    powerline-fonts
    powerline-symbols

    inputs.nixvim.packages.${system}.default
    intel-gpu-tools
    xclip

    wireplumber
    powertop
    neofetch
    zoxide

    steam 
  ];

  # Enable home-manager
  programs.home-manager.enable = true;

  # Nicely reload system units when changing configs
  systemd.user.startServices = "sd-switch";

  # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  home.stateVersion = "23.11";
}

