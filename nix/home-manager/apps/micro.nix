{
  programs.micro = {
    enable = true;
  };

  home.file.".config/micro/bindings.json".source = ./micro/keybindings.json;
}
