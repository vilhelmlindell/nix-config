{
  inputs,
  system,
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

  home.packages = [
    inputs.nixvim.packages.${system}.default
  ];
}
