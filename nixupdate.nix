with import <nixpkgs> {};
    
writeShellScriptBin "nixupdate" ''
	git add .
	IFS="\n" read -p "enter commit message : " commit_message
	git commit -m ${#commit_message}
	git push -u origin main
	sudo nix flake update; sudo nixos-rebuild switch --flake --impure
	''
