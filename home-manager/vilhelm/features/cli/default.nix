{
  inputs,
  system,
  pkgs,
  ...
}: {
  imports = [
    ./direnv.nix
    ./fish.nix
    ./git.nix
    ./starship.nix
    ./zellij
    ./zoxide.nix
  ];

  home.packages = with pkgs; [
    inputs.nixvim.packages."x86_64-linux".default
    ripgrep
    xclip
    python3
  ];
}
