#!/bin/bash
set -eu

echo "Tu posortowane bledy -------------------->"
./fakaping.sh   2>&1 >/dev/null | sort

echo "Tu unikalne linijki --------------------->"
./fakaping.sh 2>&1 | sort | uniq > all.log
cat all.log
