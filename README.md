# WSL初期化
wsl --unregister Ubuntu-22.04
wsl --install -d Ubuntu-22.04

# インストール
sudo apt update && sudo apt upgrade -y
sudo apt install make cmake autoconf automake libtool pkg-config meson ninja-build unzip -y

# ビルド
./build_all.sh

