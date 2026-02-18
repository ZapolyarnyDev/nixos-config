{
	description = "Zapolyarny's NixOS config";
	
	inputs = {
		nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
		home-manager.url = "github:nix-community/home-manager";
		home-manager.inputs.nixpkgs.follows = "nixpkgs";
	};

	outputs = { self, nixpkgs, home-manager, ... }:
	let
		system = "x86_64-linux";
	in {
		nixosConfigurations.zapolyarny-x380 = nixpkgs.lib.nixosSystem {
			inherit system;
			
			modules = [
				./hosts/zapolyarny-x380/configuration.nix
			
				home-manager.nixosModules.home-manager {
					home-manager.useGlobalPkgs = true;
					home-manager.useUserPackages = true;
					home-manager.users.zapolyarny = import ./home/zapolyarny.nix;
				}
			];
		};
	};
}
