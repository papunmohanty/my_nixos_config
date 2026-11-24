{ config, lib, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      /etc/nixos/hardware-configuration.nix
    ];

  # Use the systemd-boot EFI boot loader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "nixos-test";

  # Configure network connections interactively with nmcli or nmtui.
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "Asia/Kolkata";
  
  # Enable Flake
  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];
 
  
  environment.sessionVariables = {
    WLR_RENDERER_ALLOW_SOFTWARE = "1";
    LIBGL_ALWAYS_SOFTWARE = "1";
    WLR_NO_HARDWARE_CURSORS = "1";
  };

 
  # Allow unfree packages system wide
  nixpkgs.config.allowUnfree = true;  # (WARNING): Only for testing purpose. Choose per-package unfree config & install


  #services.getty.autologinUser = "pmo";
  

  users.users.pmo = {
    isNormalUser = true;
    extraGroups = ["wheel"];
    packages = with pkgs; [
      tree
      vim
      helix
      vscode
      fastfetch
    ];
  };

  # programs.firefox.enable = true;
  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
    withUWSM = true;
  };
  
  programs.firefox.enable = true;

  # List packages installed in system profile.
  # You can use https://search.nixos.org/ to find more packages (and options).
  environment.systemPackages = with pkgs; [
    #Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
    wget
    curl
    foot
    kitty
    waybar
    git
    hyprpaper
  ];

  system.stateVersion = "26.05"; # Did you read the comment?
}
