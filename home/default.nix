{ config, pkgs, ... }:

{
  imports = [
    ./emacs.nix
  ];

  home.username = "unnamed";
  home.homeDirectory = "/home/unnamed";
  home.stateVersion = "22.05";
}
