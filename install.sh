#!/usr/bin/env bash


# install useful software
sudo pacman -S github-cli terminator docker docker-compose docker-buildx nitrogen eog ristretto vlc firefox zsh \
               unzip unrar p7zip cmake make bzip2 btop blender gimp telegram-desktop discord wine wget curl obsidian \
               kdeconnect

# install programming languages
sudo pacman -S python python-pip nodejs npm pnpm yarn ghc lua dune ruby ts-node zig jre-openjdk dotnet-sdk go php \
               gcc clang llvm ansible terraform prometheus

# install databases
sudo pacman -S postgresql redis

# install IDE and other stuff
sudo pacman -S neovim arduino ffmpeg
git clone https://github.com/NvChad/NvChad "${HOME}/.config/nvim" --depth 1


JETBRAINS="$HOME"/.local/share/jetbrains

mkdir -p "${JETBRAINS}"

CLION="CLion-2023.2.tar.gz"
wget "https://download.jetbrains.com/cpp/${CLION}?_gl=1*3pm3em*_ga*OTYzNDgxMDg1LjE2OTMzMzc4Njc.*_ga_9J976DJZ68*MTY5Mzc0ODgxOS45LjEuMTY5Mzc0ODgyMi4wLjAuMA..&_ga=2.216934806.1844104825.1693667438-963481085.1693337867" -O "${JETBRAINS}/${CLION}"
tar -xzf "${JETBRAINS}"/${CLION}
sudo ln -s "${JETBRAINS}"/${CLION}/bin/clion.sh /usr/local/bin/clion

#PYCHARM="pycharm-professional-2023.2.tar.gz"
#wget "https://download.jetbrains.com/python/${PYCHARM}?_gl=1*1vaa4n5*_ga*OTYzNDgxMDg1LjE2OTMzMzc4Njc.*_ga_9J976DJZ68*MTY5Mzc0ODgxOS45LjEuMTY5Mzc0OTY0MS4wLjAuMA..&_ga=2.24954554.1844104825.1693667438-963481085.1693337867" -O "${JETBRAINS}/${PYCHARM}"
#tar -xzf "${JETBRAINS}"/${PYCHARM}
#sudo ln -s "${JETBRAINS}"/pycharm-2023.2/bin/pycharm.sh /usr/local/bin/pycharm


curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs > rustup.sh
chmod +x rustup.sh
./rustup.sh -y
source "${HOME}/.cargo/env"
cargo install evcxr bat sqlx-cli just expand cargo-wasi fcp rg nu

curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh > ohmyzsh.sh
chmod +x ohmyzsh.sh
./ohmyzsh.sh -y
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git "${ZSH_CUSTOM}/plugins/zsh-syntax-highlighting"
git clone https://github.com/zsh-users/zsh-autosuggestions.git "${ZSH_CUSTOM}/plugins/zsh-autosuggestions"
mv ./.zshrc "${HOME}"/.zshrc

dotnet tool install -g csharprepl


# docker

sudo usermod -aG docker "${USER}"
sudo systemctl enable --now docker.service
sudo docker pull bitnami/redis
sudo docker pull manjarolinux/base
sudo docker pull rabbitmq
sudo docker pull rust
sudo docker pull python
sudo docker pull mariadb
sudo docker pull mongo
sudo docker pull public.ecr.aws/lambda/python
sudo docker pull public.ecr.aws/lambda/python
sudo docker pull redis
sudo docker pull node
sudo docker pull golang
sudo docker pull memcached
sudo docker pull nginx
sudo docker pull httpd
sudo docker pull mcr.microsoft.com/dotnet/sdk
sudo docker pull mcr.microsoft.com/dotnet/runtime
sudo docker pull postgres
sudo docker pull debian
sudo docker pull debian
sudo docker pull cassandra
sudo docker pull mysql
sudo docker pull elasticsearch
sudo docker pull alpine
sudo docker pull ubuntu
sudo docker pull ubuntu
sudo docker pull busybox
sudo docker pull busybox
sudo docker pull hello-world
sudo docker pull openjdk
sudo docker pull bcbcarl/hollywood


# yay
YAY="${HOME}"/.local/share/yay
mkdir -p "${YAY}"
git clone https://aur.archlinux.org/yay.git "${YAY}"
makepkg -c -si -p "${YAY}"/PKGBUILD

# projects
gh auth login

mkdir "${HOME}/github"
mkdir "${HOME}/personal/projects" -p
gh repo clone TheGodfatherru/astro_project "${HOME}/personal/projects/astro_project"
gh repo clone TheGodfatherru/PrettyFox "${HOME}/personal/projects/PrettyFox"
gh repo clone TheGodfatherru/PrettyFox_rust "${HOME}/personal/projects/PrettyFox_rust"

mkdir "${HOME}/personal/projects/chef" -p
gh repo clone TheGodfatherru/Chef "${HOME}/personal/projects/chef/Chef"
gh repo clone TheGodfatherru/ChefApi_payment_db "${HOME}/personal/projects/chef/ChefApi_payment_db"
gh repo clone TheGodfatherru/ChefApi_operations "${HOME}/personal/projects/chef/ChefApi_operations"
gh repo clone TheGodfatherru/ChefApi_operations_utils "${HOME}/personal/projects/chef/ChefApi_operations_utils"

mkdir "${HOME}/personal/AlgoCode" -p
gh repo clone TheGodfatherru/AlgoCode-2023 "${HOME}/personal/projects/AlgoCode-2023"

mkdir "${HOME}/personal/learn_pl" -p
gh repo clone TheGodfatherru/learn_pl "${HOME}/personal/learn_pl"