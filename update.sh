git add *
git commit -m "update"
git push
nix flake lock --update-input "vilhelmlindell/nixvim-config"
