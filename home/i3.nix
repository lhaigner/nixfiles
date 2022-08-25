{ lib, pkgs, ... }:

let
  mod = "Mod4";
in {
  xsession = {
    enable = true;

    windowManager.i3 = {
      enable = true;

      config = {
        modifier = mod;

        keybindings = lib.mkOptionDefault {
          "${mod}+t" = "exec ${pkgs.kitty}/bin/kitty";
        };
      };
    };
  };
}