{pkgs, ...}: {
  imports = [
    ./i3.nix
    ./i3status-rust.nix
    ./picom.nix
  ];

  home.packages = with pkgs; [
    brightnessctl
  ];
}
