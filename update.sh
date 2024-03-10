nix flake lock --update-input "nixvim"
sudo nixos-rebuild switch --upgrade --flake .#t480
home-manager switch --flake .#vilhelm@t480
git add *
git commit -m "update"
git push
