# This is your system's configuration file.
# Use this to configure your system environment (it replaces /etc/nixos/configuration.nix)
{
  inputs,
  outputs,
  lib,
  config,
  pkgs,
  ...
}: {
  # You can import other NixOS modules here
  imports = [
    # If you want to use modules your own flake exports (from modules/nixos):
    # outputs.nixosModules.example

    # Or modules from other flakes (such as nixos-hardware):
    # inputs.hardware.nixosModules.common-cpu-amd
    # inputs.hardware.nixosModules.common-ssd

    # You can also split up your configuration and import pieces of it here:
    # ./users.nix

    # Import your generated (nixos-generate-config) hardware configuration
    ./hardware-configuration.nix
  ];

  nixpkgs = {
    # You can add overlays here
    overlays = [
      # Add overlays your own flake exports (from overlays and pkgs dir):
      outputs.overlays.additions
      outputs.overlays.modifications
      outputs.overlays.unstable-packages
    ];
    config = {
      allowUnfree = true;
    };
  };
  nix = {
    # This will add each flake input as a registry
    # To make nix3 commands consistent with your flake
    registry = (lib.mapAttrs (_: flake: {inherit flake;})) ((lib.filterAttrs (_: lib.isType "flake")) inputs);

    # This will additionally add your inputs to the system's legacy channels
    # Making legacy nix commands consistent as well, awesome!
    nixPath = ["/etc/nix/path"];

    settings = {
      experimental-features = "nix-command flakes";
      auto-optimise-store = true;
      trusted-users = ["vilhelm"];
      trusted-public-keys = [
        "hydra.iohk.io:f/Ea+s+dFdN+3Y/G+FDgSq+a5NEWhJGzdjvKNGv0/EQ="
      ];
      substituters = [
        "https://cache.iog.io"
      ];
    };
  };

  environment = {
    etc =
      lib.mapAttrs'
      (name: value: {
        name = "nix/path/${name}";
        value.source = value.flake;
      })
      config.nix.registry;

    pathsToLink = ["/libexec"]; # links /libexec from derivations to /run/current-system/sw
    systemPackages = with pkgs; [
      #gcc
      #mesa
      #xorg.libX11
      #xorg.libXrandr
      #xorg.libXcursor
      #xorg.libXinerama
      #xorg.libXi
      #xorg.libXxf86vm
      #xorg.libXext # for Xge.h
      #xorg.libxcb
      #libGL
      #alsa-lib
      #pkg-config
    ];
    sessionVariables = {
      LD_LIBRARY_PATH = "/run/opengl-driver/lib:/run/opengl-driver-32/lib";
    };
  };

  # Set your time zone.
  time.timeZone = "Europe/Stockholm";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "sv_SE.UTF-8";
    LC_IDENTIFICATION = "sv_SE.UTF-8";
    LC_MEASUREMENT = "sv_SE.UTF-8";
    LC_MONETARY = "sv_SE.UTF-8";
    LC_NAME = "sv_SE.UTF-8";
    LC_NUMERIC = "sv_SE.UTF-8";
    LC_PAPER = "sv_SE.UTF-8";
    LC_TELEPHONE = "sv_SE.UTF-8";
    LC_TIME = "sv_SE.UTF-8";
  };

  # TODO: This is just an example, be sure to use whatever bootloader you prefer
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # TODO: Set your hostname
  networking.hostName = "mars";
  networking.networkmanager.enable = true;
  services = {
    xserver.xkb = {
      layout = "us";
      variant = "";
    };

    upower.enable = true;

    # Enable automatic login for the user.
    getty.autologinUser = "vilhelm";

    # This setups a SSH server. Very important if you're setting up a headless system.
    # Feel free to remove if you don't need it.
    openssh = {
      enable = true;
      settings = {
        # Forbid root login through SSH.
        PermitRootLogin = "no";
        # Use keys only. Remove if you want to SSH using password (not recommended)
        PasswordAuthentication = false;
      };
    };

    xserver = {
      enable = true;

      desktopManager = {
        xterm.enable = false;
      };

      displayManager = {
        defaultSession = "none+i3";
      };

      xkbOptions = "ctrl:swapcaps";

      windowManager.i3 = {
        enable = true;
        extraPackages = with pkgs; [
          dmenu
          i3status
          i3lock
        ];
      };
    };
    pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
      # If you want to use JACK applications, uncomment this
      #jack.enable = true;
    };

    #services.thermald.enable = true;
    #services.tlp = {
    #  enable = true;
    #  settings = {
    #    CPU_SCALING_GOVERNOR_ON_AC = "performance";
    #    CPU_SCALING_GOVERNOR_ON_BAT = "powersave";

    #    CPU_ENERGY_PERF_POLICY_ON_BAT = "power";
    #    CPU_ENERGY_PERF_POLICY_ON_AC = "performance";

    #    CPU_MIN_PERF_ON_AC = 0;
    #    CPU_MAX_PERF_ON_AC = 100;
    #    CPU_MIN_PERF_ON_BAT = 0;
    #    CPU_MAX_PERF_ON_BAT = 20;

    #   #Optional helps save long term battery health
    #   START_CHARGE_THRESH_BAT0 = 40; # 40 and bellow it starts to charge
    #   STOP_CHARGE_THRESH_BAT0 = 80; # 80 and above it stops charging

    #  };
    #};

    auto-cpufreq.enable = true;
    auto-cpufreq.settings = {
      battery = {
        governor = "powersave";
        turbo = "never";
      };
      charger = {
        governor = "performance";
        turbo = "auto";
      };
    };
  };
  programs = {
    fish.enable = true;

    ssh = {
      knownHosts = {
        github = {
          hostNames = ["github.com"];
          publicKey = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAINkMPyR8oEZRq6
EFSql1ch1ub5+O8eWzPXPWTLrRZx4a";
        };
        gitlab = {
          hostNames = ["gitlab.com"];
          publicKey = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAINkMPyR8oEZRq6
EFSql1ch1ub5+O8eWzPXPWTLrRZx4a";
        };
      };
    };
  };
  virtualisation.docker.enable = true;

  # TODO: Configure your system-wide user settings (groups, etc), add more users as needed.
  users.users = {
    # FIXME: Replace with your username
    vilhelm = {
      # TODO: You can set an initial password for your user.
      # If you do, you can skip setting a root password by passing '--no-root-passwd' to nixos-install.
      # Be sure to change it (using passwd) after rebooting!
      initialPassword = "vilhelm0516";
      isNormalUser = true;
      openssh.authorizedKeys.keys = [
        # TODO: Add your SSH public key(s) here, if you plan on using SSH to connect
        "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAINkMPyR8oEZRq6EFSql1ch1ub5+O8eWzPXPWTLrRZx4a vilhelm.lindell123@gmail.com"
      ];
      shell = pkgs.fish;
      packages = with pkgs; [
        home-manager
      ];
      # TODO: Be sure to add any other groups you need (such as networkmanager, audio, docker, etc)
      extraGroups = ["networkmanager" "wheel" "video" "docker" "cargo"];
    };
  };

  hardware = {
    bluetooth.enable = true;

    opengl = {
      enable = true;
      driSupport = true;
      driSupport32Bit = true;
      #package = (import /srv/nixpkgs-mesa {}).pkgs.mesa.drivers;
    }; # or "nvidiaLegacy470 etc.

    nvidia = {
      # Modesetting is required.
      modesetting.enable = true;

      # Nvidia power management. Experimental, and can cause sleep/suspend to fail.
      # Enable this if you have graphical corruption issues or application crashes after waking
      # up from sleep. This fixes it by saving the entire VRAM memory to /tmp/ instead
      # of just the bare essentials.
      powerManagement.enable = false;

      # Fine-grained power management. Turns off GPU when not in use.
      # Experimental and only works on modern Nvidia GPUs (Turing or newer).
      powerManagement.finegrained = false;

      # Use the NVidia open source kernel module (not to be confused with the
      # independent third-party "nouveau" open source driver).
      # Support is limited to the Turing and later architectures. Full list of
      # supported GPUs is at:
      # https://github.com/NVIDIA/open-gpu-kernel-modules#compatible-gpus
      # Only available from driver 515.43.04+
      # Currently alpha-quality/buggy, so false is currently the recommended setting.
      open = false;

      # Enable the Nvidia settings menu,
      # accessible via `nvidia-settings`.
      nvidiaSettings = true;

      # Optionally, you may need to select the appropriate driver version for your specific GPU.
      package = config.boot.kernelPackages.nvidiaPackages.stable;
    };
  };
  services.xserver.videoDrivers = ["nvidia"];

  security.rtkit.enable = true;

  # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  system.stateVersion = "23.11";
}
