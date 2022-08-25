{ config, pkgs, nix-doom-emacs, ... }:

{ home-manager = {
  useGlobalPkgs = true;
  useUserPackages = true;

  users.unnamed = {
    imports = [
      nix-doom-emacs.hmModule
      ./emacs.nix
      ./i3.nix
      ./shell.nix
    ];
  };
}; }
