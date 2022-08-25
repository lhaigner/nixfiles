{ pkgs, ... }:

{
  programs.doom-emacs = {
    enable = true;
    doomPrivateDir = ./emacs;
  };

  services.emacs = {
    enable = true;
  };
}
