{config, ...}: let
  colorSchemeName = "base16";
in {
  inherit colorSchemeName;
  colorSchemePath = "/home/vilhelm/nix-config/home-manager/created-files/i3status-rust/${colorSchemeName}.toml";
  colorSchemeToml = ''
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
