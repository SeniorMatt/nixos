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

    programs.dconf.enable = true;

    home-manager.users.${self.user} =
      let
	font = "JetBrainsMonoNerdFontMono";
      in
      {
        imports = [ inputs.noctalia.homeModules.default ];
        programs.noctalia = {
          enable = true;

	  # To export your current config:

          # Export noctalia's full effective config, then run this command
          # 'cd ~/ && nix run github:erooke/toml2nix noctalia-full-config.toml | wl-copy && rm noctalia-full-config.toml'
          # and paste the results in to 'settings'.

	  # Do not forget to:
	  # 1. Manually remove some errors with '@' and 'plugin/name'.
	  # 2. Change 'shell.font_family' to 'font'.

          settings = {
            accessibility = {
              high_contrast = false;
              ui_scale = 1.0;
            };
            audio = {
              enable_overdrive = true;
              enable_sounds = true;
              notification_sound = "";
              sound_volume = 0.5;
              volume_change_sound = "";
            };
            backdrop = {
              blur_intensity = 0.5;
              enabled = true;
              tint_intensity = 0.30000001192092896;
            };
            bar = {
              order = [ "default" ];
              default = {
                auto_hide = false;
                background_opacity = 1.0;
                border = "outline";
                border_width = 0.0;
                capsule = false;
                capsule_fill = "surface_variant";
                capsule_group = [ ];
                capsule_opacity = 1.0;
                capsule_padding = 6.0;
                capsule_radius = 0.0;
                capsule_thickness = 0.7599999904632568;
                center = [ "workspaces" ];
                concave_edge_corners = false;
                contact_shadow = false;
                enabled = true;
                end = [
                  "tray"
                  "clipboard"
                  "battery"
                  "session"
                ];
                font_scale = 1.0;
                font_weight = 500;
                hover_highlight = true;
                layer = "top";
                margin_edge = 0;
                margin_ends = 0;
                margin_opposite_edge = 0;
                padding = 14;
                panel_overlap = 1;
                position = "bottom";
                radius = 0;
                radius_bottom_left = 0;
                radius_bottom_right = 0;
                radius_top_left = 0;
                radius_top_right = 0;
                reserve_space = true;
                scale = 1.0;
                shadow = false;
                show_on_workspace_switch = true;
                smart_auto_hide = false;
                start = [
                  "clock"
                  "keyboard_layout"
                ];
                thickness = 34;
                widget_spacing = 6;
                dead_zone = {

                };
              };
            };
            battery = {
              warning_threshold = 10;
            };
            brightness = {
              enable_ddcutil = false;
              ignore_mmids = [ ];
              minimum_brightness = 0.0;
              sync_all_monitors = false;
            };
            calendar = {
              enabled = false;
              event_date_format = "%A %e %B";
              event_time_format = "%H:%M";
              refresh_minutes = 15;
            };
            control_center = {
              hidden_tabs = [ ];
              show_session_button = true;
              show_shortcut_labels = true;
              sidebar = "compact";
              sidebar_section = "compact";
              width = 700;
              calendar = {
                show_events_card = true;
                show_week_numbers = false;
              };
              shortcuts = [
                {
                  type = "wifi";
                }
                {
                  type = "bluetooth";
                }
                {
                  type = "caffeine";
                }
                {
                  type = "nightlight";
                }
                {
                  type = "notification";
                }
                {
                  type = "power_profile";
                }
              ];
            };
            desktop_widgets = {
              enabled = true;
              schema_version = 2;
              grid = {
                cell_size = 16;
                major_interval = 4;
                visible = true;
              };
            };
            dock = {
              active_monitor_only = false;
              active_opacity = 1.0;
              active_scale = 1.0;
              auto_hide = false;
              background_opacity = 0.8799999952316284;
              border = "outline";
              border_width = 0.0;
              concave_edge_corners = true;
              cross_axis_padding = 8;
              enabled = false;
              icon_size = 48;
              inactive_opacity = 0.8500000238418579;
              inactive_scale = 0.8500000238418579;
              item_spacing = 6;
              launcher_custom_image = "";
              launcher_custom_image_colorize = false;
              launcher_icon = "grid-dots";
              launcher_position = "none";
              layer = "top";
              magnification = true;
              magnification_scale = 1.4500000476837158;
              main_axis_padding = 16;
              margin_edge = 0;
              margin_ends = 0;
              monitors = [ ];
              pinned = [ ];
              position = "bottom";
              radius = 16;
              radius_bottom_left = 16;
              radius_bottom_right = 16;
              radius_top_left = 16;
              radius_top_right = 16;
              reserve_space = true;
              shadow = true;
              show_dots = false;
              show_instance_count = true;
              show_running = true;
              smart_auto_hide = false;
            };
            hooks = {
              battery_charging = [ ];
              battery_discharging = [ ];
              battery_percentage_changed = [ ];
              battery_plugged = [ ];
              bluetooth_disabled = [ ];
              bluetooth_enabled = [ ];
              colors_changed = [ ];
              logging_out = [ ];
              power_profile_changed = [ ];
              rebooting = [ ];
              session_locked = [ ];
              session_unlocked = [ ];
              shutting_down = [ ];
              started = [ ];
              theme_mode_changed = [ ];
              wallpaper_changed = [ ];
              wifi_disabled = [ ];
              wifi_enabled = [ ];
            };
            hot_corners = {
              delay_ms = 0;
              enabled = false;
              bottom_left = {
                action = "none";
                command = "";
              };
              bottom_right = {
                action = "none";
                command = "";
              };
              top_left = {
                action = "none";
                command = "";
              };
              top_right = {
                action = "none";
                command = "";
              };
            };
            idle = {
              behavior_order = [
                "lock"
                "screen-off"
                "lock-and-suspend"
              ];
              pre_action_fade_seconds = 2.0;
              behavior = {
                lock = {
                  action = "lock";
                  command = "";
                  enabled = false;
                  locked_timeout = 0.0;
                  resume_command = "";
                  timeout = 600.0;
                };
                lock-and-suspend = {
                  action = "lock_and_suspend";
                  command = "";
                  enabled = false;
                  locked_timeout = 0.0;
                  resume_command = "";
                  timeout = 900.0;
                };
                screen-off = {
                  action = "screen_off";
                  command = "";
                  enabled = false;
                  locked_timeout = 0.0;
                  resume_command = "";
                  timeout = 660.0;
                };
              };
            };
            keybinds = {
              cancel = [ "Escape" ];
              copy = [ "Ctrl+c" ];
              delete = [ "Delete" ];
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
              save = [ "Ctrl+s" ];
              tab_next = [ "Tab" ];
              tab_previous = [ "Shift+ISO_Left_Tab" ];
              up = [
                "Up"
                "Ctrl+k"
              ];
              validate = [
                "Return"
                "KP_Enter"
                "space"
              ];
            };
            location = {
              address = "";
              auto_locate = true;
              custom_schedule = false;
              sunrise = "";
              sunset = "";
            };
            lockscreen = {
              allow_empty_password = false;
              blur_intensity = 0.5;
              blurred_desktop = false;
              enabled = true;
              fingerprint = true;
              lock_before_suspend = true;
              monitors = [ ];
              tint_intensity = 0.30000001192092896;
              wallpaper = "";
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
                  enabled = true;
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
              force = false;
              temperature_day = 6500;
              temperature_night = 4000;
            };
            notification = {
              background_opacity = 1.0;
              border = true;
              collapse_on_dismiss = true;
              enable_daemon = true;
              history_retention_hours = 0;
              keep_dismissed_in_history = true;
              layer = "top";
              max_visible = 0;
              monitors = [ ];
              offset_x = 20;
              offset_y = 8;
              position = "top_right";
              scale = 1.0;
              show_actions = true;
              show_app_name = true;
            };
            osd = {
              background_opacity = 1.0;
              border = true;
              enabled = true;
              monitors = [ ];
              offset_x = 20;
              offset_y = 8;
              orientation = "horizontal";
              position = "top_center";
              position_vertical = "top_center";
              scale = 1.0;
              kinds = {
                bluetooth = true;
                brightness = true;
                caffeine = true;
                dnd = true;
                keyboard_backlight = true;
                keyboard_layout = true;
                lock_keys = true;
                media = true;
                nightlight = true;
                power_profile = true;
                privacy = true;
                volume = true;
                volume_input = true;
                volume_output = true;
                wifi = true;
              };
            };
            plugin_settings = {
              "noctalia/translator" = {
                target_lang = "ru";
              };
            };
            plugins = {
              auto_update = "all";
              enabled = [ "noctalia/translator" ];
              source = [
                {
                  enabled = true;
                  kind = "git";
                  location = "https://github.com/noctalia-dev/official-plugins";
                  name = "official";
                }
                {
                  enabled = true;
                  kind = "git";
                  location = "https://github.com/noctalia-dev/community-plugins";
                  name = "community";
                }
              ];
            };
            shell = {
              app_icon_colorize = false;
              avatar_path = "";
              button_borders = true;
              card_borders = true;
              clipboard_auto_paste = "auto";
              clipboard_confirm_clear_history = false;
              clipboard_enabled = true;
              clipboard_history_max_entries = 100;
              clipboard_image_action_command = "";
              clipboard_keep_from_closed_apps = true;
              corner_radius_scale = 0.0;
              date_format = "%A, %x";
              disable_mipmaps = false;
              external_ip_enabled = false;
              font_family = font;
              input_borders = true;
              launch_apps_as_systemd_services = false;
              launch_apps_custom_command = "";
              niri_overview_type_to_launch_enabled = true;
              offline_mode = false;
              password_style = "default";
              polkit_agent = false;
              popup_borders = true;
              popup_shadows = false;
              screen_time_enabled = false;
              settings_show_advanced = true;
              settings_window_translucent = false;
              setup_wizard_enabled = true;
              shared_gl_context = true;
              show_location = true;
              telemetry_enabled = false;
              time_format = "{:%H:%M}";
              animation = {
                enabled = true;
                speed = 1.0;
              };
              greeter_sync = {
                auto_sync = false;
              };
              keyboard_layout = {

              };
              launcher = {
                app_grid = false;
                auto_paste = "auto";
                categories = false;
                compact = false;
                fetch_exchange_rates = true;
                pinned = [ ];
                provider_prefix = "/";
                show_app_actions = false;
                show_app_origin_indicator = true;
                show_icons = false;
                sort_by_usage = false;
                dmenu = {

                };
              };
              mpris = {
                blacklist = [ ];
              };
              panel = {
                borders = true;
                clipboard_placement = "floating";
                clipboard_position = "center";
                control_center_placement = "attached";
                control_center_position = "auto";
                floating_layer = "overlay";
                floating_offset = 8;
                launcher_placement = "floating";
                launcher_position = "center";
                list_item_background = false;
                open_near_click_clipboard = false;
                open_near_click_control_center = false;
                open_near_click_launcher = false;
                open_near_click_session = false;
                open_near_click_wallpaper = false;
                polkit_placement = "floating";
                polkit_position = "center";
                session_placement = "attached";
                session_position = "auto";
                shadow = false;
                transparency_mode = "solid";
                wallpaper_placement = "attached";
                wallpaper_position = "auto";
              };
              privacy = {
                cam_filter_regex = "";
                mic_filter_regex = "";
                screen_filter_regex = "";
              };
              screen_corners = {
                enabled = false;
                size = 32;
              };
              screenshot = {
                confirm_region = false;
                copy_to_clipboard = true;
                directory = "";
                filename_pattern = "";
                freeze_screen = true;
                pipe_command = "";
                pipe_to_command = false;
                remember_last_region = false;
                save_to_file = true;
                show_cursor = false;
              };
              session = {
                grid = false;
                grid_columns = 3;
                show_shortcuts = true;
                power = {

                };
                actions = [
                  {
                    action = "lock";
                    command = "";
                    countdown_seconds = 0.0;
                    enabled = true;
                    glyph = "";
                    label = "";
                    shortcut = "1";
                    variant = "default";
                  }
                  {
                    action = "logout";
                    command = "";
                    countdown_seconds = 0.0;
                    enabled = true;
                    glyph = "";
                    label = "";
                    shortcut = "2";
                    variant = "default";
                  }
                  {
                    action = "lock_and_suspend";
                    command = "";
                    countdown_seconds = 0.0;
                    enabled = true;
                    glyph = "";
                    label = "";
                    shortcut = "3";
                    variant = "default";
                  }
                  {
                    action = "reboot";
                    command = "";
                    countdown_seconds = 0.0;
                    enabled = true;
                    glyph = "";
                    label = "";
                    shortcut = "4";
                    variant = "default";
                  }
                  {
                    action = "shutdown";
                    command = "";
                    countdown_seconds = 0.0;
                    enabled = true;
                    glyph = "";
                    label = "";
                    shortcut = "5";
                    variant = "destructive";
                  }
                ];
              };
              shadow = {
                alpha = 0.550000011920929;
                direction = "down";
              };
              window_switcher = {
                mru = false;
              };
            };
            storage = {
              key_file = "";
              key_source = "secret-service";
            };
            system = {
              monitor = {
                cpu_freq_activity_threshold = 2.5;
                cpu_freq_critical_threshold = 4.5;
                cpu_poll_seconds = 2.0;
                cpu_temp_activity_threshold = 60.0;
                cpu_temp_critical_threshold = 85.0;
                cpu_temp_sensor_path = "";
                cpu_usage_activity_threshold = 50.0;
                cpu_usage_critical_threshold = 90.0;
                disk_free_activity_threshold = 80.0;
                disk_free_critical_threshold = 95.0;
                disk_free_pct_activity_threshold = 80.0;
                disk_free_pct_critical_threshold = 95.0;
                disk_poll_seconds = 10.0;
                disk_used_activity_threshold = 80.0;
                disk_used_critical_threshold = 95.0;
                disk_used_pct_activity_threshold = 80.0;
                disk_used_pct_critical_threshold = 95.0;
                enabled = true;
                gpu_poll_seconds = 5.0;
                gpu_temp_activity_threshold = 60.0;
                gpu_temp_critical_threshold = 85.0;
                gpu_usage_activity_threshold = 50.0;
                gpu_usage_critical_threshold = 95.0;
                gpu_vram_activity_threshold = 50.0;
                gpu_vram_critical_threshold = 90.0;
                memory_poll_seconds = 2.0;
                net_rx_activity_threshold = 1.0;
                net_rx_critical_threshold = 50.0;
                net_tx_activity_threshold = 1.0;
                net_tx_critical_threshold = 50.0;
                network_poll_seconds = 3.0;
                ram_pct_activity_threshold = 60.0;
                ram_pct_critical_threshold = 90.0;
                swap_pct_activity_threshold = 20.0;
                swap_pct_critical_threshold = 80.0;
              };
            };
            theme = {
              builtin = "Catppuccin";
              community_palette = "Monochrome";
              custom_palette = "";
              mode = "dark";
              pure_black_dark = false;
              shell_mode = "follow";
              source = "wallpaper";
              wallpaper_scheme = "m3-monochrome";
              templates = {
                builtin_ids = [
                  "btop"
                  "gtk3"
                  "gtk4"
                  "kcolorscheme"
                  "kitty"
                  "niri"
                  "qt"
                ];
                community_ids = [ "discord" ];
                enable_builtin_templates = true;
                enable_community_templates = true;
                user = {
                  wal = {
                    compare_to = "";
                    enabled = true;
                    hook_async = true;
                    index = 0;
                    input_path = "$XDG_CONFIG_HOME/noctalia/templates/wal.json";
                    output_path = [ "$XDG_CACHE_HOME/wal/colors.json" ];
                    output_path_dynamic = "";
                    post_action = "";
                    post_hook = "";
                    pre_hook = "";
                  };
                  wal_vim = {
                    compare_to = "";
                    enabled = true;
                    hook_async = true;
                    index = 0;
                    input_path = "$XDG_CONFIG_HOME/noctalia/templates/colors-wal.vim";
                    output_path = [ "$XDG_CACHE_HOME/wal/colors-wal.vim" ];
                    output_path_dynamic = "";
                    post_action = "";
                    post_hook = "";
                    pre_hook = "";
                  };
                };
              };
            };
            wallpaper = {
              directory = "";
              directory_dark = "";
              directory_light = "";
              edge_smoothness = 0.30000001192092896;
              enabled = true;
              fill_color = "";
              fill_mode = "crop";
              per_monitor_directories = false;
              transition = [
                "fade"
                "wipe"
                "disc"
                "stripes"
                "zoom"
                "honeycomb"
              ];
              transition_duration = 1500.0;
              transition_on_startup = false;
              automation = {
                enabled = false;
                interval_seconds = 1800;
                order = "random";
                recursive = true;
              };
            };
            weather = {
              effects = true;
              enabled = true;
              refresh_minutes = 30;
              unit = "metric";
            };
            widget = {
              active_window = {
                icon_size = 14.0;
                max_length = 260.0;
                min_length = 80.0;
                title_scroll = "none";
                type = "active_window";
              };
              battery = {
                hide_when_plugged = true;
                type = "battery";
              };
              cpu = {
                stat = "cpu_usage";
                type = "sysmon";
              };
              date = {
                format = "{:%a %d %b}";
                type = "clock";
              };
              input_volume = {
                device = "input";
                type = "volume";
              };
              keyboard_layout = {
                hide_when_single_layout = false;
                show_glyph = false;
                type = "keyboard_layout";
              };
              lock_keys = {
                display = "short";
                hide_when_off = false;
                show_caps_lock = true;
                show_num_lock = true;
                show_scroll_lock = false;
                type = "lock_keys";
              };
              media = {
                art_size = 16.0;
                max_length = 220.0;
                min_length = 80.0;
                title_scroll = "none";
                type = "media";
              };
              network_rx = {
                stat = "net_rx";
                type = "sysmon";
              };
              network_tx = {
                stat = "net_tx";
                type = "sysmon";
              };
              output_volume = {
                device = "output";
                type = "volume";
              };
              ram = {
                stat = "ram_used";
                type = "sysmon";
              };
              spacer = {
                interactive = false;
                type = "spacer";
              };
              temp = {
                stat = "cpu_temp";
                type = "sysmon";
              };
              workspaces = {
                style = "minimal";
                type = "workspaces";
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
        fonts.fontconfig = {
          enable = true;
          defaultFonts = {
            sansSerif = [ font ];
            serif = [ font ];
            monospace = [ font ];
            emoji = [ font ];
          };
        };
        qt = {
          enable = true;

          # Use Breeze.
          platformTheme.name = "kde";
          style.name = "breeze";

          kde.settings.kdeglobals.General = {
            font = "${font}, 13";
            fixed = "${font}, 13";
            menuFont = "${font}, 13";
            toolBarFont = "${font}, 13";
            smallestReadableFont = "${font}, 10";
            taskbarFont = "${font}, 13";
          };

          # Use QT.
          # platformTheme.name = "qtct";
          # qt6ctSettings.Appearance = {
          #   style = "Fusion";
          #   custom_palette = true;
          #   color_scheme_path = "/home/matthew/.config/qt6ct/colors/noctalia.conf";
          #   icon_theme = "breeze-dark";
          # };
          # qt5ctSettings = {
          #   Fonts = {
          #     fixed = "\"JetBrainsMonoNerdFontMono,13\"";
          #     general = "\"JetBrainsMonoNerdFontMono,13\"";
          #   };
          # };
          # qt6ctSettings = {
          #   Fonts = {
          #     fixed = "\"JetBrainsMonoNerdFontMono,13\"";
          #     general = "\"JetBrainsMonoNerdFontMono,13\"";
          #   };
          # };
        };
        dconf.settings."org/gnome/desktop/wm/preferences".button-layout = ""; # Remove window decorations.
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
          font = {
            name = font;
            size = 13;
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
