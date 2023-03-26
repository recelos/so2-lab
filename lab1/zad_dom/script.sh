#!/bin/bash

SOURCE_DIR=${1:-lab_uno}
RM_LIST=${2:-2remove}
TARGET_DIR=${3:-bakap}
ARCHIVE_NAME="${TARGET_DIR}_$(date +%Y-%m-%d).zip"

if [[ ! -d ${TARGET_DIR} ]]; then 
  echo "${TARGET_DIR} nie istnieje. Zostanie utworzony"
  mkdir ${TARGET_DIR}
fi

RM_ITEMS=$(cat ${RM_LIST})

for ITEM in ${RM_ITEMS}; do
  if [[ -f ${SOURCE_DIR}/${ITEM} ]]; then
    echo "Usuwam ${ITEM}"
    $(rm "${SOURCE_DIR}/${ITEM}")
  else 
    echo "Nie ma ${ITEM} do usuniecia"
  fi
done

for ENTRY in ${SOURCE_DIR}/*; do
  if [[ -d ${ENTRY} ]]; then
    echo "Kopiowanie katalogu: ${ENTRY}"
    cp -r ${ENTRY} ${TARGET_DIR}
  else
    echo "Kopiowanie pliku: ${ENTRY}"
    mv ${ENTRY} ${TARGET_DIR}
  fi
done

NUM_FILES=$(ls -1 ${SOURCE_DIR} | wc -l)

if [[ ${NUM_FILES} -eq 0 ]]; then
  echo "tu byl Kononowicz"
elif [[ ${NUM_FILES} -ge 4 ]]; then
  echo "sa wiecej niz 4"
elif [[ ${NUM_FILES} -ge 2 && ${NUM_FILES} -lt 4 ]]; then
  echo "sa wiecej niz 2 ale mniej niz 4"
fi

zip -r ${ARCHIVE_NAME} ${TARGET_DIR}