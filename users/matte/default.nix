{ self, ... }:
let
  name = "Mattias Evensson";
  email = "mattias@evensson.eu";
in
{
  age.secrets.matte_password.file = "${self}/secrets/matte_password.age";
  age.secrets.matte_id_ed25519.file = "${self}/secrets/matte_id_ed25519.age";
  age.secrets.matte_id_ed25519.owner = "matte";

  home-manager.users.matte = { suites, lib, ... }: {
    imports = suites.base;

    home = {
      activation.myActivationAction =
        lib.hm.dag.entryAfter [ "writeBoundary" ] ''
          mkdir -p ~/.ssh
          ln -sf /run/agenix/matte_id_ed25519 ~/.ssh/id_ed25519
        '';

      file = {
        ".ssh/id_ed25519.pub".source = ./id_ed25519.pub;
      };
    };

    programs.git = {
      userName = name;
      userEmail = email;
    };
  };

  users.users.matte = {
    uid = 1000;
    passwordFile = "/run/agenix/matte_password";
    description = name;
    isNormalUser = true;
    extraGroups = [ "wheel" ];
  };

  users.users.matte.openssh.authorizedKeys.keyFiles = [ ./id_ed25519.pub ];
}
