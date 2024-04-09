{
  inputs,
  lib,
  pkgs,
  ...
}: {
  imports = [
    ./global
    ./features/desktop/i3
  ];
}
