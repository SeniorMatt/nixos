{ inputs, self, ... }:
{
  flake.nixosModules.home-manager = {
    imports = [ inputs.home-manager.nixosModules.home-manager ];

    home-manager = {
      useGlobalPkgs = true;
      useUserPackages = true;
      extraSpecialArgs = { inherit inputs self; };
      backupFileExtension = "backup";

      users.matthew = {
        home.stateVersion = "26.05";
	programs.home-manager.enable = true;
      };
    };
  };
}
