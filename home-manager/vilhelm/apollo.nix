{
  inputs,
  lib,
  pkgs,
  system,
  ...
}: {
  imports = [
    ./global
    ./features/desktop/i3
    ./features/desktop/common
    ./features/games
  ];
}
