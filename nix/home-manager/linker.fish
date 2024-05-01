#!/usr/bin/env nix-shell
#! nix-shell -i fish
#! nix-shell -p fish coreutils
#! nix-shell -I nixpkgs=https://github.com/NixOS/nixpkgs/archive/bcd44e224fd68ce7d269b4f44d24c2220fd821e7.tar.gz

if not set -q HM_DIR
  set -g HM_DIR "$HOME/.config/home-manager"
end

set this_dir (dirname (realpath (status --current-filename)))

function get_hm_PATH
  echo (realpath --relative-to="$this_dir" "$argv[1]")
end

function mkdirs
  for el_PATH in $this_dir/**/*
    if test -d $el_PATH
      mkdir -p (get_hm_PATH "$el_PATH")
    end
  end
end

set total_linked 0

function link_files
  for el_PATH in $this_dir/**/*
    if begin; not test -d $el_PATH; end && begin; test $el_PATH != (status --current-filename); end
      ln -f "$el_PATH" "$(get_hm_PATH $el_PATH)"
      set total_linked (math $total_linked + 1)
    end
  end
end

cd $HM_DIR && mkdirs && link_files

echo "total linked files = $total_linked"
