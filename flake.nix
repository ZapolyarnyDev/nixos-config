{

  description = "Zapolyarny's NixOS config";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.11";

    home-manager = {
      url = "github:nix-community/home-manager/release-25.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    inputs@{ nixpkgs, home-manager, ... }:
    let
      system = "x86_64-linux";
      pkgs = import nixpkgs { inherit system; };
    in
    {
      formatter.${system} = pkgs.nixfmt-tree;

      nixosConfigurations.zapolyarny-x380 = nixpkgs.lib.nixosSystem {
        inherit system;

        specialArgs = {
          inherit inputs;
        };

        modules = [
          ./hosts/zapolyarny-x380/configuration.nix

          home-manager.nixosModules.home-manager
          {
            home-manager = {
              useGlobalPkgs = true;
              useUserPackages = true;
              backupFileExtension = "backup";
              users.zapolyarny = import ./home/zapolyarny;
            };
          }
        ];
      };

    };
}
