{
  flake.nixosModules.videos = { pkgs, ... }: {
    programs.kdeconnect.enable = true;
    environment.systemPackages = with pkgs; [
      davinci-resolve
      ffmpeg
      handbrake
      video-downloader
      video-trimmer
    ];
  };
}
