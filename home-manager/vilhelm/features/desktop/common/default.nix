{pkgs, ...}: {
  imports = [
    ./wezterm.nix
    ./firefox.nix
  ];
  home.packages = with pkgs; [
    brightnessctl
    #jetbrains.idea-ultimate
  ];
}
