{ config, pkgs, nix-doom-emacs, ... }:

{ home-manager = {
  useGlobalPkgs = true;
  useUserPackages = true;

  users.unnamed = {
    imports = [
      nix-doom-emacs.hmModule
      ./emacs.nix
      ./firefox.nix
      ./git.nix
      ./gpg.nix
      ./i3.nix
      ./mpv.nix
      ./secrets.nix
      ./shell.nix
      ./themes.nix
    ];

    home.packages = with pkgs; [
      cloudflare-warp
      google-chrome
      (discord.override { nss = nss_latest; })
      element-desktop
      gimp
      keepassxc
      lutris
      spotify
      teamspeak_client
      jetbrains.webstorm
    ];

    programs = {
      direnv.enable = true;
      fzf.enable = true;
      kitty.enable = true;
      obs-studio.enable = true;
    };

    home.keyboard.layout = "eu";
    home.stateVersion = "22.05";
  };
}; }
