{
  config.modules.system = {
    mainUser = "winder";
    fs.enabledFilesystems = ["btrfs" "vfat" "ntfs" "exfat" "zfs"];
    autoLogin = true;

    boot = {
      loader = "grub";
      #secureBoot = false;
      #enableKernelTweaks = true;
      #initrd.enableTweaks = true;
      #loadRecommendedModules = true;
      #tmpOnTmpfs = false;
    };
    #boot = {
    #  secureBoot = false;
    #  loader = "systemd-boot";
    #  enableKernelTweaks = true;
    #  initrd.enableTweaks = true;
    #  loadRecommendedModules = true;
    #  tmpOnTmpfs = true;
    #};

    #containers = {
    #  enabledContainers = ["alpha"];
    #};

    #yubikeySupport.enable = true;

    video.enable = true;
    sound.enable = true;
    bluetooth.enable = false;
    printing.enable = false;
    emulation.enable = true;

    virtualization = {
      enable = true;
      qemu.enable = true;
      docker.enable = true;
    };

    networking = {
      optimizeTcp = true;
      nftables.enable = true;
      tailscale = {
        enable = true;
        isClient = true;
        isServer = false;
      };
    };

    #security = {
    #  tor.enable = true;
    #  fixWebcam = false;
    #  lockModules = true;
    #  auditd.enable = true;
    #};

    programs = {
      cli.enable = true;
      gui.enable = true;

      #spotify.enable = true;

      #git.signingKey = "0xAF26552424E53993 ";

      gaming = {
        enable = true;
      };

      default = {
        terminal = "alacritty";
      };

      #libreoffice.enable = true;
    };
  };
}
