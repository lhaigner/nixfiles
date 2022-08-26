{ config, pkgs, ... }:

{
  imports =
    [
      ./hardware-configuration.nix
      ./i3-configuration.nix
    ];

  fileSystems."/mnt/Shared" =
    { device = "/dev/disk/by-uuid/62BF-B103";
      fsType = "exfat";
      options = [ "uid=1000" "gid=100" ];
    };

  boot = {
    loader = {
      systemd-boot.enable = true;

      efi = {
        canTouchEfiVariables = true;
        efiSysMountPoint = "/boot/efi";
      };
    };

    kernelParams = [ "mitigations=off" ];
  };

  networking = {
    networkmanager.enable = true;
    hostName = "nixos";
  };

  time = {
    timeZone = "Europe/Vienna";
    hardwareClockInLocalTime = true;
  };

  i18n = {
    defaultLocale = "en_US.utf8";

    extraLocaleSettings = {
      LC_ADDRESS = "de_AT.utf8";
      LC_IDENTIFICATION = "de_AT.utf8";
      LC_MEASUREMENT = "de_AT.utf8";
      LC_MONETARY = "de_AT.utf8";
      LC_NAME = "de_AT.utf8";
      LC_NUMERIC = "de_AT.utf8";
      LC_PAPER = "de_AT.utf8";
      LC_TELEPHONE = "de_AT.utf8";
      LC_TIME = "de_AT.utf8";
    };
  };

  services.xserver = {
    enable = true;

    libinput = {
      enable = true;

      mouse = {
        naturalScrolling = true;
      };

      touchpad = {
        naturalScrolling = true;
      };
    };

    layout = "us";
    displayManager.lightdm.enable = true;
  };

  users.users.unnamed = {
    isNormalUser = true;
    description = "Unnamed";
    initialPassword = "asdf";
    extraGroups = [ "libvirtd" "networkmanager" "video" "wheel" ];
  };

  services.getty.autologinUser = "unnamed";

  nixpkgs.config.allowUnfree = true;

  services.flatpak.enable = true;

  environment.systemPackages = with pkgs; [
    appimage-run
    file
    killall
    nix-prefetch-git
    p7zip
    steam-run
    # tor-browser-bundle-bin # Fails to fetch :thonk:
    # trackma-gtk # Somehow doesn't exist
    veracrypt
    virt-manager
    wget
  ];

  fonts.fonts = with pkgs; [
    fira-code
    fira-code-symbols
    font-awesome
    twemoji-color-font
  ];

  virtualisation.libvirtd.enable = true;

  programs.dconf.enable = true;

  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true;
    dedicatedServer.openFirewall = true;
  };

  services.pcscd.enable = true;
  services.openssh.enable = true;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "22.05"; # Did you read the comment?
}
