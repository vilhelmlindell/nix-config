{config, ...}: {
  path = "/home/vilhelm/nix-config/home-manager/vilhelm/features/desktop/i3/base16.toml";
  toml = ''
    idle_bg = "#${config.colorScheme.palette.base02}"
    idle_fg = "#${config.colorScheme.palette.base05}"
    info_bg = "#${config.colorScheme.palette.base0D}"
    info_fg = "#${config.colorScheme.palette.base00}"
    good_bg = "#${config.colorScheme.palette.base0B}"
    good_fg = "#${config.colorScheme.palette.base00}"
    warning_bg = "#${config.colorScheme.palette.base0A}"
    warning_fg = "#${config.colorScheme.palette.base00}"
    critical_bg = "#${config.colorScheme.palette.base08}"
    critical_fg = "#${config.colorScheme.palette.base00}"
    separator = ""
    end_separator = ""
    separator_bg = "auto"
    separator_fg = "auto"
  '';
}
