{config, ...}: {
  programs.starship = {
    enable = true;
    settings = {
      format = "[\\[](fg:color_red)$username[@](fg:color_green)$hostname $directory[\\]](fg:color_red)$os ";
      right_format = "$git_branch$git_status$c$rust$golang$nodejs$php$java$kotlin$haskell$python$docker_context$time";
      palette = "base16";
      palettes = {
        base16 = {
          color_fg0 = "#${config.colorScheme.palette.base07}";
          color_bg1 = "#${config.colorScheme.palette.base01}";
          color_bg3 = "#${config.colorScheme.palette.base03}";
          color_blue = "#${config.colorScheme.palette.base0D}";
          color_aqua = "#${config.colorScheme.palette.base0C}";
          color_green = "#${config.colorScheme.palette.base0B}";
          color_orange = "#${config.colorScheme.palette.base09}";
          color_purple = "#${config.colorScheme.palette.base0E}";
          color_red = "#${config.colorScheme.palette.base08}";
          color_yellow = "#${config.colorScheme.palette.base0A}";
        };
      };
      os = {
        disabled = false;
        style = "fg:color_blue";
        symbols = {
          Windows = "󰍲";
          Ubuntu = "󰕈";
          SUSE = "";
          Raspbian = "󰐿";
          Mint = "󰣭";
          Macos = "󰀵";
          Manjaro = "";
          Linux = "󰌽";
          Gentoo = "󰣨";
          Fedora = "󰣛";
          Alpine = "";
          Amazon = "";
          Android = "";
          Arch = "󰣇";
          Artix = "󰣇";
          CentOS = "";
          Debian = "󰣚";
          Redhat = "󱄛";
          RedHatEnterprise = "󱄛";
          NixOS = "󱄅";
        };
      };
      username = {
        show_always = true;
        style_user = "fg:color_yellow";
        style_root = "fg:color_yellow";
        format = "[$user]($style)";
      };
      hostname = {
        ssh_only = false;
        style = "fg:color_aqua";
        format = "[$hostname]($style)";
        disabled = false;
      };
      directory = {
        style = "fg:color_purple";
        format = "[$path]($style)";
        truncation_length = 3;
        truncation_symbol = "…/";
        substitutions = {
          "Documents" = "󰈙 ";
          "Downloads" = " ";
          "Music" = "󰝚 ";
          "Pictures" = " ";
          "Developer" = "󰲋 ";
        };
      };
      git_branch = {
        symbol = "";
        style = "fg:color_red";
        format = "[ $symbol $branch ]($style)";
      };
      git_status = {
        style = "fg:color_red";
        format = "[($all_status$ahead_behind) ]($style)";
      };
      nodejs = {
        symbol = "";
        style = "fg:color_blue";
        format = "[ $symbol( $version) ]($style)";
      };
      c = {
        symbol = " ";
        style = "fg:color_blue";
        format = "[ $symbol( $version) ]($style)";
      };
      rust = {
        symbol = "";
        style = "fg:color_orange";
        format = "[ $symbol( $version) ]($style)";
      };
      golang = {
        symbol = "";
        style = "fg:color_aqua";
        format = "[ $symbol( $version) ]($style)";
      };
      php = {
        symbol = "";
        style = "fg:color_purple";
        format = "[ $symbol( $version) ]($style)";
      };
      java = {
        symbol = " ";
        style = "fg:color_blue";
        format = "[ $symbol( $version) ]($style)";
      };
      kotlin = {
        symbol = "";
        style = "fg:color_purple";
        format = "[ $symbol( $version) ]($style)";
      };
      haskell = {
        symbol = "";
        style = "fg:color_purple";
        format = "[ $symbol( $version) ]($style)";
      };
      python = {
        symbol = "";
        style = "fg:color_yellow";
        format = "[ $symbol( $version) ]($style)";
      };
      docker_context = {
        symbol = "";
        style = "fg:color_blue";
        format = "[ $symbol( $context) ]($style)";
      };
      time = {
        disabled = true;
        time_format = "%R";
        style = "fg:color_blue";
        format = "[  $time ]($style)";
      };
      line_break = {
        disabled = true;
      };
      character = {
        disabled = false;
        style = "fg:color_blue";
        success_symbol = "[]($style)";
        error_symbol = "[]($style)";
        vimcmd_symbol = "[]($style)";
      };
    };
  };
}
