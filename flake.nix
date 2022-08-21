{
  description = "Build my laptop setup";

  inputs = {
    nixpkgs.url = github:nixos/nixpkgs/22.05;
  };

  outputs = { self, nixpkgs, ... }@inputs: {
    nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      specialArgs = inputs;
      modules = [ ./nixos/configuration.nix ];
    };
  };
}
