#!/bin/bash
set -eu

TARGET_DIR=${1:-default}

if [[ ! -d "${TARGET_DIR}" ]]; then
    echo "Ni ma takiego folderu"
    exit 1
fi

# changing rights
ITEMS=$(ls "${TARGET_DIR}")
for ITEM in ${ITEMS}; do
    ext="${ITEM##*.}"
    if [[ -f  "${TARGET_DIR}/${ITEM}" ]]; then
        if [[ "${ext}" == "bak" ]]; then
            chmod a-w "${TARGET_DIR}/${ITEM}"
        elif [[ "${ext}" == "txt" ]]; then
            chmod 241 "${TARGET_DIR}/${ITEM}"
        fi
    elif [[ -d "${TARGET_DIR}/${ITEM}" ]]; then
        if [[ "${ext}" == "bak" ]]; then
            chmod 415 "${TARGET_DIR}/${ITEM}"
        elif [[ "${ext}" == "tmp" ]]; then
            chmod 1600 "${TARGET_DIR}/${ITEM}"
        fi
    fi
done