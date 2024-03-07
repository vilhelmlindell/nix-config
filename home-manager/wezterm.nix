{ ... }:

{
  programs.wezterm = {
    enable = true;
    extraConfig = ''
        return {
          font = wezterm.font("JetBrainsMonoNL Nerd Font"),
	  font_size = 16.0,
	  color_scheme = 'Catppuccin Mocha',
	  enable_tab_bar = false
	} 
      '';
  };
}
