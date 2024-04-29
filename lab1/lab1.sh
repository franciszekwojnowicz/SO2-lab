#!/bin/bash

# creating variables and default names
SOURCE_DIR=${1:-lab_uno}
RM_LIST=${2:-2remove}
TARGET_DIR=${3:-bakap}

# create target folder if dont exist
if [[ ! -d "${TARGET_DIR}" ]]; then
    mkdir "${TARGET_DIR}"
    echo "Utworzono ${TARGET_DIR}"
fi

# delete by RM_LIST
ITEMS=$(cat "${SOURCE_DIR}/${RM_LIST}")
for ITEM in ${ITEMS}; do
    if [[ -d  "${SOURCE_DIR}/${ITEM}" ]]; then
        rm -rf "${SOURCE_DIR}/${ITEM}"
    fi
done

# move regular files AND copy folders
ITEMS=$(ls "${SOURCE_DIR}")
for ITEM in ${ITEMS}; do
    if [[ -f  "${SOURCE_DIR}/${ITEM}" ]]; then
        mv "${SOURCE_DIR}/${ITEM}" "${TARGET_DIR}"
    fi
    if [[ -d  "${SOURCE_DIR}/${ITEM}" ]]; then
        cp -r "${SOURCE_DIR}/${ITEM}" "${TARGET_DIR}"
    fi
done

# count survivors
ITEMS=$(ls "${SOURCE_DIR}")
COUNTER=0
for ITEM in ${ITEMS}; do
    COUNTER=$((COUNTER + 1))
done

if [[ ${COUNTER} -gt 0 ]]; then
    echo "jeszcze coś zostało"
else
    echo "tu był Kononowicz, nie będzie niczego"
fi
if [[ ${COUNTER} -ge 2 ]]; then
    echo "zostały co najmniej 2 pliki"
fi
if [[ ${COUNTER} -gt 4 ]]; then
    echo "zostało wiecej niz 4 pliki"
fi

if [[ ${COUNTER} -ge 2 ]] && [[ ${COUNTER} -le 4 ]]; then
    echo "coś piszemy"
fi

# create zip of TARGET_DIR
DATA=$(date +"%Y-%m-%d")
zip -r "bakap${DATA}.zip" "${TARGET_DIR}"