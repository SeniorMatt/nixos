{ self, inputs, ... }:
{ 
  flake.nixosModules.noctalia = { pkgs, ... }: {
    environment.systemPackages = with pkgs; [ wl-clipboard btop kdePackages.qt6ct ];

    services.tuned.enable = true;
    services.upower.enable = true;

    nix.settings = {
      extra-substituters = [ "https://noctalia.cachix.org" ];
      extra-trusted-public-keys = [ "noctalia.cachix.org-1:pCOR47nnMEo5thcxNDtzWpOxNFQsBRglJzxWPp3dkU4=" ];
    };

    home-manager.users.${self.user} = {
      imports = [ inputs.noctalia.homeModules.default ];
      programs.noctalia = {
	enable = true;

	# Export coctalia's config, then run this command:
	# cd ~/ && nix run github:erooke/toml2nix noctalia-config.toml | wl-copy
	# and paste the results here.
	settings = {
	accessibility = {
		ui_scale = 1.0000000074505806;
	};
	backdrop = {
		enabled = true;
	};
	bar = {
		default = {
			background_opacity = 0.8499999810010195;
			margin_ends = 0;
			position = "left";
			radius_bottom_left = 0;
			radius_top_left = 0;
		};
	};
	location = {
		auto_locate = true;
	};
	lockscreen_widgets = {
		enabled = false;
		schema_version = 2;
		widget_order = [ "lockscreen-login-box@eDP-1" ];
		grid = {
			cell_size = 16;
			major_interval = 4;
			visible = true;
		};
		widget = {
			"lockscreen-login-box@eDP-1" = {
				box_height = 196.0;
				box_width = 810.0;
				cx = 960.0;
				cy = 898.0;
				output = "eDP-1";
				placement_height = 1080.0;
				placement_width = 1920.0;
				rotation = 0.0;
				type = "login_box";
				settings = {
					background_color = "surface_variant";
					background_opacity = 0.88;
					background_radius = 12.0;
					center_password_text = false;
					input_opacity = 1.0;
					input_radius = 6.0;
					layout = "regular";
					show_caps_lock = true;
					show_keyboard_layout = true;
					show_login_button = true;
					show_media = true;
					show_session_buttons = true;
					show_unlock_hint = true;
					show_weather = true;
				};
			};
		};
	};
	nightlight = {
		enabled = true;
	};
	shell = {
		font_family = "JetBrainsMono Nerd Font Mono";
		niri_overview_type_to_launch_enabled = true;
	};
	theme = {
		builtin = "Catppuccin";
		community_palette = "Oxocarbon";
		mode = "dark";
		source = "wallpaper";
		wallpaper_scheme = "soft";
		templates = {
			builtin_ids = [ "gtk3" "gtk4" "kcolorscheme" "kitty" "niri" "qt" ];
			community_ids = [ "pywalfox-beta4" "discord" ];
			user = {
				wal = {
					input_path = "$XDG_CONFIG_HOME/noctalia/templates/wal.json";
					output_path = "$XDG_CACHE_HOME/wal/colors.json";
				};
				wal_vim = {
					input_path = "$XDG_CONFIG_HOME/noctalia/templates/colors-wal.vim";
					output_path = "$XDG_CACHE_HOME/wal/colors-wal.vim";
				};
			};
		};
	};
	wallpaper = {
		default = {
			path = "/home/matthew/Pictures/nature.jpg";
		};
		last = {
			path = "/home/matthew/Pictures/nature.jpg";
		};
		monitors = {
			eDP-1 = {
				path = "/home/matthew/Pictures/nature.jpg";
			};
		};
	};
	};
      };

      xdg.configFile = {
	"noctalia/templates/colors-wal.vim".text = ''
	  let g:background = "{{ colors.terminal_background.default.hex }}"
	  let g:foreground = "{{ colors.terminal_foreground.default.hex }}"
	  let g:cursor     = "{{ colors.terminal_cursor.default.hex }}"
	  let g:color0  = "{{ colors.terminal_normal_black.default.hex }}"
	  let g:color1  = "{{ colors.terminal_normal_red.default.hex }}"
	  let g:color2  = "{{ colors.terminal_normal_green.default.hex }}"
	  let g:color3  = "{{ colors.terminal_normal_yellow.default.hex }}"
	  let g:color4  = "{{ colors.terminal_normal_blue.default.hex }}"
	  let g:color5  = "{{ colors.terminal_normal_magenta.default.hex }}"
	  let g:color6  = "{{ colors.terminal_normal_cyan.default.hex }}"
	  let g:color7  = "{{ colors.terminal_normal_white.default.hex }}"
	  let g:color8  = "{{ colors.terminal_bright_black.default.hex }}"
	  let g:color9  = "{{ colors.terminal_bright_red.default.hex }}"
	  let g:color10 = "{{ colors.terminal_bright_green.default.hex }}"
	  let g:color11 = "{{ colors.terminal_bright_yellow.default.hex }}"
	  let g:color12 = "{{ colors.terminal_bright_blue.default.hex }}"
	  let g:color13 = "{{ colors.terminal_bright_magenta.default.hex }}"
	  let g:color14 = "{{ colors.terminal_bright_cyan.default.hex }}"
	  let g:color15 = "{{ colors.terminal_bright_white.default.hex }}"
	'';
	"noctalia/templates.toml".text = ''
	  [theme.templates.user.wal]
	  input_path  = "$XDG_CONFIG_HOME/noctalia/templates/wal.json"
	  output_path = "$XDG_CACHE_HOME/wal/colors.json"

	  [theme.templates.user.wal_vim]
	  input_path  = "$XDG_CONFIG_HOME/noctalia/templates/colors-wal.vim"
	  output_path = "$XDG_CACHE_HOME/wal/colors-wal.vim"
	'';
      };

      qt = {
	enable = true;

	# Use Breeze.
	platformTheme.name = "kde";
	style.name = "breeze";

	# Use QT.
	# platformTheme.name = "qtct";
        # qt6ctSettings.Appearance = {
	#   style = "Fusion";
	#   custom_palette = true;
	#   color_scheme_path = "/home/matthew/.config/qt6ct/colors/noctalia.conf";
	#   icon_theme = "breeze-dark";
	# };
      };
      gtk = {
        enable = true;
	theme = {
	  name = "adw-gtk3";
	  package = pkgs.adw-gtk3;
	};
	iconTheme = {
	  name = "Adwaita";
	  package = pkgs.adwaita-icon-theme;
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
