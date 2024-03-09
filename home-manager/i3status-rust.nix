{ pkgs, config, ... }:

let 
  barName = "bottom";
  themeSeparator = "\ue0b2";
in
{
  xsession.windowManager.i3 = {
    enable = true;
    config = {
      bars = [
        {
          fonts = {
            names = [  "JetBrainsMonoNLNerdFont" "FontAwesome6Free"];
            style = "Regular";
            size = 13.0;
          };
          position = "bottom";
          statusCommand = "${pkgs.i3status-rust}/bin/i3status-rs ~/.config/i3status-rust/config-${barName}.toml";
          colors = {
            background = "#${config.colorScheme.palette.base00}";
            statusline = "#${config.colorScheme.palette.base04}";
            separator = "#${config.colorScheme.palette.base02}";

            focusedWorkspace = { 
              border = "#${config.colorScheme.palette.base04}";
              background = "#${config.colorScheme.palette.base04}";
              text = "#${config.colorScheme.palette.base05}";
            };
            activeWorkspace = {
              border = "#${config.colorScheme.palette.base02}";
              background = "#${config.colorScheme.palette.base02}";
              text = "#${config.colorScheme.palette.base05}";
            };
            inactiveWorkspace = {
              border = "#${config.colorScheme.palette.base02}";
              background = "#${config.colorScheme.palette.base02}";
              text = "#${config.colorScheme.palette.base05}";
            };
            urgentWorkspace = {
              border = "#${config.colorScheme.palette.base02}";
              background = "#${config.colorScheme.palette.base02}";
              text = "#${config.colorScheme.palette.base05}";
            };
          };
        }
      ];
    };
  };

  programs.i3status-rust = 
  {
    enable = true;
    bars = {
      ${barName} = {
        icons = "awesome6";
        #theme = "ctp-mocha";
        theme = "gruvbox-dark";
        blocks = [
          {
             block = "disk_space";
             path = "/";
             info_type = "available";
             interval = 60;
             warning = 20.0;
             alert = 10.0;
             #theme_overrides = {
             #  idle_bg = "#${config.colorScheme.palette.base08}ff";
             #  idle_fg = "#${config.colorScheme.palette.base08}00";
             #  good_bg = "#${config.colorScheme.palette.base08}ff";
             #  good_fg = "#${config.colorScheme.palette.base08}00";
             #  warning_bg = "#${config.colorScheme.palette.base08}ff";
             #  warning_fg = "#${config.colorScheme.palette.base08}00";
             #  critical_bg = "#${config.colorScheme.palette.base08}ff";
             #  critical_fg = "#${config.colorScheme.palette.base08}00";
             #  info_bg = "#${config.colorScheme.palette.base08}ff";
             #  info_fg = "#${config.colorScheme.palette.base08}00";
             #  alternating_tint_bg = "#${config.colorScheme.palette.base08}ff";
             #  alternating_tint_fg = "#${config.colorScheme.palette.base08}00";
             #  separator_bg = "#${config.colorScheme.palette.base08}ff";
             #  separator_fg = "#${config.colorScheme.palette.base08}00";
             #  separator = themeSeparator;
             #};
           }
           {
             block = "memory";
             format = " $icon $mem_total_used_percents.eng(w:2) ";
             format_alt = " $icon_swap $swap_used_percents.eng(w:2) ";
             #theme_overrides = {
             #  idle_bg = "#${config.colorScheme.palette.base09}ff";
             #  idle_fg = "#${config.colorScheme.palette.base09}00";
             #  good_bg = "#${config.colorScheme.palette.base09}ff";
             #  good_fg = "#${config.colorScheme.palette.base09}00";
             #  warning_bg = "#${config.colorScheme.palette.base09}ff";
             #  warning_fg = "#${config.colorScheme.palette.base09}00";
             #  critical_bg = "#${config.colorScheme.palette.base09}ff";
             #  critical_fg = "#${config.colorScheme.palette.base09}00";
             #  info_bg = "#${config.colorScheme.palette.base09}ff";
             #  info_fg = "#${config.colorScheme.palette.base09}00";
             #  alternating_tint_bg = "#${config.colorScheme.palette.base09}ff";
             #  alternating_tint_fg = "#${config.colorScheme.palette.base09}00";
             #  separator_bg = "#${config.colorScheme.palette.base09}ff";
             #  separator_fg = "#${config.colorScheme.palette.base09}00";
             #  separator = themeSeparator;
             #};
           }
           {
             block = "cpu";
             interval = 1;
             #theme_overrides = {
             #  idle_bg = "#${config.colorScheme.palette.base0A}ff";
             #  idle_fg = "#${config.colorScheme.palette.base0A}00";
             #  good_bg = "#${config.colorScheme.palette.base0A}ff";
             #  good_fg = "#${config.colorScheme.palette.base0A}00";
             #  warning_bg = "#${config.colorScheme.palette.base0A}ff";
             #  warning_fg = "#${config.colorScheme.palette.base0A}00";
             #  critical_bg = "#${config.colorScheme.palette.base0A}ff";
             #  critical_fg = "#${config.colorScheme.palette.base0A}00";
             #  info_bg = "#${config.colorScheme.palette.base0A}ff";
             #  info_fg = "#${config.colorScheme.palette.base0A}00";
             #  alternating_tint_bg = "#${config.colorScheme.palette.base0A}ff";
             #  alternating_tint_fg = "#${config.colorScheme.palette.base0A}00";
             #  separator_bg = "#${config.colorScheme.palette.base0A}ff";
             #  separator_fg = "#${config.colorScheme.palette.base0A}00";
             #  separator = themeSeparator;
             #};
           }
           {
             block = "load";
             interval = 1;
             format = " $icon $1m ";
             #theme_overrides = {
             #  idle_bg = "#${config.colorScheme.palette.base0B}ff";
             #  idle_fg = "#${config.colorScheme.palette.base0B}00";
             #  good_bg = "#${config.colorScheme.palette.base0B}ff";
             #  good_fg = "#${config.colorScheme.palette.base0B}00";
             #  warning_bg = "#${config.colorScheme.palette.base0B}ff";
             #  warning_fg = "#${config.colorScheme.palette.base0B}00";
             #  critical_bg = "#${config.colorScheme.palette.base0B}ff";
             #  critical_fg = "#${config.colorScheme.palette.base0B}00";
             #  info_bg = "#${config.colorScheme.palette.base0B}ff";
             #  info_fg = "#${config.colorScheme.palette.base0B}00";
             #  alternating_tint_bg = "#${config.colorScheme.palette.base0B}ff";
             #  alternating_tint_fg = "#${config.colorScheme.palette.base0B}00";
             #  separator_bg = "#${config.colorScheme.palette.base0B}ff";
             #  separator_fg = "#${config.colorScheme.palette.base0B}00";
             #  separator = themeSeparator;
             #};
           }
           {
             block = "backlight";
             device = "intel_backlight";          
           }
           { 
             block = "sound"; 
             #theme_overrides = {
               #idle_bg = "#${config.colorScheme.palette.base0C}ff";
               #idle_fg = "#${config.colorScheme.palette.base0C}00";
               #good_bg = "#${config.colorScheme.palette.base0C}ff";
               #good_fg = "#${config.colorScheme.palette.base0C}00";
               #warning_bg = "#${config.colorScheme.palette.base0C}ff";
               #warning_fg = "#${config.colorScheme.palette.base0C}00";
               #critical_bg = "#${config.colorScheme.palette.base0C}ff";
               #critical_fg = "#${config.colorScheme.palette.base0C}00";
               #info_bg = "#${config.colorScheme.palette.base0C}ff";
               #info_fg = "#${config.colorScheme.palette.base0C}00";
               #alternating_tint_bg = "#${config.colorScheme.palette.base0C}ff";
               #alternating_tint_fg = "#${config.colorScheme.palette.base0C}00";
               #separator_bg = "#${config.colorScheme.palette.base0C}ff";
               #separator_fg = "#${config.colorScheme.palette.base0C}00";
               #separator = themeSeparator;
             #};
           }
           {
             block = "battery";
             format = " $percentage {$time |}";
             device = "DisplayDevice";
             driver = "upower";
             #missing_format = "";
             #theme_overrides = {
             #  idle_bg = "#${config.colorScheme.palette.base0E}ff";
             #  idle_fg = "#${config.colorScheme.palette.base0E}00";
             #  good_bg = "#${config.colorScheme.palette.base0E}ff";
             #  good_fg = "#${config.colorScheme.palette.base0E}00";
             #  warning_bg = "#${config.colorScheme.palette.base0E}ff";
             #  warning_fg = "#${config.colorScheme.palette.base0E}00";
             #  critical_bg = "#${config.colorScheme.palette.base0E}ff";
             #  critical_fg = "#${config.colorScheme.palette.base0E}00";
             #  info_bg = "#${config.colorScheme.palette.base0E}ff";
             #  info_fg = "#${config.colorScheme.palette.base0E}00";
             #  alternating_tint_bg = "#${config.colorScheme.palette.base0E}ff";
             #  alternating_tint_fg = "#${config.colorScheme.palette.base0E}00";
             #  separator_bg = "#${config.colorScheme.palette.base0E}ff";
             #  separator_fg = "#${config.colorScheme.palette.base0E}00";
             #  separator = themeSeparator;
             #};
           }
           {
             block = "time";
             interval = 60;
             format = " $timestamp.datetime(f:'%a %d/%m %R') ";
             #theme_overrides = {
             #  idle_bg = "#${config.colorScheme.palette.base0D}ff";
             #  idle_fg = "#${config.colorScheme.palette.base0D}00";
             #  good_bg = "#${config.colorScheme.palette.base0D}ff";
             #  good_fg = "#${config.colorScheme.palette.base0D}00";
             #  warning_bg = "#${config.colorScheme.palette.base0D}ff";
             #  warning_fg = "#${config.colorScheme.palette.base0D}00";
             #  critical_bg = "#${config.colorScheme.palette.base0D}ff";
             #  critical_fg = "#${config.colorScheme.palette.base0D}00";
             #  info_bg = "#${config.colorScheme.palette.base0D}ff";
             #  info_fg = "#${config.colorScheme.palette.base0D}00";
             #  alternating_tint_bg = "#${config.colorScheme.palette.base0D}ff";
             #  alternating_tint_fg = "#${config.colorScheme.palette.base0D}00";
             #  separator_bg = "#${config.colorScheme.palette.base0D}ff";
             #  separator_fg = "#${config.colorScheme.palette.base0D}00";
             #  separator = themeSeparator;
             #};
           }
        ];
      };
    };
  };
}



