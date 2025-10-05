# Android用のGlibをクロスコンパイルするプロジェクト

Android NDKを使って、glibをビルドするスクリプトをまとめたものです。

## ビルド環境

- Windows 11
- WSL Ubuntu22.04

## ビルドの準備

すでにWSL2を使用できるものとします。

Ubuntu 22.04をインストールします。コマンドラインを開いて、以下のコマンドを入力してください。
```
wsl --install -d Ubuntu-22.04
```

Ubuntu22.04を初期化したい場合は、以下を入力してください。
```
wsl --unregister Ubuntu-22.04
```

## インストール
Ubuntu上で、ビルドに必要なパッケージのインストールをします。

Ubuntuにログイン後に、コマンドを実行してください。
sudoの実行権限が必要です。

```
sudo apt update && sudo apt upgrade -y
sudo apt install make cmake autoconf automake libtool pkg-config unzip python3-pip texinfo -y
```

mesonとninjaのインストール
```
python3 -m pip install meson ninja
```

```
echo 'export PATH="$HOME/.local/bin:$PATH"' >> ~/.bashrc
source ~/.bashrc
```

## ビルド

iconvとgettextをビルド後に、glibのビルドができます。
デフォルトでは、ホームディレクトリ配下に、Android, Downloads, src, localディレクトリをを作成します。

```
./build_all.sh
```

## 環境変数

env.shに設定されている代表的な変数名

| 変数名 | 説明 |
| --- | --- |
| DOWNLOADDIR | ソースコードのダウンロード先のディレクトリ |
| SRCDIR | 解凍したソースコードの保存するディレクトリ |
| OUTDIR | コンパイル後のライブラリのディレクトリ |
| ANDROID_NDK_HOME | NDKの解凍先ディレクトリ |
| NDK_VERSION | NDKのバージョン |
| ANDROID_API | Android APIのバージョン |
| GLIB_VERSION | Glibのバージョン |
| LIBICONV_VERSION | iconvのバージョン |
| GETTEXT_VERSION | gettextのバージョン |
