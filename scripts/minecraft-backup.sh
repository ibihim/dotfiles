#!/usr/bin/env bash

TARGET_DIR=/target
TARGET_FILE=backup

SOURCE_DIR=/source
SOURCE_FILE=world

docker run \
    --rm \
    -it \
    -v minecraft-data:$SOURCE_DIR \
    -v /home/ibihim:$TARGET_DIR \
    ubuntu \
    bash -c "tar cvfz $TARGET_DIR/$TARGET_FILE.tar.gz $SOURCE_DIR/$SOURCE_FILE"

