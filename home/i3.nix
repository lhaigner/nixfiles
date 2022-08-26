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
          "${mod}+m" = "exec ${pkgs.emacs}/bin/emacsclient -c -a ${pkgs.emacs}/bin/emacs";
        };
      };
    };
  };

  services.picom = {
    enable = true;
    blur = true;
  };

  home.sessionVariables = {
    "_JAVA_AWT_WM_NONREPARENTING" = "1";
  };
}
