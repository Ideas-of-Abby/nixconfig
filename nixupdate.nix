with import <nixpkgs> {};
    
writeShellScriptBin "nixupdate" ''
	read -p "do you want to commit? [Y/N]" committing
	if [$committing == "Y" ]; then
	git add .
	IFS="\n" read -p "enter commit message : " commit_message
	git commit -m "$commit_message"
	git push -u origin main ]
	else
	echo "not committing changes"
	fi
	sudo nix flake update; sudo nixos-rebuild switch --flake --impure
	''
