{pkgs, ...}: {
  imports = [
    ./wezterm.nix
    ./firefox.nix
  ];
  home.packages = with pkgs; [
    brightnessctl
    cutechess
    #jetbrains.idea-ultimate
  ];
}
