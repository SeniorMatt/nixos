{ self, ... }:
{
  flake.nixosModules.kitty = {
    home-manager.users.${self.user} = {
      programs.kitty = {
        enable = true;
        themeFile = "Catppuccin-Mocha";
        settings = {
          confirm_os_window_close = 0;
          cursor_trail = 1;
          remember_window_size = "no";
          initial_window_width = "91c";
          initial_window_height = "21c";
        };
        font = {
          name = "JetBrainsMonoNerdFontMono";
          size = 13;
        };
      };
    };
    environment.etc."xdg/kdeglobals".text = ''
      [General]
      TerminalApplication=kitty
      TerminalService=kitty.desktop
    '';
  };
}
