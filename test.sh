#!/usr/bin/env bash

set -euo pipefail

if [ ! -e archive.zip ]; then
  curl https://github.com/NixOS/nixpkgs/archive/82155ff501c7622cb2336646bb62f7624261f6d7.zip \
    --output archive.zip \
    -L
fi

for profile in hc hm hd hy hr; do
  rm -rf output_dir unziptest.hp
  set -x
  cabal run --enable-profiling unziptest -- +RTS "-$profile"
  set +x
  hp2ps -cg unziptest.hp
  convert unziptest.ps -rotate -90 "unziptest-${profile}.png"
done
