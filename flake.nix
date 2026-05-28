{
  description = "NixOS configuration with Noctalia";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    noctalia = {
      url = "github:noctalia-dev/noctalia-shell";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs@{ self, nixpkgs, ... }: {
    nixosConfigurations.tgirl-nix-swag = nixpkgs.lib.nixosSystem {
      specialArgs = { inherit inputs; };
      modules = [
	./configuration.nix
	./noctilia.nix
	./nixupdate.nix
      ];
    };
  };
}
