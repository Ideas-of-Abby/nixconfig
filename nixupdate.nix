{pkgs, inputs, ...}: 
{
	environment.systemPackages = with pkgs; [
		import (writeShellScriptBin "nixupdate" ''
		git add .
		read -sp "enter commit message : " commit_message
		git commit -m $commit_message
		git push -u origin main
		sudo nix flake update; sudo nixos-rebuild switch --flake
		'')
	];
}
