{ pkgs, ... }:
{
  programs.fish = rec {
    enable = true;
    plugins = [
      # oh-my-fish plugins are stored in their own repositories, which
      # makes them simple to import into home-manager.
      {
        name = "powerline-theme";
        src = pkgs.fetchFromGitHub {
          owner = "oh-my-fish";
          repo = "theme-bobthefish";
          rev = "0c15ff1cbc4bfa026c882e01dd5ceec327f26033";
          hash = "sha256-qSVx0JpXwz28D1YUtc3ujZ16rt+dLbbQ70/2J2wU5bs=";
        };
      }
      # Superseded by "powerline-theme"
      # {
      #   name = "timer";
      #   src = pkgs.fetchFromGitHub {
      #     owner = "jichu4n";
      #     repo = "fish-command-timer";
      #     rev = "ba68bd0a1d06ea99aadefe5a4f32ff512783d432";
      #     hash = "sha256-Ip677gZlcO8L/xukD7Qoa+C+EcI2kGd+BSOi2CDOzM4=";
      #   };
      # }
    ];
    shellInitLast = ''
      set fish_command_timer_time_format '%b %d %H:%M'
      set -g fish_prompt_pwd_dir_length 0
      set -g theme_date_format +'%b %d %H:%M'
    '';

    shellAliases.nix-shell = "nix-shell --run fish";
    shellAliases.drun = "docker run -it --network=host --device=/dev/kfd --device=/dev/dri --group-add=video --ipc=host --cap-add=SYS_PTRACE --security-opt seccomp=unconfined --shm-size 8G -v $HOME/dockerx:/dockerx -w /dockerx";
    shellAbbrs.suspend = "systemctl suspend";
  };
}
