{ config, ... }:
{
  programs.zellij = {
    enable = true;
    settings = {
      theme = "base16";
      themes.base16.fg = "#${config.colorScheme.palette.base04}";
      themes.base16.bg = "#${config.colorScheme.palette.base01}";
      themes.base16.black = "#${config.colorScheme.palette.base00}";
      themes.base16.red = "#${config.colorScheme.palette.base08}";
      themes.base16.green = "#${config.colorScheme.palette.base0B}";
      themes.base16.yellow = "#${config.colorScheme.palette.base0A}";
      themes.base16.blue = "#${config.colorScheme.palette.base0D}";
      themes.base16.magenta = "#${config.colorScheme.palette.base0E}";
      themes.base16.cyan = "#${config.colorScheme.palette.base0C}";
      themes.base16.white = "#${config.colorScheme.palette.base05}";
      themes.base16.orange = "#${config.colorScheme.palette.base09}";
    };
  };
}
