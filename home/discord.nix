{ pkgs, ... }:

{
  home.packages = [ (pkgs.discord.override { nss = pkgs.nss_latest; }) ];
}
