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
	  # cursor_trail_decay = "0.08 0.25";
	  # cursor_trail_start_threshold = 0;
	};
	font = {
	  name = "JetBrainsMonoNerdFontMono";
	  size = 13;
	};
      };
    };
  };
}
