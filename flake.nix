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
  };

  outputs = { self, nixpkgs, home-manager, nixvim-config }@inputs:
    let
      system = "x86_64-linux";
      pkgs = import nixpkgs {
        inherit system;
	config.allowUnfree = true;
      };
      lib = nixpkgs.lib;
      desktopEnvironment = "sway";
      desktopModule = import ./desktops/${desktopEnvironment}.nix;
    in {
      nixosConfigurations = {
        deweyhinni-nixos = lib.nixosSystem {
	  inherit system;
	  modules = [ ./configuration.nix
	    home-manager.nixosModules.home-manager {
	      home-manager.useGlobalPkgs = true;
	      home-manager.useUserPackages = true;
              home-manager.users.deweyhinni = import ./home.nix;
	      home-manager.extraSpecialArgs = {inherit inputs system;};
	    }
	    desktopModule
	  ];

	};
      }; 
      hmConfig = {
        deweyhinni-nixos = home-manager.lib.homeManagerConfiguration {
	  inherit pkgs;
          modules = [
	    ./home.nix
	    {
	      home = {
	        username = "deweyhinni";
		homeDirectory = "/home/deweyhinni";
		stateVersion = "24.11";
              };
	    }
	  ];
	};
      };
    };
}
