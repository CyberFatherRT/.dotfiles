#!/usr/bin/env bash


# install useful software
sudo pacman -S github-cli terminator docker docker-compose docker-buildx nitrogen eog ristretto vlc firefox zsh \
               unzip unrar p7zip cmake make bzip2 btop blender gimp telegram-desktop discord wine wget curl obsidian \
               kdeconnect steam parallel postman

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

PYCHARM="pycharm-professional-2023.2.tar.gz"
wget "https://download.jetbrains.com/python/${PYCHARM}?_gl=1*1vaa4n5*_ga*OTYzNDgxMDg1LjE2OTMzMzc4Njc.*_ga_9J976DJZ68*MTY5Mzc0ODgxOS45LjEuMTY5Mzc0OTY0MS4wLjAuMA..&_ga=2.24954554.1844104825.1693667438-963481085.1693337867" -O "${JETBRAINS}/${PYCHARM}"
tar -xzf "${JETBRAINS}"/${PYCHARM}
sudo ln -s "${JETBRAINS}"/pycharm-2023.2/bin/pycharm.sh /usr/local/bin/pycharm


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
pip install ipython --break-system-packages

# docker

sudo usermod -aG docker "${USER}"
sudo systemctl enable --now docker.service
sudo docker pull bitnami/redis:7.0
sudo docker pull chef_api_ciphers:latest
sudo docker pull chef_api_crypto:latest
sudo docker pull chef_api_hashing:latest
sudo docker pull chef_api_default:latest
sudo docker pull manjarolinux/base:latest
sudo docker pull rabbitmq:latest
sudo docker pull rust:latest
sudo docker pull python:latest
sudo docker pull mariadb:latest
sudo docker pull mongo:latest
sudo docker pull public.ecr.aws/lambda/python:3.8
sudo docker pull public.ecr.aws/lambda/python:latest
sudo docker pull redis:latest
sudo docker pull node:latest
sudo docker pull golang:latest
sudo docker pull memcached:latest
sudo docker pull nginx:latest
sudo docker pull httpd:latest
sudo docker pull mcr.microsoft.com/dotnet/sdk:7.0
sudo docker pull mcr.microsoft.com/dotnet/runtime:7.0
sudo docker pull postgres:latest
sudo docker pull debian:buster-slim
sudo docker pull debian:latest
sudo docker pull cassandra:latest
sudo docker pull mysql:latest
sudo docker pull elasticsearch:8.9.1
sudo docker pull alpine:latest
sudo docker pull ubuntu:jammy
sudo docker pull ubuntu:latest
sudo docker pull busybox:1.36.1-musl
sudo docker pull busybox:1.36.1-glibc
sudo docker pull hello-world:latest
sudo docker pull openjdk:latest
sudo docker pull bcbcarl/hollywood:latest



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

# InfoSec
sudo pacman -S nmap openvpn john hashcat wireshark-qt
yay -S seclists
pip install pycryptodome --breake-system-packages

sudo chown "${USER}:${USER}" /opt
mkdir /opt/wordlists
mv /usr/share/seclists/* /opt/wordlists/
wget "https://objects.githubusercontent.com/github-production-release-asset-2e65be/97553311/d4f580f8-6b49-11e7-8f70-7f460f85ab3a?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=AKIAIWNJYAX4CSVEH53A%2F20230903%2Fus-east-1%2Fs3%2Faws4_request&X-Amz-Date=20230903T152014Z&X-Amz-Expires=300&X-Amz-Signature=9c375471f9757fafa5b8379d8bcec382281813b03bf0f4b8097c21faddd2af1c&X-Amz-SignedHeaders=host&actor_id=93487218&key_id=0&repo_id=97553311&response-content-disposition=attachment%3B%20filename%3Drockyou.txt&response-content-type=application%2Foctet-stream /opt/wordlists/rockyou.txt"

# snap
SNAP="${HOME}/.local/share/snap"
git clone https://aur.archlinux.org/snapd.git "${SNAP}"
makepkg -si -c -p "${SNAP}/PKGBUILD"
sudo systemctl enable --now snapd.socket
sudo ln -s /var/lib/snapd/snap /snap

sudo snap install spotify