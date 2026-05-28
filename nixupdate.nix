with import <nixpkgs> {};
    
writeShellScriptBin "nixupdate" ''
	read -p "do you want to commit? [Y/N]" committing
	if $committing = "Y" [
	git add .
	IFS="\n" read -p "enter commit message : " commit_message
	git commit -m "$commit_message"
	git push -u origin main ]
	sudo nix flake update; sudo nixos-rebuild switch --flake --impure
	''
