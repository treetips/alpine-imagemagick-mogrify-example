ImageMagickで並列に画像変換する
====

dockerを利用した画像変換サンプルです。

## Description

alpine linuxをベースにImageMagickをインストールしたdockerイメージを作成し、ImageMagickで並列に画像変換を行うサンプルプロジェクトです。

## Requirement

- docker v1.13.1

## Install

dockerをインストールして下さい。

https://docs.docker.com/docker-for-windows/

https://docs.docker.com/docker-for-mac/

## Usage

```bash
# macの場合はdockerのvolumeが動作するディレクトリが限られているので/tmpで作業する
cd /tmp
# cloneする
git clone https://github.com/treetips/alpine-imagemagick-mogrify-example.git
cd alpine-imagemagick-mogrify-example
# 実行権限を付与する
find . -type f -name "*.sh" | xargs chmod +x
# 画像変換を試すためのダミー画像を生成する
./prepare.sh
# 並列に画像変換する
./convert.sh
```

## Licence

[MIT](https://github.com/tcnksm/tool/blob/master/LICENCE)

## Author

[tcnksm](https://github.com/tcnksm)