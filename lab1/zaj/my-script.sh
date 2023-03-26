#!/bin/bash
DIRECTORY=${1}

if [[-d ${DIRECTORY}]]
then 
  echo "${DIRECTORY} exists"
  rm -rf ${DIRECTORY}
fi

mkdir ${DIRECTORY}

FILENAME=${2}
ITEMS=$(cat ${FILENAME})

COUNTER=0
set -x

for ITEM in ${ITEMS}
do
  if [[ $((COUNTER % 2)) -eq 0 ]]
  then
    echo "Creating ${ITEM} as file"
    touch ${DIRECTORY}/${ITEM}
  else
    echo "Creating ${ITEM} as directory"
    mkdir ${DIRECTORY}/${ITEM}
  fi
  COUNTER=$((COUNTER+1))
done