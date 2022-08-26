{ config, pkgs, nix-doom-emacs, ... }:

{ home-manager = {
  useGlobalPkgs = true;
  useUserPackages = true;

  users.unnamed = {
    imports = [
      nix-doom-emacs.hmModule
      ./chrome.nix
      ./direnv.nix
      ./discord.nix
      ./element.nix
      ./emacs.nix
      ./firefox.nix
      ./gimp.nix
      ./git.nix
      ./gpg.nix
      ./graphviz.nix
      ./i3.nix
      ./keepassxc.nix
      ./kitty.nix
      ./lutris.nix
      ./mpv.nix
      ./obs-studio.nix
      ./secrets.nix
      ./shell.nix
      ./spotify.nix
      ./themes.nix
      ./ts3client.nix
      ./webstorm.nix
    ];

    home.keyboard.layout = "eu";
    home.stateVersion = "22.05";
  };
}; }
