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
      user = "frey";
      pkgs = import nixpkgs {
        inherit system;
	config.allowUnfree = true;
      };
      lib = nixpkgs.lib;
      desktopEnvironment = "cosmic";
      desktopModule = import ./desktops/${desktopEnvironment}.nix;
    in {
      nixosConfigurations = {
        frey-nixos = lib.nixosSystem {
	  inherit system;
	  specialArgs = {
            inherit user inputs system; 
	  };
	  modules = [ ./configuration.nix
	    {
	      environment.variables.NIXOS_CURRENT_CONFIG_NAME = "frey-nixos";
	      networking.hostName = "nixos-desktop";
	    }
	    home-manager.nixosModules.home-manager {
	      home-manager.useGlobalPkgs = true;
	      home-manager.useUserPackages = true;
              home-manager.users.${user} = import ./home/home.nix;
	      home-manager.extraSpecialArgs = {inherit inputs system user;};
	    }
	    desktopModule
	    ./boot/boot-desktop.nix
	    ./hardware-configs/hardware-config-desktop-2.nix
	  ];
	};
	frey-laptop = lib.nixosSystem {
	  inherit system;
	  specialArgs = {
	    inherit user inputs system;
	  };
	  modules = [
	    ./configuration.nix
	    {
	      environment.variables.NIXOS_CURRENT_CONFIG_NAME = "frey-laptop";
	      networking.hostName = "nixos-laptop";
	    }
	    home-manager.nixosModules.home-manager {
	      home-manager.useGlobalPkgs = true;
	      home-manager.useUserPackages = true;
              home-manager.users.${user} = import ./home/home.nix;
	      home-manager.extraSpecialArgs = {inherit inputs system user;};
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
