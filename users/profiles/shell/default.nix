{
  programs.readline = {
    enable = true;
    bindings = {
      "\\C-n" = "history-search-forward";
      "\\C-p" = "history-search-backward";
    };
  };
}
