#!/bin/bash
set -eu

TARGET_DIR=${1:-groovies}

if [[ ! -d "${TARGET_DIR}" ]]; then
    echo "Ni ma takiego folderu"
    exit 1
fi


ITEMS=$(ls "${TARGET_DIR}")
for ITEM in ${ITEMS}; do
    if [[ -f  "${TARGET_DIR}/${ITEM}" ]]; then
        #remove Help docks:
        sed -i '/Help docs:/d' "${TARGET_DIR}/${ITEM}"
        #replace $HEADER$
        sed -i 's/\$HEADER\$/temat/g' "${TARGET_DIR}/${ITEM}"
    fi
done