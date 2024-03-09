{ config, lib, pkgs, ... }:

let
  mod = "Mod4";
in {
  xsession.windowManager.i3 = {
    enable = true;
    config = {
      modifier = mod;

      terminal = "wezterm";

      window.titlebar = false;

      keybindings = lib.mkOptionDefault {
        "XF86AudioRaiseVolume" = "exec wpctl set-volume -l 1.5 @DEFAULT_AUDIO_SINK@ 5%+";
        "XF86AudioLowerVolume" = "exec wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-";
        "XF86AudioMute" = "exec wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle";
        "XF86MonBrightnessUp" = "exec brightnessctl set 5%+";
        "XF86MonBrightnessDown" = "exec brightnessctl set 5%-";
      };

      colors = {
        background = "#${config.colorScheme.palette.base00}";

        focused = {
          border = "#${config.colorScheme.palette.base04}";
          background = "#${config.colorScheme.palette.base02}";
          text = "#${config.colorScheme.palette.base05}";
          indicator = "#${config.colorScheme.palette.base04}";
          childBorder = "#${config.colorScheme.palette.base04}";
        };
        focusedInactive = {
          border = "#${config.colorScheme.palette.base02}";
          background = "#${config.colorScheme.palette.base01}";
          text = "#${config.colorScheme.palette.base05}";
          indicator = "#${config.colorScheme.palette.base03}";
          childBorder = "#${config.colorScheme.palette.base03}";
        };
        unfocused = {
          border = "#${config.colorScheme.palette.base03}";
          background = "#${config.colorScheme.palette.base01}";
          text = "#${config.colorScheme.palette.base05}";
          indicator = "#${config.colorScheme.palette.base03}";
          childBorder = "#${config.colorScheme.palette.base03}";
        };
        urgent = {
          border = "#${config.colorScheme.palette.base03}";
          background = "#${config.colorScheme.palette.base01}";
          text = "#${config.colorScheme.palette.base05}";
          indicator = "#${config.colorScheme.palette.base03}";
          childBorder = "#${config.colorScheme.palette.base03}";
        };
        placeholder = {
          border = "#${config.colorScheme.palette.base03}";
          background = "#${config.colorScheme.palette.base01}";
          text = "#${config.colorScheme.palette.base05}";
          indicator = "#${config.colorScheme.palette.base03}";
          childBorder = "#${config.colorScheme.palette.base03}";
        };
      };
    };
  };
}
