{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    vscode
    rnix-lsp
  ];

  nixpkgs.config.allowUnfree = true;
}
