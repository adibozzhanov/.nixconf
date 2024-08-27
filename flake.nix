{
  description = "My cool flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.05";
    home-manager.url = "github:nix-community/home-manager/release-24.05";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    nixos-hardware.url = "github:NixOS/nixos-hardware/master";
    hyprland.url = "github:hyprwm/Hyprland";
    hyprland-plugins = {
      url = "github:hyprwm/hyprland-plugins";
      inputs.hyprland.follows = "hyprland";
    };
  };

  outputs = { nixpkgs, home-manager, nixos-hardware, ... }@inputs:
    let
      system = "x86_64-linux";
    in {
      nixosConfigurations.hestia = nixpkgs.lib.nixosSystem {
        inherit system;
        modules = [
          ./nixos/configuration.nix
          nixos-hardware.nixosModules.asus-zephyrus-ga402
        ];
      };

      homeConfigurations.bzv = home-manager.lib.homeManagerConfiguration {
        pkgs = nixpkgs.legacyPackages.${system};
        extraSpecialArgs = {
          inherit inputs;
        };        
        modules = [
          ./home-manager/home.nix
        ];
      };
    };
}
