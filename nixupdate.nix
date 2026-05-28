writeShellScript "nixupdate" ''
read commit_message
git commit -m $commit_message
git push -u origin main
sudo nix flake update; sudo nixos-rebuild switch --flake
''
