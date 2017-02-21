#!/bin/bash

chmod -R +x scripts

docker run --rm -it \
    --name imagemagick \
    -v `pwd`/images:/tmp/images:rw \
    -v `pwd`/scripts:/tmp/scripts:rw \
    treetips/imagemagick:latest \
    /tmp/scripts/create_dummy_images.sh
