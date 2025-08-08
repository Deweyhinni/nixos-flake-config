{
  description = "A very basic flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nixvim-config = {
      url = "github:deweyhinni/nixvim-config";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nixos-hardware = {
      url = "github:NixOS/nixos-hardware/master";
    };
    nix-flatpak.url = "github:gmodena/nix-flatpak";
  };

  outputs = { self, nixpkgs, home-manager, nixvim-config, nixos-hardware, nix-flatpak }@inputs:
    let
      system = "x86_64-linux";
      pkgs = import nixpkgs {
        inherit system;
	config.allowUnfree = true;
      };
      lib = nixpkgs.lib;
      desktopEnvironment = "cosmic";
      desktopModule = import ./desktops/${desktopEnvironment}.nix;
    in {
      nixosConfigurations = {
        deweyhinni-nixos = lib.nixosSystem {
	  inherit system;
	  modules = [ ./configuration.nix
	    home-manager.nixosModules.home-manager {
	      home-manager.useGlobalPkgs = true;
	      home-manager.useUserPackages = true;
              home-manager.users.deweyhinni = import ./home/home.nix;
	      home-manager.extraSpecialArgs = {inherit inputs system;};
	    }
	    desktopModule
	    ./boot/boot-desktop.nix
	    ./hardware-configs/hardware-config-desktop.nix
	  ];

	};
	deweyhinni-laptop = lib.nixosSystem {
	  inherit system;
	  modules = [
	    ./configuration.nix
	    home-manager.nixosModules.home-manager {
	      home-manager.useGlobalPkgs = true;
	      home-manager.useUserPackages = true;
              home-manager.users.deweyhinni = import ./home/home.nix;
	      home-manager.extraSpecialArgs = {inherit inputs system;};
	    }
	    ./desktops/gnome.nix
	    ./boot/boot-laptop.nix
	    ./hardware-configs/hardware-config-laptop.nix
	    nixos-hardware.nixosModules.asus-zephyrus-ga401
	  ];
	};
      }; 
    };
}
