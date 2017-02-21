#!/bin/sh

# OpenMPのマルチスレッド時の負荷対策
export OMP_NUM_THREADS=1
export MAGICK_THREAD_LIMIT=1

# ディレクトリ一覧を出力
time find /tmp/images -type d > /tmp/jpg.txt
cp -f /tmp/jpg.txt /tmp/png.txt

# jpgをmogrifyで一括処理できるように加工
sed -i "s/$/\/\*.jpg/g" /tmp/jpg.txt
# 並列で変換
time parallel -a /tmp/jpg.txt mogrify -strip -quality 60

# pngをmogrifyで一括処理できるように加工
sed -i "s/$/\/\*.png/g" /tmp/png.txt
# 並列で変換
time parallel -a /tmp/png.txt mogrify -strip -quality 44 -colors 256

# 掃除
rm -rf /tmp/jpg.txt
rm -rf /tmp/png.txt