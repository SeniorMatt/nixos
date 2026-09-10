{ self, ... }:
{
  flake.nixosModules.videos = { pkgs, ... }: {
    imports = [ self.nixosModules.blender ];
    programs.kdeconnect.enable = true;
    environment.systemPackages = with pkgs; [
      handbrake
      video-trimmer
    ];
  };
}
