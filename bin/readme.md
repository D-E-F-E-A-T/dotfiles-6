# bin

I've removed binary files from this folder to decrease repo size, but they actually exist in my private repo and locally.

- achuck - **binary** - ChucK for ALSA
- alacritty - **binary** - fastest terminal emulator in existence - GPU accelerated
- bonsai - **binary** - draws bonsai trees in the terminal
- colorcount - *shell script* - returns the number of colors the terminal supports
- copykey - *shell script* - copies id_rsa.pub gpgkey to clipboard.
- devenv - *shell script* - tools mostly installed w/ asdf. prints versions for:
    asdf, clojure, cmake, consul, crystal, desk, dmd, docker-slim, elixir, elm, golang, gradle, ghc,
    hugo, imagemagick, java, julia, kotlin, lua, luajit, maven, mill, mongodb, node.js, nomad, ocaml, packer, perl5, pyenv, python2, python3, R, racket, rebar, redis, ruby, and serf.
- docker-redox - *shell script* - builds and boots redox
- dotfiles - specific commands
  - dfbackup - *shell script* - sanitizes and copies them to ~/df
  - dfinstall - *shell script* - overwrites local files by copying from dotfiles
  - dfpush - *shell script* - calls dbackup and pushes everything to remote
  - dfpop - *shell script* - pulls remote and calls dfinstall
- downcase - *shell script* - downcases whatever filenames you pass to it
- fonttable - *shell script* - dumps utf-8 font table to the terminal
- gen-cmake - *python script* - generates cmake files for new projects
- genie - **binary** - works best with premake
- getllvm - *shell script* - download and build LLVM from SVN repo
- gov - *shell script* -set cpu governor for performance to improve realtime audio
- haste - *shell script* - pipe text in and get a hastebin URL
- i3x - *shell script* - i3wm exiter
- jchuck - **binary** - ChucK for JACK
- keepalive - *shell script* - pings Google DNS servers repeatedly to keep the connection open
- keys - *shell script* - on debian-based systems it fetches all missing gpg keys for repos, PPAs, etc.
- mktrans - *shell script* - convert images into transparent pngs by floodfilling the background with alpha channel
- ngrok - *shell script* - tunnel local ports to public URLs and inspect traffic
- onefetch - **binary** - like screengrab/neofetch for git repos
- pacping - *shell script* - an ArchLinux repo mirror ranking tool
- pchuck - **binary** - ChucK for PulseAudio
- pmake - *shell script* - prettify make output
- rstools - *shell script* - prints versions on all installed rust cli apps
- rustenv - *shell script* - prints versions of all rust core tools
- setup-arch/setup-debian - *shell scripts* - setup the dev environment the way I like it. your #@*&! may differ!!!
- sibs - **binary** - cargo-like build system for C/C++/Zig projects
- shfmt - **binary** - lints and formats shell scripts
- syncthing - **binary** - file synchronization program
- terminal_dimensions - **binary** - outputs terminal dimensions in cells x y and pixels x y
- tor-strong - *shell script* - sets up TOR, privoxy, polipo, and proxychains on debian
- unlockpm - *shell script* - remove lock on pacman DB if it gets stuck
- wordlistctl - *shell script* - manage wordlists
- yosild - *shell script* - YOurSImpleLinuxDistro
