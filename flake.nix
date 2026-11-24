{
  description = "NixOS with Flake + Hyprland";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-unstable"; # For bleeding-edge packages :)
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };
  outputs = { nixpkgs, home-manager, ...  }: {
    nixosConfigurations.nixos-test = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      modules = [
        ./configuration.nix
        home-manager.nixosModules.home-manager
        {
          home-manager = {
            useGlobalPkgs = true;
            useUserPackages = true;
            users.pmo = import ./home.nix;
            backupFileExtension = "backup"; # This rename older app folder with <APP_NAME>.backup naming convension
          };
        }
      ];
    };
  };
}
