{ self, inputs, ... }:
{
  flake = {
    user = "matthew";
  };

  flake.nixosModules.base = { pkgs, ... }: {

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
      self.nixosModules.tailscale
      self.nixosModules.zsh
    ];

    environment.systemPackages = with pkgs; [
      anki
      inputs.helium.packages.${system}.default
      kdePackages.ark
      kdePackages.dolphin
      kdePackages.ffmpegthumbs
      kdePackages.koko
      kdePackages.okular
      krita
      mpv
      obsidian
      telegram-desktop
      vesktop
    ];

    home-manager.users.${self.user} = {
      xdg.mimeApps = {
        enable = true;
        defaultApplications =
          let
            documentViewer = "org.kde.okular.desktop";
            imageViewer = "org.kde.koko.desktop";
            mediaPlayer = "mpv.desktop";
          in
          {
            "application/pdf" = documentViewer;
            "audio/mpeg" = mediaPlayer;
            "audio/ogg" = mediaPlayer;
            "image/jpeg" = imageViewer;
            "image/png" = imageViewer;
            "video/mp4" = mediaPlayer;
            "video/mpeg" = mediaPlayer;
            "video/quicktime" = mediaPlayer;
            "video/webm" = mediaPlayer;
          };
      };
    };

    fonts.packages = with pkgs; [
      nerd-fonts.jetbrains-mono
    ];
  };
}
