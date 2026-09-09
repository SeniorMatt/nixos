{
  flake.nixosModules.videos = { pkgs, ... }: {
    programs.kdeconnect.enable = true;
    environment.systemPackages = with pkgs; [
      blender
      handbrake
      video-trimmer
    ];
  };
}
