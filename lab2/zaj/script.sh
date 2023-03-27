#!bin/bash -eu

SOURCE_DIR=${1}
TARGET_DIR=${2}

(ls -l ${SOURCE_DIR})

if [[ ! -d ${SOURCE_DIR} || ! -d ${TARGET_DIR} ]]; then 
  echo "${SOURCE_DIR} lub ${TARGET_DIR} nie istnieje"
  exit 1
fi

for FILE in "${SOURCE_DIR}"/*; do
  if [[ -d ${FILE} ]]; then 
    ln -s ${FILE} "${TARGET_DIR}/${FILE#*/}"
  else
    FILENAME=${FILE#*/}
    EXTENSION=${FILENAME##*.}
    FILENAME_WITHOUT_EXTENSION="${FILENAME%.*}"
    LARGE_FILENAME=${FILENAME_WITHOUT_EXTENSION^^}
    LARGE_FILENAME_WITH_SUFFIX=${LARGE_FILENAME}_ln
    FINAL_FILENAME=${LARGE_FILENAME_WITH_SUFFIX}.${EXTENSION}
    ln -s ../${FILE} ${TARGET_DIR}/${FINAL_FILENAME}
  fi
done

(ls -l ${TARGET_DIR})