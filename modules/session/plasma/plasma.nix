{ self, ... }: 
{
  flake.nixosModules.plasma = { pkgs, ... }: {
    services = {
      desktopManager.plasma6.enable = true;
      displayManager.plasma-login-manager.enable = true;
    };
    home-manager.users.${self.user} = { config, ... }: {
      xdg.dataFile."plasma/desktoptheme/default/translucent/colors".source =
        "${pkgs.kdePackages.libplasma}/share/plasma/desktoptheme/breeze-dark/colors";
      xdg.configFile."kglobalshortcutsrc" = {
	source = config.lib.file.mkOutOfStoreSymlink "./kglobalshortcutsrc";
	force = true;
      };
    };
  };
}
