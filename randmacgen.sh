#!/bin/bash

FILE="vendormac.txt"

if [[ ! -f "${FILE}" ]];
then
    macchanger -l > ${FILE}
fi

OUIMAC=$(shuf -n 1 ${FILE} | awk '{ print $3 }')
UAAMAC=$(printf '%02x:%02x:%02x' $[RANDOM%256] $[RANDOM%256] $[RANDOM%256])

echo -e -n "Enter Network Interface Name: "
read INFACE

macchanger -m "${OUIMAC}:${UAAMAC}" ${INFACE}

