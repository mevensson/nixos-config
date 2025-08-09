{ config, lib, ... }:
let
  name = "Mattias Evensson";
  #email = "mattias@evensson.eu";
in
{
  options.users.matte = {
    enable = lib.mkEnableOption "Enable matte user";
  };

  config = lib.mkIf config.modules.boot.systemd.enable {
    users.users.matte = {
      uid = 1000;
      #hashedPasswordFile = config.age.secrets.matte_password.path;
      description = name;
      isNormalUser = true;
      extraGroups = [ "wheel" ];
      #shell = pkgs.fish;
      #openssh.authorizedKeys.keyFiles = [ ./id_ed25519.pub ];
    };
  };
}
