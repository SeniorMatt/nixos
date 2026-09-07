{ self, inputs, ... }:
{
  flake.nixosModules.niri = { pkgs, ... }: {
    imports = [ self.nixosModules.noctalia ];

    programs.niri.enable = true;
    services.displayManager.ly = {
      enable = true;
      settings = {
	animation = "gameoflife";
	session_log = "null";
      };
    };

    security.soteria.enable = true;
    services.gnome.gnome-keyring.enable = true;

    environment.systemPackages = [
      (let pkgs = import inputs.nixpkgs-xwayland-satellite-0-8-1 { system = "x86_64-linux"; }; in pkgs.xwayland-satellite) # Downgrade xwayland-satellite to 0.8.1
    ];

    services.udisks2.enable = true;

    xdg.portal = {
      enable = true;
      extraPortals = with pkgs; [ xdg-desktop-portal-gtk ];
      config.niri = {
	"org.freedesktop.impl.portal.FileChooser" = [ "kde" ]; # or "gtk"
      };
    };

    environment.sessionVariables.NIXOS_OZONE_WL = "1";

    home-manager.users.matthew = {
      xdg.configFile."niri/config.kdl".source = ./config.kdl;
    };
  };
}
