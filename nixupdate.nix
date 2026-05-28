with import <nixpkgs> {};
    
writeShellScriptBin "nixupdate" ''
	check_commit () {
	IFS="\n" read -p "do you want to commit? [y/n] " committing
	if [ "$committing" = "y" ]; then
		git add .
		IFS="\n" read -p "enter commit message : " commit_message
		git commit -m "$commit_message"
		git push -u origin main
	elif [ "$committing" = "n" ]; then
		echo not committing changes
	else
		check_commit
	fi
	}

	check_commit
	sudo nix flake update; sudo nixos-rebuild switch --flake --impure
	''
