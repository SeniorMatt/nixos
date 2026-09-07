{ self, inputs, ... }:
{
  flake = {
    user = "matthew";
  };

  flake.nixosModules.base = { pkgs, config, ... }: {

    # Enable automatic garbage collection.
    nix.gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 30d";
    };

    # Enable automatic perlodic optimisations of the nix store.
    nix.optimise.automatic = true;

    # Allow unfree packages.
    nixpkgs.config.allowUnfree = true;

    imports = [ 
      self.nixosModules.fastfetch
      self.nixosModules.home-manager
      self.nixosModules.kitty 
      self.nixosModules.niri
      self.nixosModules.obs-studio
      self.nixosModules.zsh
    ];
    
    environment.systemPackages = with pkgs; [
      inputs.helium.packages.${system}.default
      kdePackages.dolphin
      mpv
      obsidian
      telegram-desktop
      vesktop
    ];

    fonts.packages = with pkgs; [
      nerd-fonts.jetbrains-mono
    ];
  };
}
