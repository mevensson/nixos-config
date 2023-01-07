{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    glxinfo
    steam
  ];

  hardware.opengl.driSupport32Bit = true;
  hardware.pulseaudio.support32Bit = true;

  nixpkgs.config.allowUnfree = true;
}
