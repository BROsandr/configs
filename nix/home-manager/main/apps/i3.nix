{pkgs, ... }: {
  xsession.windowManager.i3 = {
    enable = true;
    config = {
      terminal = "alacritty";
      modifier = "Mod4";
      bars = [
        {
          statusCommand = "${pkgs.i3status-rust}/bin/i3status-rs ${builtins.getEnv "HOME"}/.config/i3status-rust/config-config.toml";
          position = "bottom";
          fonts = {
            names = [ "JetBrainsMonoNL Nerd Font" "FontAwesome5Free" ];
            # style = "Bold Semi-Condensed";
            # size = 11.0;
          };
          colors = {
            background = "#222222";
            separator = "#666666";
            statusline = "#dddddd";
            focusedWorkspace = {
              background = "#0088CC";
              border = "#0088CC";
              text = "#ffffff";
            };
            activeWorkspace = {
              background = "#333333";
              border = "#333333";
              text = "#ffffff";
            };
            inactiveWorkspace = {
              background = "#333333";
              border = "#333333";
              text = "#888888";
            };
            urgentWorkspace = {
              border = "#2f343a";
              background = "#900000";
              text = "#ffffff";
            };

          };
        }
      ];
    };
  };

  programs.i3status-rust = {
    enable = true;
    bars = {
      config = {
        blocks = [
          {
            block = "net";
            # interval = 60;
            format = " $icon ^icon_net_down $speed_down.eng(prefix:K) ^icon_net_up $speed_up.eng(prefix:K) ";
          }
          {
            alert = 10.0;
            block = "disk_space";
            info_type = "available";
            interval = 60;
            path = "/";
            warning = 20.0;
          }
          {
            block = "memory";
            format = " $icon $mem_used_percents ";
            format_alt = " $icon $swap_used_percents ";
          }
          {
            block = "cpu";
            interval = 1;
            format = " $icon $utilization ";
          }
          {
            block = "load";
            format = " $icon $1m ";
            interval = 1;
          }
          # {
          #   block = "sound";
          # }
          {
            block = "time";
            format = " $timestamp.datetime(f:'%a %d/%m %R') ";
            interval = 60;
          }
        ];

        settings = {
          theme =  {
            theme = "solarized-dark";
            overrides = {
              idle_bg = "#123456";
              idle_fg = "#abcdef";
            };
          };
        };
        icons = "awesome4";
        theme = "gruvbox-dark";
      };
    };
  };
}
