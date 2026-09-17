{ self, inputs, ... }:
{
  flake.nixosModules.noctalia = { pkgs, ... }: {
    environment.systemPackages = with pkgs; [
      btop
      kdePackages.qt6ct
      wl-clipboard
    ];

    services.tuned.enable = true;
    services.upower.enable = true;

    nix.settings = {
      extra-substituters = [ "https://noctalia.cachix.org" ];
      extra-trusted-public-keys = [
        "noctalia.cachix.org-1:pCOR47nnMEo5thcxNDtzWpOxNFQsBRglJzxWPp3dkU4="
      ];
    };

    home-manager.users.${self.user} = {
      imports = [ inputs.noctalia.homeModules.default ];
      programs.noctalia = {
        enable = true;

        # Export noctalia's config, then run this command:
        # cd ~/ && nix run github:erooke/toml2nix noctalia-config.toml | wl-copy && rm noctalia-config.toml
        # and paste the results here.
        settings = {
          accessibility = {
            ui_scale = 1.0000000074505806;
          };
          audio = {
            enable_overdrive = true;
            enable_sounds = true;
          };
          backdrop = {
            enabled = true;
          };
          bar = {
            default = {
              background_opacity = 0.8499999810010195;
              capsule_radius = 0;
              center = [ "workspaces" ];
              concave_edge_corners = false;
              end = [
                "tray"
                "clipboard"
                "battery"
                "session"
              ];
              margin_ends = 0;
              position = "left";
              radius = 0;
              radius_bottom_left = 0;
              radius_top_left = 0;
              shadow = false;
              start = [ "clock" ];
            };
          };
          desktop_widgets = {
            schema_version = 2;
            widget_order = [ ];
            grid = {
              cell_size = 16;
              major_interval = 4;
              visible = true;
            };
          };
          keybinds = {
            down = [
              "Down"
              "Ctrl+j"
            ];
            left = [
              "Left"
              "Ctrl+h"
            ];
            right = [
              "Right"
              "Ctrl+l"
            ];
            up = [
              "Up"
              "Ctrl+k"
            ];
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
          plugin_settings = {
            "noctalia/translator" = {
              target_lang = "ru";
            };
          };
          plugins = {
            enabled = [ "noctalia/translator" ];
          };
          shell = {
            corner_radius_scale = 0.0;
            font_family = "JetBrainsMono Nerd Font Mono";
            niri_overview_type_to_launch_enabled = true;
            popup_shadows = false;
            launcher = {
              categories = false;
              show_icons = false;
              sort_by_usage = false;
            };
            panel = {
              shadow = false;
            };
          };
          theme = {
            builtin = "Catppuccin";
            community_palette = "Monochrome";
            mode = "dark";
            source = "wallpaper";
            wallpaper_scheme = "m3-monochrome";
            templates = {
              builtin_ids = [
                "gtk3"
                "gtk4"
                "kcolorscheme"
                "kitty"
                "niri"
                "qt"
              ];
              community_ids = [ "discord" ];
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
              path = "/home/matthew/Pictures/monochrome-fractal.png";
            };
            last = {
              path = "/home/matthew/Pictures/monochrome-fractal.png";
            };
            monitors = {
              eDP-1 = {
                path = "/home/matthew/Pictures/monochrome-fractal.png";
              };
            };
          };
          widget = {
            battery = {
              hide_when_plugged = true;
            };
            workspaces = {
              style = "minimal";
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
        package = pkgs.bibata-cursors;
        name = "Bibata-Modern-Classic";
        size = 24;
      };
    };
  };
}
