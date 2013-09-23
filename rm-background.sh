#!/bin/bash

set -ex
convert $1 $2 \
  \( -clone 0 -clone 1 -compose difference -composite -threshold 0 \) \
  -delete 1 -alpha off -compose copy_opacity -composite $3
