#!/bin/bash

FIRST_DIR=${1:-dir1}
SECOND_DIR=${2:-dir2}

if [[ ! -d "${FIRST_DIR}" ]]; then
    echo "Ni ma takiego folderu ${FIRST_DIR}"
    exit 1
fi
if [[ ! -d "${SECOND_DIR}" ]]; then
    echo "Ni ma takiego folderu ${SECOND_DIR}"
    exit 1
fi


ITEMS=$(ls "${FIRST_DIR}")
for ITEM in ${ITEMS}; do
    ext="${ITEM##*.}"
    if [[ -f  "${FIRST_DIR}/${ITEM}" ]]; then
        echo "${ITEM} to jest plik regularny"
    elif [[ -d "${FIRST_DIR}/${ITEM}" ]]; then
        echo "${ITEM} to jest katalog"
    elif [[ -s "${FIRST_DIR}/${ITEM}" ]]; then
        echo "${ITEM} to jest dowiazanie symboliczne"
    fi
done