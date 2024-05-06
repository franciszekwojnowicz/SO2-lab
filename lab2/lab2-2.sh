#!/bin/bash

FIRST_DIR=${1:-dir1}
SECOND_DIR=${2:-dir2}

#check folders
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
    temp_name="${ITEM%.*}"
    if [[ -L  "${FIRST_DIR}/${ITEM}" ]]; then
        echo "${ITEM} - to jest dowiazanie symboliczne"
    elif [[ -d "${FIRST_DIR}/${ITEM}" ]]; then
        echo "${ITEM} - to jest katalog" 
        # extension service   
        if [[ "${temp_name}" == "${ext}" ]]; then
            ln -s "../${FIRST_DIR}/${ITEM}" "${SECOND_DIR}/${temp_name^^}_ln"
        else
            ln -s "../${FIRST_DIR}/${ITEM}" "${SECOND_DIR}/${temp_name^^}_ln.${ext}"
        fi
    elif [[ -f "${FIRST_DIR}/${ITEM}" ]]; then
        echo "${ITEM} - to jest plik regularny"
        # extension service   
        if [[ "${temp_name}" == "${ext}" ]]; then
            ln -s "../${FIRST_DIR}/${ITEM}" "${SECOND_DIR}/${temp_name^^}_ln"
        else
            ln -s "../${FIRST_DIR}/${ITEM}" "${SECOND_DIR}/${temp_name^^}_ln.${ext}"
        fi
    fi
done