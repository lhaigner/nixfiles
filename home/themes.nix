{ config, lib, pkgs, ... }:

{
  home.packages = [ pkgs.libsForQt5.qtstyleplugin-kvantum ];

  gtk = {
    enable = true;

    theme = {
      package = pkgs.dracula-theme;
      name = "Dracula";
    };
  };

  qt = {
    enable = true;
    platformTheme = "gtk";

    style = {
      package = pkgs.dracula-theme;
      name = "Dracula";
    };
  };

  home.sessionVariables = {
    QT_STYLE_OVERRIDE = "kvantum";
  };
}
