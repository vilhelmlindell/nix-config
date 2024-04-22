{
  inputs,
  lib,
  pkgs,
  ...
}: {
  imports = [
    ./global
    ./features/desktop/common
    ./features/desktop/i3
    ./features/games
  ];
}
