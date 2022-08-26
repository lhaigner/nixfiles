{ config, lib, pkgs, ... }:

{
  gtk = {
    enable = true;

    theme = {
      package = pkgs.dracula-theme;
      name = "Dracula";
    };
  };
}
