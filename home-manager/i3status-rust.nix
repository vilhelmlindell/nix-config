{ pkgs, ... }:


{
  xsession.windowManager.i3.config.bars = [
    {
      fonts = {
        names = [ "JetBrainsMono" "FontAwesome" ];
        style = "Regular";
        size = 11.0;
      };
      position = "bottom";
      command = "${pkgs.i3status-rust}/bin/i3status-rs";
      colors = {
        background = "#666666";
        statusline = "#222222";
        separator = "#dddddd";

        focusedWorkspace = { 
          border = "#4c7899";
          background = "#285577";
          text = "#ffffff";
        };
        activeWorkspace = {
          border = "#333333";
          background = "#5f676a";
          text = "#ffffff";
        };
        inactiveWorkspace = {
          border = "#333333";
          background = "#222222";
          text = "#888888";
        };
        urgentWorkspace = {
          border = "#2f343a";
          background = "#900000";
          text = "#ffffff";
        };
        bindingMode = {
          border = "#2f343a";
          background = "#900000";
          text = "#ffffff";
        };
      };
    }
  ];
  programs.i3status-rust = {
    enable = true;
    bars = {
      default = {
        blocks = [
           {
             block = "disk_space";
             path = "/";
             info_type = "available";
             interval = 60;
             warning = 20.0;
             alert = 10.0;
           }
           {
             block = "memory";
             format_mem = " $icon $mem_used_percents ";
             format_swap = " $icon $swap_used_percents ";
           }
           {
             block = "cpu";
             interval = 1;
           }
           {
             block = "load";
             interval = 1;
             format = " $icon $1m ";
           }
           { block = "sound"; }
           {
             block = "time";
             interval = 60;
             format = " $timestamp.datetime(f:'%a %d/%m %R') ";
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
        icons = "awesome5";
        theme = "gruvbox-dark";
      };
    };
  };
}
