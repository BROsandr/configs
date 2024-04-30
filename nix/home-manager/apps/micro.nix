{
  programs.micro = {
    enable = true;
  };

  home.file.".config/micro/bindings.json".source = ./micro/keybindings.json;

  home.sessionVariables.EDITOR = "/home/alex/.nix-profile/bin/micro";
}
