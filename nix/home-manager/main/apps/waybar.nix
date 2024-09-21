{
  programs.waybar = {
    enable = true;
    settings = {
      mainBar = {
        layer = "top";    # Waybar at top layer
        position = "top"; # Waybar position (top|bottom|left|right)
        height = 30; # Waybar height (to be removed for auto height)
        # // "width": 1280, // Waybar width
        spacing = 4; # // Gaps between modules (4px)
        # Choose the order of the modules
        modules-left = [
            "hyprland/workspaces"
        ];
        modules-center = [
            "hyprland/window"
        ];
        modules-right = [
            "idle_inhibitor"
            "pulseaudio"
            "network"
            "power-profiles-daemon"
            "cpu"
            "memory"
            "temperature"
            "keyboard-state"
            "hyprland/language"
            "clock"
            "tray"
        ];
        # Modules configuration
        "hyprland/workspaces" = {
            "disable-scroll" = true;
            "all-outputs" = false;
            "warp-on-scroll" = false;
            "format" = "{name}: {icon}";
            "format-icons" = {
          #      "1": "",
          #      "2": "",
          #      "3": "",
          #      "4": "",
          #      "5": "",
                "active" = "🔴";
                "urgent" = "";
                "focused" = "";
                "default" = "⚪";
            };
        };

        "hyprland/window" = {
          "separate-outputs" = true;
        };

        keyboard-state = {
            numlock = true;
            capslock = true;
            format = "{name} {icon}";
            format-icons = {
                locked = "";
                unlocked = "";
            };
        };
        # mpd = {
        #     format = "{stateIcon} {consumeIcon}{randomIcon}{repeatIcon}{singleIcon}{artist} - {album} - {title} ({elapsedTime:%M:%S}/{totalTime:%M:%S}) ⸨{songPosition}|{queueLength}⸩ {volume}% ";
        #     format-disconnected = "Disconnected ";
        #     format-stopped = "{consumeIcon}{randomIcon}{repeatIcon}{singleIcon}Stopped ";
        #     unknown-tag = "N/A";
        #     interval = 5;
        #     consume-icons = {
        #         on = " ";
        #     };
        #     random-icons = {
        #         off = "<span color=\"#f53c3c\"></span> ";
        #         on = " ";
        #     };
        #     repeat-icons = {
        #         on = " ";
        #     };
        #     single-icons = {
        #         on = "1 ";
        #     };
        #     state-icons = {
        #         paused = "";
        #         playing = "";
        #     };
        #     "tooltip-format": "MPD (connected)",
        #     "tooltip-format-disconnected": "MPD (disconnected)"
        # },
        idle_inhibitor = {
            format = "{icon}";
            format-icons = {
                activated = "";
                deactivated = "";
            };
        };
        tray = {
            ## "icon-size": 21,
            spacing = 10;
        };
        clock = {
            timezone = "Moscow";
            tooltip-format = "<big>{:%Y %B}</big>\n<tt><small>{calendar}</small></tt>";
            format-alt = "{:%Y-%m-%d}";
        };
        cpu = {
            format = "{usage}% ";
            tooltip = false;
        };
        memory = {
            format = "{}% ";
        };
        temperature = {
            # // "thermal-zone": 2,
            # // "hwmon-path": "/sys/class/hwmon/hwmon2/temp1_input",
            critical-threshold = 80;
            # // "format-critical": "{temperatureC}°C {icon}",
            format =  "{temperatureC}°C {icon}";
            format-icons =  ["" "" ""];
        };
        power-profiles-daemon = {
          format = "{icon}";
          tooltip-format = "Power profile: {profile}\nDriver: {driver}";
          tooltip = true;
          format-icons = {
            default = "";
            performance = "";
            balanced = "";
            power-saver = "";
          };
        };
        network = {
            # // interface = "wlp2*", // (Optional) To force the use of this interface
            format-wifi = "{essid} ({signalStrength}%) ";
            format-ethernet = "{ipaddr}/{cidr} ";
            tooltip-format = "{ifname} via {gwaddr} ";
            format-linked = "{ifname} (No IP) ";
            format-disconnected = "Disconnected ⚠";
            format-alt = "{ifname}: {ipaddr}/{cidr}";
        };
        pulseaudio = {
            # // scroll-step = 1, // %, can be a float
            format = "{volume}% {icon} {format_source}";
            format-bluetooth = "{volume}% {icon} {format_source}";
            format-bluetooth-muted = " {icon} {format_source}";
            format-muted = " {format_source}";
            format-source = "{volume}% ";
            format-source-muted = "";
            format-icons = {
                headphone = "";
                hands-free = "";
                headset = "";
                phone = "";
                portable = "";
                car = "";
                default = ["" "" ""];
            };
            on-click = "pavucontrol";
        };
      };
    };
  };
}
