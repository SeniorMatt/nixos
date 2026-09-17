{ self, ... }:
{
  flake.nixosModules.videos = { pkgs, ... }: {
    imports = [ self.nixosModules.davinci-resolve ];
    programs.kdeconnect.enable = true;
    environment.systemPackages = with pkgs; [
      ffmpeg
      handbrake
      video-downloader
      video-trimmer
    ];
  };
}
