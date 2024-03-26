{pkgs}:
pkgs.writeShellScriptBin "wine64" ''
  export WINEARCH=win64
  export WINEPREFIX=$HOME/.wine-battlenet
  winetricks dxvk
''
