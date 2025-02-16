#!/usr/bin/env bash
set -e

mkdir -p /imprint/out

rm -rf /tmp/zmk-out
mkdir -p /tmp/zmk-out/left
mkdir /tmp/zmk-out/right

cd /tmp/zmk-workspace
for side in left right; do
  west build -s zmk/app -d /tmp/zmk-out/${side} -b assimilator-bt -- -DZMK_CONFIG=/imprint/config -DSHIELD=imprint_${side} -DZMK_EXTRA_MODULES=/imprint
  cp /tmp/zmk-out/${side}/zephyr/zmk.uf2 /imprint/out/${side}.uf2
done
