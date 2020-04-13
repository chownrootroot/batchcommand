#!/bin/bash

while [ -n "${1}" ]; do
    if [ "${1}" == "-i" ]; then
        shift
        strInputFile=${1}
    fi
    shift
done

if [ -f "${strInputFile}" ]; then
    printf "%s\n" "Input fil hittad..."
else
    printf "%s\n" "Input fil ej hittad..."
    exit 1
fi

iLineNr=0
cat ${strInputFile} | while read line; do
    iLineNr=$((${iLineNr}+1))
    printf "%s %i..." "Processing line" "${iLineNr}"
    cat ${strInputFile} | sed -n "${iLineNr}p" | bash &>/dev/null
    printf "%s\n" "done"
done

exit 0

