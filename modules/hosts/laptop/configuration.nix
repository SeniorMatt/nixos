{ self, ... }:
{
  flake.nixosModules.laptop = { pkgs, ...}: {
    imports = [ 
      self.nixosModules.laptopHardware

      self.nixosModules.base 
      self.nixosModules.gamedev
      self.nixosModules.games
      self.nixosModules.videos
    ];
  
    # Use the systemd-boot EFI boot loader.
    boot.loader.systemd-boot.enable = true;
    boot.loader.efi.canTouchEfiVariables = true;
  
    # Use latest kernel.
    boot.kernelPackages = pkgs.linuxPackages_latest;
  
    # Enable flakes.
    nix.settings.experimental-features = [ "nix-command" "flakes" ];
  
    networking.hostName = "nixos"; # Define your hostname.
  
    # Configure network connections interactively with nmcli or nmtui.
    networking.networkmanager.enable = true;
  
    # Set your time zone.
    time.timeZone = "Asia/Almaty";
  
    # Select internationalisation properties.
    i18n.defaultLocale = "en_US.UTF-8";
  
    # Enable CUPS to print documents.
    services.printing.enable = true;
  
    # Enable sound.
    services.pipewire = {
      enable = true;
      pulse.enable = true;
    };

    # Enable OpenCL support.
    hardware.graphics = {
      enable = true;
      enable32Bit = true;
      extraPackages = with pkgs; [
	intel-compute-runtime
	intel-media-driver
      ];
    };
  
    # Define a user account. Don't forget to set a password with ‘passwd’.
    users.users.${self.user} = {
      isNormalUser = true;
      extraGroups = [ "wheel" ]; # Enable ‘sudo’ for the user.
    };
  
    # Define partitions.
    fileSystems = {
      "/".options = [ "compress=zstd" ];
      "/home".options = [ "compress=zstd" ];
      "/nix".options = [ "compress=zstd" "noatime" ];
      "/swap".options = [ "noatime" ];
    };
  
    # Define swap devices.
    swapDevices = [{
      device = "/swap/swapfile";
      size = 16*1024;
    }];
  
    # Enable automatic scrubbing.
    services.btrfs.autoScrub.enable = true;
  
    system.stateVersion = "26.05";
  };
}

