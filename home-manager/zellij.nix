{config, ...}: {
  configPath = "/home/vilhelm/nix-config/home-manager/created-files/zellij/config.kdl";
  layoutPath = "/home/vilhelm/nix-config/home-manager/created-files/zellij/layout.kdl";

  layoutKdl = ''
    layout {
      pane size=1 borderless=true {
        plugin location="zellij:tab-bar"
      }
      pane
      pane size=1 borderless=true {
        plugin location="zellij:status-bar"
      }
    }
  '';

  configKdl = ''
    // If you'd like to override the default keybindings completely, be sure to change "keybinds" to "keybinds clear-defaults=true"
    keybinds clear-defaults=true {
        normal {
            // uncomment this and adjust key if using copy_on_select=false
            // bind "Alt c" { Copy; }
            bind "Alt w" { CloseFocus; }
            bind "Alt f" { ToggleFocusFullscreen; }
        }
        locked {
            bind "Alt g" { SwitchToMode "Normal"; }
        }
        resize {
            bind "Alt r" { SwitchToMode "Normal"; }
            bind "h" "Left" { Resize "Increase Left"; }
            bind "j" "Down" { Resize "Increase Down"; }
            bind "k" "Up" { Resize "Increase Up"; }
            bind "l" "Right" { Resize "Increase Right"; }
            bind "H" { Resize "Decrease Left"; }
            bind "J" { Resize "Decrease Down"; }
            bind "K" { Resize "Decrease Up"; }
            bind "L" { Resize "Decrease Right"; }
            bind "=" "+" { Resize "Increase"; }
            bind "-" { Resize "Decrease"; }
        }
        pane {
            bind "Alt p" { SwitchToMode "Normal"; }
            bind "h" "Left" { MoveFocus "Left"; }
            bind "l" "Right" { MoveFocus "Right"; }
            bind "j" "Down" { MoveFocus "Down"; }
            bind "k" "Up" { MoveFocus "Up"; }
            bind "p" { SwitchFocus; }
            bind "n" { NewPane; SwitchToMode "Normal"; }
            bind "d" { NewPane "Down"; SwitchToMode "Normal"; }
            bind "r" { NewPane "Right"; SwitchToMode "Normal"; }
            bind "x" { CloseFocus; SwitchToMode "Normal"; }
            bind "f" { ToggleFocusFullscreen; SwitchToMode "Normal"; }
            bind "z" { TogglePaneFrames; SwitchToMode "Normal"; }
            bind "w" { ToggleFloatingPanes; SwitchToMode "Normal"; }
            bind "e" { TogglePaneEmbedOrFloating; SwitchToMode "Normal"; }
            bind "c" { SwitchToMode "RenamePane"; PaneNameInput 0;}
        }
        move {
            bind "Alt m" { SwitchToMode "Normal"; }
            bind "n" "Tab" { MovePane; }
            bind "p" { MovePaneBackwards; }
            bind "h" "Left" { MovePane "Left"; }
            bind "j" "Down" { MovePane "Down"; }
            bind "k" "Up" { MovePane "Up"; }
            bind "l" "Right" { MovePane "Right"; }
        }
        tab {
            bind "Alt t" { SwitchToMode "Normal"; }
            bind "r" { SwitchToMode "RenameTab"; TabNameInput 0; }
            bind "h" "Left" "Up" "k" { GoToPreviousTab; }
            bind "l" "Right" "Down" "j" { GoToNextTab; }
            bind "n" { NewTab; SwitchToMode "Normal"; }
            bind "x" { CloseTab; SwitchToMode "Normal"; }
            bind "s" { ToggleActiveSyncTab; SwitchToMode "Normal"; }
            bind "b" { BreakPane; SwitchToMode "Normal"; }
            bind "]" { BreakPaneRight; SwitchToMode "Normal"; }
            bind "[" { BreakPaneLeft; SwitchToMode "Normal"; }
            bind "1" { GoToTab 1; SwitchToMode "Normal"; }
            bind "2" { GoToTab 2; SwitchToMode "Normal"; }
            bind "3" { GoToTab 3; SwitchToMode "Normal"; }
            bind "4" { GoToTab 4; SwitchToMode "Normal"; }
            bind "5" { GoToTab 5; SwitchToMode "Normal"; }
            bind "6" { GoToTab 6; SwitchToMode "Normal"; }
            bind "7" { GoToTab 7; SwitchToMode "Normal"; }
            bind "8" { GoToTab 8; SwitchToMode "Normal"; }
            bind "9" { GoToTab 9; SwitchToMode "Normal"; }
            bind "Tab" { ToggleTab; }
        }
        scroll {
            bind "Alt s" { SwitchToMode "Normal"; }
            bind "e" { EditScrollback; SwitchToMode "Normal"; }
            bind "s" { SwitchToMode "EnterSearch"; SearchInput 0; }
            bind "Ctrl c" { ScrollToBottom; SwitchToMode "Normal"; }
            bind "j" "Down" { ScrollDown; }
            bind "k" "Up" { ScrollUp; }
            bind "Ctrl f" "PageDown" "Right" "l" { PageScrollDown; }
            bind "Ctrl b" "PageUp" "Left" "h" { PageScrollUp; }
            bind "d" { HalfPageScrollDown; }
            bind "u" { HalfPageScrollUp; }
            // uncomment this and adjust key if using copy_on_select=false
            // bind "Alt c" { Copy; }
        }
        search {
            bind "Alt s" { SwitchToMode "Normal"; }
            bind "Alt c" { ScrollToBottom; SwitchToMode "Normal"; }
            bind "j" "Down" { ScrollDown; }
            bind "k" "Up" { ScrollUp; }
            bind "Ctrl f" "PageDown" "Right" "l" { PageScrollDown; }
            bind "Ctrl b" "PageUp" "Left" "h" { PageScrollUp; }
            bind "d" { HalfPageScrollDown; }
            bind "u" { HalfPageScrollUp; }
            bind "n" { Search "down"; }
            bind "p" { Search "up"; }
            bind "c" { SearchToggleOption "CaseSensitivity"; }
            bind "w" { SearchToggleOption "Wrap"; }
            bind "o" { SearchToggleOption "WholeWord"; }
        }
        entersearch {
            bind "Alt c" "Esc" { SwitchToMode "Scroll"; }
            bind "Enter" { SwitchToMode "Search"; }
        }
        renametab {
            bind "Alt c" { SwitchToMode "Normal"; }
            bind "Esc" { UndoRenameTab; SwitchToMode "Tab"; }
        }
        renamepane {
            bind "Alt c" { SwitchToMode "Normal"; }
            bind "Esc" { UndoRenamePane; SwitchToMode "Pane"; }
        }
        session {
            bind "Alt o" { SwitchToMode "Normal"; }
            bind "Alt s" { SwitchToMode "Scroll"; }
            bind "d" { Detach; }
            bind "w" {
                LaunchOrFocusPlugin "zellij:session-manager" {
                    floating true
                    move_to_focused_tab true
                };
                SwitchToMode "Normal"
            }
        }
        tmux {
            bind "[" { SwitchToMode "Scroll"; }
            bind "Ctrl b" { Write 2; SwitchToMode "Normal"; }
            bind "\"" { NewPane "Down"; SwitchToMode "Normal"; }
            bind "%" { NewPane "Right"; SwitchToMode "Normal"; }
            bind "z" { ToggleFocusFullscreen; SwitchToMode "Normal"; }
            bind "c" { NewTab; SwitchToMode "Normal"; }
            bind "," { SwitchToMode "RenameTab"; }
            bind "p" { GoToPreviousTab; SwitchToMode "Normal"; }
            bind "n" { GoToNextTab; SwitchToMode "Normal"; }
            bind "Left" { MoveFocus "Left"; SwitchToMode "Normal"; }
            bind "Right" { MoveFocus "Right"; SwitchToMode "Normal"; }
            bind "Down" { MoveFocus "Down"; SwitchToMode "Normal"; }
            bind "Up" { MoveFocus "Up"; SwitchToMode "Normal"; }
            bind "h" { MoveFocus "Left"; SwitchToMode "Normal"; }
            bind "l" { MoveFocus "Right"; SwitchToMode "Normal"; }
            bind "j" { MoveFocus "Down"; SwitchToMode "Normal"; }
            bind "k" { MoveFocus "Up"; SwitchToMode "Normal"; }
            bind "o" { FocusNextPane; }
            bind "d" { Detach; }
            bind "Space" { NextSwapLayout; }
            bind "x" { CloseFocus; SwitchToMode "Normal"; }
        }
        shared_except "locked" {
            bind "Alt g" { SwitchToMode "Locked"; }
            bind "Alt q" { Quit; }
            bind "Alt n" { NewPane; }
            bind "Alt h" "Alt Left" { MoveFocusOrTab "Left"; }
            bind "Alt l" "Alt Right" { MoveFocusOrTab "Right"; }
            bind "Alt j" "Alt Down" { MoveFocus "Down"; }
            bind "Alt k" "Alt Up" { MoveFocus "Up"; }
            bind "Alt =" "Alt +" { Resize "Increase"; }
            bind "Alt -" { Resize "Decrease"; }
            bind "Alt [" { PreviousSwapLayout; }
            bind "Alt ]" { NextSwapLayout; }
        }
        shared_except "normal" "locked" {
            bind "Enter" "Esc" { SwitchToMode "Normal"; }
        }
        shared_except "pane" "locked" {
            bind "Alt p" { SwitchToMode "Pane"; }
        }
        shared_except "resize" "locked" {
            bind "Alt r" { SwitchToMode "Resize"; }
        }
        shared_except "scroll" "locked" {
            bind "Alt s" { SwitchToMode "Scroll"; }
        }
        shared_except "session" "locked" {
            bind "Alt o" { SwitchToMode "Session"; }
        }
        shared_except "tab" "locked" {
            bind "Alt t" { SwitchToMode "Tab"; }
        }
        shared_except "move" "locked" {
            bind "Alt m" { SwitchToMode "Move"; }
        }
        shared_except "tmux" "locked" {
            bind "Alt b" { SwitchToMode "Tmux"; }
        }
    }

    plugins {
        tab-bar { path "tab-bar"; }
        status-bar { path "status-bar"; }
        strider { path "strider"; }
        compact-bar { path "compact-bar"; }
        session-manager { path "session-manager"; }
    }

    // Choose what to do when zellij receives SIGTERM, SIGINT, SIGQUIT or SIGHUP
    // eg. when terminal window with an active zellij session is closed
    // Options:
    //   - detach (Default)
    //   - quit
    //
    on_force_close "quit"
    //  Send a request for a simplified ui (without arrow fonts) to plugins
    //  Options:
    //    - true
    //    - false (Default)
    //
    // simplified_ui true

    // Choose the path to the default shell that zellij will use for opening new panes
    // Default: $SHELL
    //
    default_shell "fish"

    // Choose the path to override cwd that zellij will use for opening new panes
    //
    // default_cwd ""

    // Toggle between having pane frames around the panes
    // Options:
    //   - true (default)
    //   - false
    //
    pane_frames false

    // Toggle between having Zellij lay out panes according to a predefined set of layouts whenever possible
    // Options:
    //   - true (default)
    //   - false
    //
    // auto_layout true

    // Whether sessions should be serialized to the cache folder (including their tabs/panes, cwds and running commands) so that they can later be resurrected
    // Options:
    //   - true (default)
    //   - false
    //
    // session_serialization false

    // Whether pane viewports are serialized along with the session, default is false
    // Options:
    //   - true
    //   - false (default)
    // serialize_pane_viewport true

    // Scrollback lines to serialize along with the pane viewport when serializing sessions, 0
    // defaults to the scrollback size. If this number is higher than the scrollback size, it will
    // also default to the scrollback size. This does nothing if `serialize_pane_viewport` is not true.
    //
    // scrollback_lines_to_serialize 10000

    // Define color themes for Zellij
    // For more examples, see: https://github.com/zellij-org/zellij/tree/main/example/themes
    // Once these themes are defined, one of them should to be selected in the "theme" section of this file
    //
    themes {
      base16 {
        fg "#${config.colorScheme.palette.base05}"
        bg "#${config.colorScheme.palette.base01}"
        black "#${config.colorScheme.palette.base00}"
        red "#${config.colorScheme.palette.base08}"
        green "#${config.colorScheme.palette.base0B}"
        yellow "#${config.colorScheme.palette.base0A}"
        blue "#${config.colorScheme.palette.base0D}"
        magenta "#${config.colorScheme.palette.base0E}"
        cyan "#${config.colorScheme.palette.base0C}"
        white "#${config.colorScheme.palette.base05}"
        orange "#${config.colorScheme.palette.base09}"
      }
    }

    // Choose the theme that is specified in the themes section.
    // Default: default
    //
    theme "base16"

    // The name of the default layout to load on startup
    // Default: "default"
    //
    // default_layout "compact"

    // Choose the mode that zellij uses when starting up.
    // Default: normal
    //
    // default_mode "locked"

    // Toggle enabling the mouse mode.
    // On certain configurations, or terminals this could
    // potentially interfere with copying text.
    // Options:
    //   - true (default)
    //   - false
    //
    // mouse_mode false

    // Configure the scroll back buffer size
    // This is the number of lines zellij stores for each pane in the scroll back
    // buffer. Excess number of lines are discarded in a FIFO fashion.
    // Valid values: positive integers
    // Default value: 10000
    //
    // scroll_buffer_size 10000

    // Provide a command to execute when copying text. The text will be piped to
    // the stdin of the program to perform the copy. This can be used with
    // terminal emulators which do not support the OSC 52 ANSI control sequence
    // that will be used by default if this option is not set.
    // Examples:
    //
    copy_command "xclip -selection clipboard" // x11
    // copy_command "wl-copy"                    // wayland
    // copy_command "pbcopy"                     // osx

    // Choose the destination for copied text
    // Allows using the primary selection buffer (on x11/wayland) instead of the system clipboard.
    // Does not apply when using copy_command.
    // Options:
    //   - system (default)
    //   - primary
    //
    // copy_clipboard "primary"

    // Enable or disable automatic copy (and clear) of selection when releasing mouse
    // Default: true
    //
    // copy_on_select false

    // Path to the default editor to use to edit pane scrollbuffer
    // Default: $EDITOR or $VISUAL
    //
    scrollback_editor "/usr/bin/vim"

    // When attaching to an existing session with other users,
    // should the session be mirrored (true)
    // or should each user have their own cursor (false)
    // Default: false
    //
    // mirror_session true

    // The folder in which Zellij will look for layouts
    //
    // layout_dir "/path/to/my/layout_dir"

    // The folder in which Zellij will look for themes
    //
    // theme_dir "/path/to/my/theme_dir"

    // Enable or disable the rendering of styled and colored underlines (undercurl).
    // May need to be disabled for certain unsupported terminals
    // Default: true
    //
    // styled_underlines true
  '';
}
#  settings = {
#    theme = "base16";
#    themes = {
#      base16 = {
#        fg = "#${config.colorScheme.palette.base04}";
#        bg = "#${config.colorScheme.palette.base01}";
#        black = "#${config.colorScheme.palette.base00}";
#        red = "#${config.colorScheme.palette.base08}";
#        green = "#${config.colorScheme.palette.base0B}";
#        yellow = "#${config.colorScheme.palette.base0A}";
#        blue = "#${config.colorScheme.palette.base0D}";
#        magenta = "#${config.colorScheme.palette.base0E}";
#        cyan = "#${config.colorScheme.palette.base0C}";
#        white = "#${config.colorScheme.palette.base05}";
#        orange = "#${config.colorScheme.palette.base09}";
#      };
#    };
#    pane_frames = false;
#    #config is currently in a .kdl file see https://github.com/nix-community/home-manager/pull/3399 and https://github.com/nix-community/home-manager/pull/4614 for info
#    keybinds = {
#      pane = {
#        bind = [
#          "Alt p"
#          {SwitchToMode = "Normal";}
#          "h"
#          {MoveFocus = "Left";}
#          "l"
#          {MoveFocus = "Right";}
#          "j"
#          {MoveFocus = "Down";}
#          "k"
#          {MoveFocus = "Up";}
#          "p"
#          {SwitchFocus = true;}
#          "n"
#          {
#            NewPane = true;
#            SwitchToMode = "Normal";
#          }
#          "d"
#          {
#            NewPane = "Down";
#            SwitchToMode = "Normal";
#          }
#          "r"
#          {
#            NewPane = "Right";
#            SwitchToMode = "Normal";
#          }
#          "x"
#          {
#            CloseFocus = true;
#            SwitchToMode = "Normal";
#          }
#          "f"
#          {
#            ToggleFocusFullscreen = true;
#            SwitchToMode = "Normal";
#          }
#          "z"
#          {
#            TogglePaneFrames = true;
#            SwitchToMode = "Normal";
#          }
#          "w"
#          {
#            ToggleFloatingPanes = true;
#            SwitchToMode = "Normal";
#          }
#          "e"
#          {
#            TogglePaneEmbedOrFloating = true;
#            SwitchToMode = "Normal";
#          }
#          "c"
#          {
#            SwitchToMode = "RenamePane";
#            PaneNameInput = 0;
#          }
#        ];
#      };
#    };
#    #keybinds = {
#    #  normal = [
#    #    {
#    #      bind = "Alt w";
#    #      action = "CloseFocus";
#    #    }
#    #    {
#    #      bind = "Alt f";
#    #      action = "ToggleFocusFullscreen";
#    #    }
#    #  ];
#    #  locked = [
#    #    {
#    #      bind = "Alt g";
#    #      action = "SwitchToMode";
#    #      mode = "Normal";
#    #    }
#    #  ];
#    #  resize = [
#    #    {
#    #      bind = "Alt r";
#    #      action = "SwitchToMode";
#    #      mode = "Normal";
#    #    }
#    #    {
#    #      bind = "h";
#    #      key = "Left";
#    #      action = "Resize";
#    #      direction = "Increase Left";
#    #    }
#    #    {
#    #      bind = "j";
#    #      key = "Down";
#    #      action = "Resize";
#    #      direction = "Increase Down";
#    #    }
#    #    {
#    #      bind = "k";
#    #      key = "Up";
#    #      action = "Resize";
#    #      direction = "Increase Up";
#    #    }
#    #    {
#    #      bind = "l";
#    #      key = "Right";
#    #      action = "Resize";
#    #      direction = "Increase Right";
#    #    }
#    #    {
#    #      bind = "H";
#    #      action = "Resize";
#    #      direction = "Decrease Left";
#    #    }
#    #    {
#    #      bind = "J";
#    #      action = "Resize";
#    #      direction = "Decrease Down";
#    #    }
#    #    {
#    #      bind = "K";
#    #      action = "Resize";
#    #      direction = "Decrease Up";
#    #    }
#    #    {
#    #      bind = "L";
#    #      action = "Resize";
#    #      direction = "Decrease Right";
#    #    }
#    #    {
#    #      bind = "=";
#    #      key = "+";
#    #      action = "Resize";
#    #      direction = "Increase";
#    #    }
#    #    {
#    #      bind = "-";
#    #      action = "Resize";
#    #      direction = "Decrease";
#    #    }
#    #  ];
#    #  pane = [
#    #    {
#    #      bind = "Alt p";
#    #      action = "SwitchToMode";
#    #      mode = "Normal";
#    #    }
#    #    {
#    #      bind = "h";
#    #      key = "Left";
#    #      action = "MoveFocus";
#    #      direction = "Left";
#    #    }
#    #    {
#    #      bind = "l";
#    #      key = "Right";
#    #      action = "MoveFocus";
#    #      direction = "Right";
#    #    }
#    #    {
#    #      bind = "j";
#    #      key = "Down";
#    #      action = "MoveFocus";
#    #      direction = "Down";
#    #    }
#    #    {
#    #      bind = "k";
#    #      key = "Up";
#    #      action = "MoveFocus";
#    #      direction = "Up";
#    #    }
#    #    {
#    #      bind = "p";
#    #      action = "SwitchFocus";
#    #    }
#    #    {
#    #      bind = "n";
#    #      action = "NewPane";
#    #      post_actions = ["SwitchToMode" "Normal"];
#    #    }
#    #    {
#    #      bind = "d";
#    #      action = "NewPane";
#    #      arguments = ["Down"];
#    #      post_actions = ["SwitchToMode" "Normal"];
#    #    }
#    #    {
#    #      bind = "r";
#    #      action = "NewPane";
#    #      arguments = ["Right"];
#    #      post_actions = ["SwitchToMode" "Normal"];
#    #    }
#    #    {
#    #      bind = "x";
#    #      action = "CloseFocus";
#    #      post_actions = ["SwitchToMode" "Normal"];
#    #    }
#    #    {
#    #      bind = "f";
#    #      action = "ToggleFocusFullscreen";
#    #      post_actions = ["SwitchToMode" "Normal"];
#    #    }
#    #    {
#    #      bind = "z";
#    #      action = "TogglePaneFrames";
#    #      post_actions = ["SwitchToMode" "Normal"];
#    #    }
#    #    {
#    #      bind = "w";
#    #      action = "ToggleFloatingPanes";
#    #      post_actions = ["SwitchToMode" "Normal"];
#    #    }
#    #    {
#    #      bind = "e";
#    #      action = "TogglePaneEmbedOrFloating";
#    #      post_actions = ["SwitchToMode" "Normal"];
#    #    }
#    #    {
#    #      bind = "c";
#    #      action = "SwitchToMode";
#    #      mode = "RenamePane";
#    #      arguments = [0];
#    #    }
#    #  ];
#    #  move = [
#    #    {
#    #      bind = "Alt m";
#    #      action = "SwitchToMode";
#    #      mode = "Normal";
#    #    }
#    #    {
#    #      bind = "n";
#    #      key = "Tab";
#    #      action = "MovePane";
#    #    }
#    #    {
#    #      bind = "p";
#    #      action = "MovePaneBackwards";
#    #    }
#    #    {
#    #      bind = "h";
#    #      key = "Left";
#    #      action = "MovePane";
#    #      direction = "Left";
#    #    }
#    #    {
#    #      bind = "j";
#    #      key = "Down";
#    #      action = "MovePane";
#    #      direction = "Down";
#    #    }
#    #    {
#    #      bind = "k";
#    #      key = "Up";
#    #      action = "MovePane";
#    #      direction = "Up";
#    #    }
#    #    {
#    #      bind = "l";
#    #      key = "Right";
#    #      action = "MovePane";
#    #      direction = "Right";
#    #    }
#    #  ];
#    #  tab = [
#    #    {
#    #      bind = "Alt t";
#    #      action = "SwitchToMode";
#    #      mode = "Normal";
#    #    }
#    #    {
#    #      bind = "r";
#    #      action = "SwitchToMode";
#    #      mode = "RenameTab";
#    #      arguments = ["TabNameInput" 0];
#    #    }
#    #    {
#    #      bind = "h";
#    #      keys = ["Left" "Up" "k"];
#    #      action = "GoToPreviousTab";
#    #    }
#    #    {
#    #      bind = "l";
#    #      keys = ["Right" "Down" "j"];
#    #      action = "GoToNextTab";
#    #    }
#    #    {
#    #      bind = "n";
#    #      action = "NewTab";
#    #      post_actions = ["SwitchToMode" "Normal"];
#    #    }
#    #    {
#    #      bind = "x";
#    #      action = "CloseTab";
#    #      post_actions = ["SwitchToMode" "Normal"];
#    #    }
#    #    {
#    #      bind = "s";
#    #      action = "ToggleActiveSyncTab";
#    #      post_actions = ["SwitchToMode" "Normal"];
#    #    }
#    #    {
#    #      bind = "]";
#    #      action = "BreakPaneRight";
#    #      post_actions = ["SwitchToMode" "Normal"];
#    #    }
#    #    {
#    #      bind = "[";
#    #      action = "BreakPaneLeft";
#    #      post_actions = ["SwitchToMode" "Normal"];
#    #    }
#    #    {
#    #      bind = "1";
#    #      action = "GoToTab";
#    #      arguments = [1];
#    #      post_actions = ["SwitchToMode" "Normal"];
#    #    }
#    #    {
#    #      bind = "2";
#    #      action = "GoToTab";
#    #      arguments = [2];
#    #      post_actions = ["SwitchToMode" "Normal"];
#    #    }
#    #    {
#    #      bind = "3";
#    #      action = "GoToTab";
#    #      arguments = [3];
#    #      post_actions = ["SwitchToMode" "Normal"];
#    #    }
#    #    {
#    #      bind = "4";
#    #      action = "GoToTab";
#    #      arguments = [4];
#    #      post_actions = ["SwitchToMode" "Normal"];
#    #    }
#    #    {
#    #      bind = "5";
#    #      action = "GoToTab";
#    #      arguments = [5];
#    #      post_actions = ["SwitchToMode" "Normal"];
#    #    }
#    #    {
#    #      bind = "6";
#    #      action = "GoToTab";
#    #      arguments = [6];
#    #      post_actions = ["SwitchToMode" "Normal"];
#    #    }
#    #    {
#    #      bind = "7";
#    #      action = "GoToTab";
#    #      arguments = [7];
#    #      post_actions = ["SwitchToMode" "Normal"];
#    #    }
#    #    {
#    #      bind = "8";
#    #      action = "GoToTab";
#    #      arguments = [8];
#    #      post_actions = ["SwitchToMode" "Normal"];
#    #    }
#    #    {
#    #      bind = "9";
#    #      action = "GoToTab";
#    #      arguments = [9];
#    #      post_actions = ["SwitchToMode" "Normal"];
#    #    }
#    #    {
#    #      bind = "Tab";
#    #      action = "ToggleTab";
#    #    }
#    #  ];
#    #  scroll = [
#    #    {
#    #      bind = "Alt s";
#    #      action = "SwitchToMode";
#    #      mode = "Normal";
#    #    }
#    #    {
#    #      bind = "e";
#    #      action = "EditScrollback";
#    #      post_actions = ["SwitchToMode" "Normal"];
#    #    }
#    #    {
#    #      bind = "s";
#    #      action = "SwitchToMode";
#    #      mode = "EnterSearch";
#    #      arguments = [0];
#    #    }
#    #    {
#    #      bind = "Ctrl c";
#    #      action = "ScrollToBottom";
#    #      post_actions = ["SwitchToMode" "Normal"];
#    #    }
#    #    {
#    #      bind = "j";
#    #      key = "Down";
#    #      action = "ScrollDown";
#    #    }
#    #    {
#    #      bind = "k";
#    #      key = "Up";
#    #      action = "ScrollUp";
#    #    }
#    #    {
#    #      bind = "Ctrl f";
#    #      keys = ["PageDown" "Right" "l"];
#    #      action = "PageScrollDown";
#    #    }
#    #    {
#    #      bind = "Ctrl b";
#    #      keys = ["PageUp" "Left" "h"];
#    #      action = "PageScrollUp";
#    #    }
#    #    {
#    #      bind = "d";
#    #      action = "HalfPageScrollDown";
#    #    }
#    #    {
#    #      bind = "u";
#    #      action = "HalfPageScrollUp";
#    #    }
#    #  ];
#    #  search = [
#    #    {
#    #      bind = "Alt s";
#    #      action = "SwitchToMode";
#    #      mode = "Normal";
#    #    }
#    #    {
#    #      bind = "Alt c";
#    #      action = "ScrollToBottom";
#    #      post_actions = ["SwitchToMode" "Normal"];
#    #    }
#    #    {
#    #      bind = "j";
#    #      key = "Down";
#    #      action = "ScrollDown";
#    #    }
#    #    {
#    #      bind = "k";
#    #      key = "Up";
#    #      action = "ScrollUp";
#    #    }
#    #    {
#    #      bind = "Ctrl f";
#    #      keys = ["PageDown" "Right" "l"];
#    #      action = "PageScrollDown";
#    #    }
#    #    {
#    #      bind = "Ctrl b";
#    #      keys = ["PageUp" "Left" "h"];
#    #      action = "PageScrollUp";
#    #    }
#    #    {
#    #      bind = "d";
#    #      action = "HalfPageScrollDown";
#    #    }
#    #    {
#    #      bind = "u";
#    #      action = "HalfPageScrollUp";
#    #    }
#    #    {
#    #      bind = "n";
#    #      action = "Search";
#    #      arguments = ["down"];
#    #    }
#    #    {
#    #      bind = "p";
#    #      action = "Search";
#    #      arguments = ["up"];
#    #    }
#    #    {
#    #      bind = "c";
#    #      action = "SearchToggleOption";
#    #      arguments = ["CaseSensitivity"];
#    #    }
#    #    {
#    #      bind = "w";
#    #      action = "SearchToggleOption";
#    #      arguments = ["Wrap"];
#    #    }
#    #    {
#    #      bind = "o";
#    #      action = "SearchToggleOption";
#    #      arguments = ["WholeWord"];
#    #    }
#    #  ];
#    #  entersearch = [
#    #    {
#    #      bind = "Alt c";
#    #      key = "Esc";
#    #      post_actions = ["SwitchToMode" "Scroll"];
#    #    }
#    #    {
#    #      bind = "Enter";
#    #      action = "SwitchToMode";
#    #      mode = "Search";
#    #    }
#    #  ];
#    #  renametab = [
#    #    {
#    #      bind = "Alt c";
#    #      action = "SwitchToMode";
#    #      mode = "Normal";
#    #    }
#    #    {
#    #      bind = "Esc";
#    #      action = "UndoRenameTab";
#    #      post_actions = ["SwitchToMode" "Tab"];
#    #    }
#    #  ];
#    #  renamepane = [
#    #    {
#    #      bind = "Alt c";
#    #      action = "SwitchToMode";
#    #      mode = "Normal";
#    #    }
#    #    {
#    #      bind = "Esc";
#    #      action = "UndoRenamePane";
#    #      post_actions = ["SwitchToMode" "Pane"];
#    #    }
#    #  ];
#    #  session = [
#    #    {
#    #      bind = "Alt o";
#    #      action = "SwitchToMode";
#    #      mode = "Normal";
#    #    }
#    #    {
#    #      bind = "Alt s";
#    #      action = "SwitchToMode";
#    #      mode = "Scroll";
#    #    }
#    #    {
#    #      bind = "d";
#    #      action = "Detach";
#    #    }
#    #    {
#    #      bind = "w";
#    #      action = "LaunchOrFocusPlugin";
#    #      plugin = "zellij:session-manager";
#    #      arguments = [
#    #        {
#    #          floating = true;
#    #          move_to_focused_tab = true;
#    #        }
#    #      ];
#    #      post_actions = ["SwitchToMode" "Normal"];
#    #    }
#    #  ];
#    #};
#  };
#};
