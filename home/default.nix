{ config, pkgs, nix-doom-emacs, ... }:

{ home-manager = {
  useGlobalPkgs = true;
  useUserPackages = true;

  users.unnamed = {
    imports = [
      nix-doom-emacs.hmModule
      ./emacs.nix
      ./firefox.nix
      ./i3.nix
      ./kitty.nix
      ./shell.nix
      ./themes.nix
    ];

    home.keyboard.layout = "eu";
    home.stateVersion = "22.05";
  };
}; }
