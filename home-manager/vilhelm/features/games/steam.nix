{pkgs, ...}: let
  steam-with-packages = pkgs.steam.override {
    extraPkgs = pkgs:
      with pkgs; [
        xorg.libXcursor
        xorg.libXi
        xorg.libXinerama
        xorg.libXScrnSaver
        libpng
        libpulseaudio
        libvorbis
        stdenv.cc.cc.lib
        libkrb5
        keyutils
        gamescope
        mangohud
      ];
  };
in {
  home.packages = with pkgs; [
    steam-with-packages
    gamescope
    mangohud
    protontricks
  ];
}
