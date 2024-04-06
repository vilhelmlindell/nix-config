{
  inputs,
  config,
  lib,
  pkgs,
  ...
}: let
  mod = "Mod4";
  nix-colors-lib = inputs.nix-colors.lib.contrib {inherit pkgs;};
  wallpaperPath = nix-colors-lib.nixWallpaperFromScheme {
    scheme = config.colorScheme;
    width = 1920;
    height = 1080;
    logoScale = 5.0;
  };
  transparent = "#00000000";
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
        "${mod}+h" = "focus left";
        "${mod}+l" = "focus right";
        "${mod}+j" = "focus down";
        "${mod}+k" = "focus up";
        "${mod}+Shift+h" = "move left";
        "${mod}+Shift+l" = "move right";
        "${mod}+Shift+j" = "move down";
        "${mod}+Shift+k" = "move up";
      };

      colors = {
        background = "#${config.colorScheme.palette.base00}";

        focused = {
          border = "#${config.colorScheme.palette.base02}";
          background = "#${config.colorScheme.palette.base00}";
          text = "#${config.colorScheme.palette.base05}";
          indicator = "#${config.colorScheme.palette.base02}";
          childBorder = "#${config.colorScheme.palette.base02}";
        };
        focusedInactive = {
          border = "#${config.colorScheme.palette.base00}";
          background = "#${config.colorScheme.palette.base01}";
          text = "#${config.colorScheme.palette.base05}";
          indicator = "#${config.colorScheme.palette.base02}";
          childBorder = transparent;
        };
        unfocused = {
          border = "#${config.colorScheme.palette.base00}";
          background = "#${config.colorScheme.palette.base01}";
          text = "#${config.colorScheme.palette.base05}";
          indicator = "#${config.colorScheme.palette.base00}";
          childBorder = transparent;
        };
        urgent = {
          border = "#${config.colorScheme.palette.base00}";
          background = "#${config.colorScheme.palette.base01}";
          text = "#${config.colorScheme.palette.base05}";
          indicator = "#${config.colorScheme.palette.base00}";
          childBorder = transparent;
        };
        placeholder = {
          border = "#${config.colorScheme.palette.base00}";
          background = "#${config.colorScheme.palette.base01}";
          text = "#${config.colorScheme.palette.base05}";
          indicator = "#${config.colorScheme.palette.base00}";
          childBorder = transparent;
        };
      };
      startup = [
        {
          command = "${pkgs.feh}/bin/feh --bg-fill ${wallpaperPath}";
          always = true;
          notification = false;
        }
      ];
    };
  };
}
