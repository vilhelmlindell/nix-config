{pkgs, ...}: {
  imports = [
    ./wezterm.nix
    ./firefox.nix
  ];
  home.packages = with pkgs; [
    brightnessctl
    cutechess
    immersed-vr
    #jetbrains.idea-ultimate
  ];
}
