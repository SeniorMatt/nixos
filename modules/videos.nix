{ self, ... }:
{
  flake.nixosModules.videos = { pkgs, ... }: {
    imports = [ self.nixosModules.davinci-resolve ];
    programs.kdeconnect.enable = true;
    environment.systemPackages = with pkgs; [
      ffmpeg
      footage
      handbrake
      video-downloader
      video-trimmer
    ];
  };
}
