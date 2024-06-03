{config, ...}: {
  programs.wezterm = {
    enable = true;
    extraConfig = ''
      return {
        font = wezterm.font("IosevkaTermNerdFont"),
        font_size = 18.0,
        enable_tab_bar = false,
        colors = {
          ansi = {
            "#${config.colorScheme.palette.base00}",
            "#${config.colorScheme.palette.base08}",
            "#${config.colorScheme.palette.base0B}",
            "#${config.colorScheme.palette.base0A}",
            "#${config.colorScheme.palette.base0D}",
            "#${config.colorScheme.palette.base0E}",
            "#${config.colorScheme.palette.base0C}",
            "#${config.colorScheme.palette.base05}",
          },
          background = "#${config.colorScheme.palette.base00}",
          brights = {
            "#${config.colorScheme.palette.base03}",
            "#${config.colorScheme.palette.base08}",
            "#${config.colorScheme.palette.base0B}",
            "#${config.colorScheme.palette.base0A}",
            "#${config.colorScheme.palette.base0D}",
            "#${config.colorScheme.palette.base0E}",
            "#${config.colorScheme.palette.base0C}",
            "#${config.colorScheme.palette.base07}",
          },
          cursor_bg = "#${config.colorScheme.palette.base05}",
          cursor_border = "#${config.colorScheme.palette.base05}",
          cursor_fg = "#${config.colorScheme.palette.base05}",
          foreground = "#${config.colorScheme.palette.base05}",
          indexed = {},
          selection_bg = "#${config.colorScheme.palette.base05}",
          selection_fg = "#${config.colorScheme.palette.base00}",
        },
      }
    '';
  };
}
