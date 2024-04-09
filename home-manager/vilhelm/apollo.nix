{
  inputs,
  lib,
  pkgs,
  ...
}: {
  imports = [
    ./global
    ./features/desktop/i3
    ./features/desktop/common
  ];
}
