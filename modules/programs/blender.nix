{ self, ... }:
{
  flake.nixosModules.blender = { pkgs, ... }: {
    environment.systemPackages = with pkgs; [ blender ];
    home-manager.users.${self.user} = {
      xdg.configFile."blender/5.2/scripts/startup/vse_ripple_cut.py".source = ./ripple-cut-script.py;
    };
  };
}
