{ inputs, ... }:
{
  flake.nixosModules.davinci-resolve = {
    environment.systemPackages = [
      (
        let
          pkgs = import inputs.nixpkgs-stable {
            system = "x86_64-linux";
            config.allowUnfree = true;
          };
        in
        pkgs.davinci-resolve
      )
    ];
  };
}
