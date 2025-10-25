# Android用のGlibをクロスコンパイルするプロジェクト

Android NDKを使って、glibをビルドするスクリプトをまとめたものです。

## 構成

```
build_all.sh                # すべてをビルドするスクリプト
build_clean.sh              # ビルドで作成したディレクトリ/ファイルをすべて削除するスクリプト
build_common.sh             # 共通関数
build_gettext.sh            # gettextをビルドするスクリプト
build_glib.sh               # glibをビルドするスクリプト
build_libiconv.sh           # libiconvをビルドするスクリプト
build_pcre2.sh              # pcre2をビルスするスクリプト
cross_file.txt.template     # mesonのクロスコンパイル用ファイルテンプレート
env.sh                      # バージョンなどの変数管理
setup_ndk.sh                # Android用のセットアップスクリプト
```

## ビルド環境

2025/10/10でビルドが成功する確認済みの環境

- Windows 11
- WSL Ubuntu22.04(bash)

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

Ubuntuにログイン後に、コマンドを実行してください。(bashを使用しています)

```
git clone https://github.com/rmagiga/android_glib_cross_compile.git
cd android_glib_cross_compile
```

ビルド環境を構築します。
OSのパッケージのインストール、Pythonの仮想環境の構築、Android NDKのダウンロード・配置を行います。
スクリプト内部で、sudoを実行しているので、sudoに対する権限が必要です。

```
./install.sh
./setup_ndk.sh
```

## ビルド

デフォルトでは、ホームディレクトリ配下に、Android, Downloads, src, localディレクトリをを作成します。

```
./build_all.sh
```

iconvとgettextをビルド後に、glibのビルドができます。

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
| PCRE2_VERSION | pcre2のバージョン |
