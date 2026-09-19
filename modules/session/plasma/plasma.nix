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
        source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/.nixos/modules/session/plasma/kglobalshortcutsrc";
        force = true;
      };
      qt = {
        enable = true;
        platformTheme.name = "kde";
        style.name = "breeze";
        kde.settings.kdeglobals = {
          General = {
            font = "Noto Sans, 11";
            fixed = "Hack, 11";
            menuFont = "Noto Sans, 11";
            toolBarFont = "Noto Sans, 11";
            smallestReadableFont = "Noto Sans, 10";
            taskbarFont = "NotoSans, 11";
          };
          WM.activeFont = "Noto Sans, 10";
        };
      };
      gtk = {
        enable = true;
        theme = {
          name = "Breeze";
          package = pkgs.kdePackages.breeze-gtk;
        };
        iconTheme = {
          name = "breeze";
          package = pkgs.kdePackages.breeze-icons;
        };
        font = {
          name = "Noto Sans";
          size = 10;
        };
      };
      home.pointerCursor = {
        enable = true;
        gtk.enable = true;
        package = pkgs.kdePackages.breeze;
        name = "breeze_cursors";
        size = 24;
      };
    };
  };
}
