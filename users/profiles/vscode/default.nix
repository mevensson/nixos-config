{pkgs, ...}: {
  programs.vscode = {
    enable = true;
    extensions = with pkgs.vscode-extensions; [
      eamodio.gitlens
      editorconfig.editorconfig
      github.github-vscode-theme
      github.vscode-pull-request-github
      jnoortheen.nix-ide
      llvm-vs-code-extensions.vscode-clangd
      #ms-python.python
      ms-python.vscode-pylance
      ms-vscode.cmake-tools
      ms-vscode.cpptools
    ];
    userSettings = {
      "editor.fontFamily" = "'FiraCode Nerd Font','Droid Sans Mono', 'monospace', monospace";
      "editor.fontLigatures" = true;
      "edior.formatOnSave" = true;
      "editor.renderFinalNewline" = false;
      "editor.rulers" = [80];
      "editor.wordWrap" = "on";
      "files.insertFinalNewline" = true;
      "files.trimFinalNewlines" = true;
      "files.trimTrailingWhitespace" = true;
      "nix.enableLanguageServer" = true;
      "window.titleBarStyle" = "custom";
      "workbench.colorTheme" = "GitHub Dark Default";
    };
  };
}
