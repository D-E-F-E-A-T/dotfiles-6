# Change default zim location
export ZIM_HOME=${ZDOTDIR:-${HOME}}/.zim
# Start zim - super fast zsh framework
[[ -s ${ZIM_HOME}/init.zsh ]] && source ${ZIM_HOME}/init.zsh
export PATH="$HOME/.pyenv/bin:$HOME/df/bin:/opt/openresty/bin:$HOME/.opam/default/bin:$PATH"
export PATH="$HOME/.asdf/installs/rust/nightly/bin:$HOME/.wasmer/bin:$HOME/apps/textadept:$PATH"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"
setopt EXTENDED_GLOB
#export POWERLEVEL9K_INSTALLATION_PATH=~/.zim/modules/prompt/external-themes/powerlevel9k/powerlevel9k.zsh-theme
autoload -Uz compinit promptinit
compinit
# read powerlevel9k configuration
#source $HOME/.powerlevel
promptinit
#prompt powerlevel9k
# version managers & utilities
#[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
haste() { a=$(cat); curl -X POST -s -d "$a" https://hastebin.com/documents | awk -F '"' '{print "https://hastebin.com/"$4}'; }
#source $HOME/.asdf/installs/bazel/0.13.0/lib/bazel/bin/bazel-complete.bash #Bazel Version
source $HOME/.ellipsis/init.sh
fpath=($HOME/.ellipsis/comp $fpath)
export LLVMENV_RUST_BINDING=1
source <(llvmenv zsh)
. $HOME/.asdf/asdf.sh
. $HOME/.asdf/completions/asdf.bash
#pyenv global $(pyenv install -l|grep -e '^ *[0-9]*\.[0-9]*\.[0-9]*$'|grep -e '^ *2\.[0-9]*\.[0-9]*$'|tail -n 1)
#pyenv global $(pyenv install -l|grep -e '^ *[0-9]*\.[0-9]*\.[0-9]*$'|grep -e '^ *3\.[0-9]*\.[0-9]*$'|tail -n 1)
# by defaut pyenv uses the system python & python2 executables
pyenv global system > /dev/null
# asdf development environment init
# asdf global clojure 1.10.0 > /dev/null
asdf global cmake 3.15.2 > /dev/null
# asdf global consul 1.5.1 > /dev/null
#asdf global coq 8.7.2 > /dev/null
# asdf global crystal 0.29.0 > /dev/null
# asdf global dart 2.3.2 > /dev/null
#asdf global dep 0.5.3 > /dev/null
# asdf global desk 0.1.0 > /dev/null
# asdf global dmd 2.086.0 > /dev/null
# asdf global docker-slim 1.24 > /dev/null
# asdf global elasticsearch 6.7.2 > /dev/null
# asdf global elixir 1.9.0-rc.0 > /dev/null
# asdf global elm 0.19.0 > /dev/null
# asdf global erlang 22.0.3 > /dev/null
#asdf global gohugo 0.55.6 > /dev/null
#asdf global golang 1.12.6 > /dev/null
asdf global graalvm 1.0.0-rc16 > /dev/null
#asdf global haskell 8.6.5 > /dev/null
#asdf global imagemagick 7.0.8-49 > /dev/null
#asdf global java openjdk-11.0.1 > /dev/null
# asdf global jsonnet 0.13.0 > /dev/null
# asdf global julia 1.2.0-rc1 > /dev/null
# asdf global kotlin 1.3.40-eap-105 > /dev/null
# asdf global logtalk 3.26.0 > /dev/null
#asdf global lua 5.3.5 > /dev/null
#asdf global luajit 2.0.5--2.4.4 > /dev/null
# asdf global mill 0.4.1 > /dev/null
#asdf global mongodb 4.1.6 > /dev/null
# asdf global nim v0.20.0 > /dev/null
# asdf global nomad 0.9.3 > /dev/null
#asdf global ocaml 4.07.1 > /dev/null
# asdf global packer 1.4.1 > /dev/null
#asdf global php 7.3.6 > /dev/null
# asdf global proto 3.8.0 > /dev/null
# asdf global R 3.6.0 > /dev/null
# asdf global racket 7.3 > /dev/null
# asdf global rebar 3.8.0 > /dev/null
#asdf global redis 5.0.5 > /dev/null
asdf global ruby truffleruby-1.0.0-rc16 > /dev/null
asdf global rust nightly > /dev/null
# asdf global scala 2.12.8 > /dev/null
# asdf global serf 0.8.2 > /dev/null
# asdf global spark 2.4.0 > /dev/null
# asdf global sqlite 3.27.1 > /dev/null
# asdf global swiprolog 7.6.4 > /dev/null
# asdf global terraform 0.11.12-beta1 > /dev/null
# asdf global vault 1.1.0-beta1 > /dev/null
# use system llvm (has rtti)
llvmenv global system > /dev/null
# use source-compiled llvm (does NOT have rtti)
# llvmenv global llvm-mirror > /dev/null
# all nodejs stuff handled by nvs
export NVS_HOME="$HOME/.nvs"
[ -s "$NVS_HOME/nvs.sh" ] && . "$NVS_HOME/nvs.sh"
nvs use lts > /dev/null
# Andrew's note: This block is used by me for leximaven, iloa, and toloko to find their theme files
export NP=$(which node)
export BP=${NP%bin/node}
export LP="${BP}lib/node_modules"
# leximaven,iloa,toloko theme dir fallback
export NODE_PATH="$LP"
alias todo=todo.sh
complete -F _todo todo
# sources command aliases
source $HOME/.aliases
# sources global environment variables
source $HOME/.zshenv
#unalias yo    #sometimes needed for yeoman generators
export EMULATOR="$COLORTERM"
if [[ $TILIX_ID ]]; then
        source /etc/profile.d/vte.sh
fi
# custom script to turn pc speaker beeps OFF for god's sake
beepoff
export RUST_LOG=4
export RUST_BACKTRACE=full
export LC_CTYPE=en_US.UTF-8
export VISUAL=nvim
# ArchLinux command suggestions
source /usr/share/doc/find-the-command/ftc.zsh noprompt quiet
export PATH=$HOME/.local/bin:$PATH
# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"
export DYLD_LIBRARY_PATH="`rustc --print sysroot`/lib:/usr/local/lib"
# perl was my first real love affair with programming languages. it's awesome for text manipulation
#PATH="$HOME/perl5/bin${PATH:+:${PATH}}"; export PATH;
#PERL5LIB="/usr/share/perl5/lib/perl5${PERL5LIB:+:${PERL5LIB}}"; export PERL5LIB;
#PERL_LOCAL_LIB_ROOT="$HOME/perl5${PERL_LOCAL_LIB_ROOT:+:${PERL_LOCAL_LIB_ROOT}}"; export PERL_LOCAL_LIB_ROOT;
#PERL_MB_OPT="--install_base \"$HOME/perl5\""; export PERL_MB_OPT;
#PERL_MM_OPT="INSTALL_BASE=$HOME/perl5"; export PERL_MM_OPT;
# tabtab source for electron-forge package
# uninstall by removing these lines or running `tabtab uninstall electron-forge`
[[ -f $HOME/apps/xi-electron/node_modules/tabtab/.completions/electron-forge.zsh ]] && . $HOME/apps/xi-electron/node_modules/tabtab/.completions/electron-forge.zsh
# Wasmer
export WASMER_DIR="$HOME/.wasmer"
[ -s "$WASMER_DIR/wasmer.sh" ] && source "$WASMER_DIR/wasmer.sh"  # This loads wasmer
# opam configuration
test -r $HOME/.opam/opam-init/init.zsh && . $HOME/.opam/opam-init/init.zsh > /dev/null 2> /dev/null || true
#final statement
clear
eval "$(starship init zsh)"
#be fancy
neofetch