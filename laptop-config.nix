{ config, ... }:
{
  zramSwap = {
    enable = true;
    algorithm = "zstd";
    memoryPercent = 70;
  };

  systemd.oomd.enable = true;
}
