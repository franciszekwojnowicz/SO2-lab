#!/bin/bash

SOURCEDIR=${1:-lab_uno}
RM_LIST=${2:-2remove}
TARGET_DIR=${3:-bakap}

if [[ ! -d "${DIR}" ]]; then
    mkdir "${DIR}"
    echo "Utworzono ${DIR}"
fi

ITEMS=$(cat ${RM_LIST})
for ITEM in ${ITEMS}; do
    echo "Pracuje nad: ${ITEM}"
    if [[ -f  "${SOURCE_DIR}/${ITEM}" ]]; then
        rm "${SOURCE_DIR}/${ITEM}"
    fi
done

ITEMS=$(ls ${SOURCE_DIR})
for ITEM in ${ITEMS}; do
    echo "Pracuje nad: ${ITEM}"
    if [[ -f  "${SOURCE_DIR}/${ITEM}" ]]; then
        mv "${SOURCE_DIR}/${ITEM}" "${TARGET_DIR}"
    elif [[ -d  "${SOURCE_DIR}/${ITEM}" ]]; then
        cp -r "${SOURCE_DIR}/${ITEM}" "${TARGET_DIR}"
    fi
done

ITEMS=$(ls -a ${SOURCE_DIR})
COUNTER=0
for ITEM in ${ITEMS}; do
    COUNTER=$((COUNTER + 1))
done

if [["${COUNTER}" -gt 0 ]]; then
    echo "jeszcze coś zostało"
else
    echo "tu był Kononowicz, nie będzie niczego"
fi
if [["${COUNTER}" -ge 2 ]]; then
    echo "zostały co najmniej 2 plik"
fi
if [["${COUNTER}" -gt 4 ]]; then
    echo "zostało wiecej niz 4 pliki"
fi

if [["${COUNTER}" -ge 2 ] && ["${COUNTER}" -lt 4 ]]; then
    echo "coś piszemy"
fi

DATA=$(date +"%Y-%m-%d")
zip -r "bakap${DATA}.zip" "${TARGET_DIR}"