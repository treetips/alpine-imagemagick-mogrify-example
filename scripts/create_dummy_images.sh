#!/bin/sh

cd /tmp/images
rm -rf ./dir*

# 作成する画像枚数
NUMBER=2
# alpineのフォントパス
FONT_PATH="/usr/share/ghostscript/9.20/Resource/CIDFSubst/DroidSansFallback.ttf"

# pngとjpgの画像をディレクトリ階層を作りながら動的に生成
for ext in 'png' 'jpg'; do
	for i in `seq 1 1 $NUMBER`; do
		mkdir -p dir$i
		convert -font "$FONT_PATH" -pointsize 200 -gravity center -annotate 0 "$ext-$i" -fill yellow base.jpg dir$i/dummy-$i.$ext
		for j in `seq 1 1 $NUMBER`; do
			mkdir -p dir$i/dir$j
			convert -font "$FONT_PATH" -pointsize 200 -gravity center -annotate 0 "$ext-$i-$j" -fill yellow base.jpg dir$i/dir$j/dummy-$i.$ext
			for k in `seq 1 1 $NUMBER`; do
				mkdir -p dir$i/dir$j/dir$k
				convert -font "$FONT_PATH" -pointsize 200 -gravity center -annotate 0 "$ext-$i-$j-$k" -fill yellow base.jpg dir$i/dir$j/dir$k/dummy-$i.$ext
			done
		done
	done
done
