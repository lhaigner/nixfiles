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

          "XF86MonBrightnessDown" = "exec ${pkgs.light}/bin/light -T 0.72";
          "XF86MonBrightnessUp" = "exec ${pkgs.light}/bin/light -T 1.4";

          "XF86AudioPlay" = "exec ${pkgs.playerctl}/bin/playerctl play-pause";
          "XF86AudioStop" = "exec ${pkgs.playerctl}/bin/playerctl stop";
          "XF86AudioNext" = "exec ${pkgs.playerctl}/bin/playerctl next";
          "XF86AudioPrev" = "exec ${pkgs.playerctl}/bin/playerctl previous";

          "XF86AudioMute" = "exec ${pkgs.pamixer}/bin/pamixer -t";
          "XF86AudioRaiseVolume" = "exec ${pkgs.pamixer}/bin/pamixer -i 5";
          "XF86AudioLowerVolume" = "exec ${pkgs.pamixer}/bin/pamixer -d 5";
        };
      };
    };
  };

  services.picom = {
    enable = true;
    vSync = true;
    blur = true;
  };

  i18n.inputMethod = {
    enabled = "fcitx5";
    fcitx.engines = with pkgs.fcitx-engines; [ mozc ];
  };

  home.packages = with pkgs; [
    playerctl
  ];

  home.sessionVariables = {
    "_JAVA_AWT_WM_NONREPARENTING" = "1";
  };
}
