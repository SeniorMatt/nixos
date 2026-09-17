{
  flake.nixosModules.plasma = { pkgs, ... }: {
    services = {
      desktopManager.plasma6.enable = true;
      displayManager.plasma-login-manager.enable = true;
    };
    xdg.dataFile."plasma/desktoptheme/default/translucent/colors".source =
      "${pkgs.kdePackages.libplasma}/share/plasma/desktoptheme/breeze-dark/colors";
  };
}
