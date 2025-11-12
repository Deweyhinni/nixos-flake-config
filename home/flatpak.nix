{ config, pkgs, inputs, ...}:
{
  services.flatpak = {
    enable = true;
    packages = [
      "com.github.geigi.cozy"
      "org.vinegarhq.Sober"
      "dev.geopjr.Collision"
      "com.opera.Opera"
      {
        appId = "io.github.softfever.OrcaSlicer";
        sha256 = "e11a76d29dafc02bad5e527967b2dcc11b581677747767dd0dd24e679e2ebd41";
        bundle = "${pkgs.fetchurl {
          url = "https://github.com/SoftFever/OrcaSlicer/releases/download/v2.3.0/OrcaSlicer-Linux-flatpak_V2.3.0_x86_64.flatpak";
          sha256 = "e11a76d29dafc02bad5e527967b2dcc11b581677747767dd0dd24e679e2ebd41";
        }}";
      }
    ];
  };
}
