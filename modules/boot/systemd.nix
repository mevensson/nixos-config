{ config, lib, ... }:
{
  options.modules.boot.systemd = {
    enable = lib.mkEnableOption "Enable systemd boot ";
  };

  config = lib.mkIf config.modules.boot.systemd.enable {
    boot.loader.systemd-boot = {
      enable = true;
      configurationLimit = 10;
    };
  };
}
