{ self, ... }:
{
  flake.nixosModules.kitty = {
    home-manager.users.${self.user} = {
      programs.kitty = {
        enable = true;
        extraConfig = "include themes/noctalia.conf";
        settings = {
          confirm_os_window_close = 0;
          cursor_trail = 1;
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
