{ pkgs, ... }:

{
  services = {
    xserver.windowManager.i3.enable = true;

    pipewire = {
      enable = true;
      alsa.enable = true;
      pulse.enable = true;
    };

    dbus.enable = true;
  };

  programs.light.enable = true;

  xdg.portal = {
    enable = true;
    extraPortals = with pkgs; [ xdg-desktop-portal-gtk ];
    gtkUsePortal = true;
  };
}
