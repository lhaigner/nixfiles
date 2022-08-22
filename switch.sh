#!/usr/bin/env bash
echo Not implemented yet.
exit 1

# Exit if git not found

# Set git user if unset
git config --local user.name  'Nobody'
git config --local user.email 'nobody@localhost.localdomain'

# Patch hardware configuration
cp /etc/nixos/hardware-configuration.nix nixos/hardware-configuration.nix
git add nixos/hardware-configuration.nix

# if efi
git apply < patches/efi.patch
# else
git apply < patches/bios.patch

git commit -m 'Patch hardware configuration'
nixos-rebuild switch --flake '.#'
