# Prerequisite
1. NixOS should be installed
2. Bootstrap configuration should have been generated using following command
   ```bash
   sudo nixos-generate-config --root /mnt
   ```
3. Copy Hardware Config to designated location
   ```bash
   sudo cp /mnt/etc/nixos/hardware-configuration.nix /etc/nixos/hardware-configuration.nix
   ```


# Commands
```bash
nix shell nixpkgs#curl nixpkgs#unzip --extra-experimental-features nix-command --extra-experimental-features flakes

mkdir -p ~/.config/nixos-config

curl -L https://github.com/papunmohanty/my_nixos_config/archive/refs/heads/main.zip -o my_nixos_config.zip

unzip -j my_nixos_config.zip -d ~/.config/nixos-config

sudo nixos-install --flake ~/.config/nixos-config#<HOSTNAME> --impure
#e.g.
sudo nixos-install --flake ~/.config/nixos-config#nixos-test --impure
```
