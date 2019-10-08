#!/bin/bash
cd ~

#dotfiles
# git clone https://scalarwaves@bitbucket.org/scalarwaves/dotfiles.git

#directories
echo 'Removing unnecessary $HOME folders:'
rm -rfv Documents Music Pictures Public Templates Videos
echo 'Linking synced folders to $HOME:'
cd ~ && ln -sv ~/dotfiles/bin

#system
echo 'Installing essential packages:'
#time yaourt -S aria2 curl zsh git automake autoconf readline ncurses libyaml libxslt libffi \
#libtool unixodbc parallel ca-certificates aic94xx-firmware wd719x-firmware

#setup zim
git clone --recursive https://github.com/zimfw/zimfw.git ${ZDOTDIR:-${HOME}}/.zim

#version managers
echo 'Installing version managers:'
git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.4.3   #one vm to rule them all!
. $HOME/.asdf/asdf.sh
. $HOME/.asdf/completions/asdf.bash
curl -sL ellipsis.sh|bash
rm -rf tmp*
source .ellipsis/init.sh
ellipsis install ellipsis-tpm

#fonts
echo 'Installing fonts:'
cd ~ && time git clone https://github.com/powerline/fonts.git && time git clone https://github.com/ryanoasis/nerd-fonts.git && bash fonts/install.sh && bash nerd-fonts/install.sh && cd ~
rm -rfv fonts nerd-fonts
fc-cache -fv
sudo fc-cache -fv

#demonsaw
#echo 'Installing demonsaw:'
#mkdir -p ~/apps/demonsaw
#cd ~/apps/demonsaw && wget https://www.demonsaw.com/download/demonsaw_nix_64.tar.gz && tar zxfv demonsaw_nix_64.tar.gz && cd ~

#shell
echo 'Setting up development environment:'
asdf plugin-add clojure https://github.com/vic/asdf-clojure; asdf plugin-add crystal https://github.com/marciogm/asdf-crystal.git; asdf plugin-add dmd https://github.com/sylph01/asdf-dmd; asdf plugin-add elm https://github.com/vic/asdf-elm.git; asdf plugin-add golang https://github.com/kennyp/asdf-golang.git; asdf plugin-add haskell https://github.com/vic/asdf-haskell; asdf plugin-add julia https://github.com/rkyleg/asdf-julia; asdf plugin-add lua https://github.com/Stratus3D/asdf-lua; asdf plugin-add luajit https://github.com/smashedtoatoms/asdf-luaJIT; asdf plugin-add php https://github.com/odarriba/asdf-php; asdf plugin-add python https://github.com/tuvistavie/asdf-python.git; asdf plugin-add R https://github.com/nverno/asdf-R.git; asdf plugin-add ruby https://github.com/asdf-vm/asdf-ruby.git; asdf plugin-add rust https://github.com/code-lever/asdf-rust.git | parallel
bash ~/.asdf/plugins/nodejs/bin/import-release-team-keyring
curl -sSf https://files.zerogw.com/vagga/vagga-install.sh | sh
#echo 'Installing ruby, please wait...' && asdf install ruby $(asdf list-all ruby|tail -n 1) > /dev/null  && echo 'done.'
#echo 'Installing golang, please wait...' && asdf install golang 1.11 && echo 'done.'
#echo 'Installing rust, please wait...' && asdf install rust nightly && sudo ldconfig && echo 'done.'
#echo 'Installing pyenv, please wait...' && curl -L https://raw.githubusercontent.com/pyenv/pyenv-installer/master/bin/pyenv-installer | bash && pyenv install -l|grep -e '^ *[0-9]*\.[0-9]*\.[0-9]*$'|grep -e '^ *2\.[0-9]*\.[0-9]*$'|tail -n 1 && pyenv install -l|grep -e '^ *[0-9]*\.[0-9]*\.[0-9]*$'|grep -e '^ *3\.[0-9]*\.[0-9]*$'|tail -n 1 && echo 'done.'
#echo 'Installing nvm, please wait...' && curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.11/install.sh | bash
#export NVM_DIR="$HOME/.nvm"
#[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"
#echo 'Installing nodejs, please wait...' && asdf install node $(asdf list-all node|tail -n 1) && echo 'done.'
echo "Installing nvs:"
export NVS_HOME="$HOME/.nvs"
git clone https://github.com/jasongin/nvs "$NVS_HOME"
. "$NVS_HOME/nvs.sh" install
nvs add lts
#nvm install $(nvm ls-remote|tail -n 1) && echo 'done.'
#npm install --global strip-ansi-cli
#asdf global node $(asdf list-all node|tail -n 1)
#asdf global ruby $(asdf list-all ruby|tail -n 1)
#asdf global golang 1.11
#asdf global rust nightly
#pyenv global $(pyenv install -l|grep -e '^ *[0-9]*\.[0-9]*\.[0-9]*$'|grep -e '^ *2\.[0-9]*\.[0-9]*$'|tail -n 1)
#nvm use $(nvm ls-remote|tail -n 1|sed -e 's/-> *//'|strip-ansi)
cd dotfiles && cp -v .aliases .bash* .dir_colors .extend.* .gitconfig .leximaven.noon .iloa.noon .toloko.noon package.json .plugins.zsh .powerlevel .profile .tm* .z* .x .X ~
wget https://github.com/zyedidia/micro/releases/download/v1.4.1/micro-1.4.1-linux64.tar.gz && tar xzfv micro-1.4.1-linux64.tar.gz && cd micro-1.4.1 && sudo cp micro /usr/bin/ && cd ~
echo 'Please confirm changing the default shell'
chsh -s /bin/zsh
echo 'Updating mlocate database:'
sudo time updatedb
echo 'Finished all operations, please reload the shell.'
