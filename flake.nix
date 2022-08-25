{
  description = "Build my laptop setup";

  inputs = {
    nixpkgs.url = github:nixos/nixpkgs/22.05;
    home-manager = {
      url = github:nix-community/home-manager/release-22.05;
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, home-manager, ... }@inputs: {
    nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      specialArgs = inputs;
      modules = [
        ./system/configuration.nix
        home-manager.nixosModules.home-manager { home-manager = {
          useGlobalPkgs = true;
          useUserPackages = true;
          users.unnamed = import ./home/default.nix;
        }; }
      ];
    };
  };
}
