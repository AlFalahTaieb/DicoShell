#!/bin/bash

# describe.sh - query word definitions from oxford dictionaries api

# Copyright (c) 2019, Taieb
# All rights reserved.

set -e

KEYWORD=$1

if [ -z "$KEYWORD" ]; then
    echo "[e] Please enter a keyword as an argument!"
    exit 1;
fi

if [ ! -x curl ] ; then
    command -v curl >/dev/null 2>&1 || { echo >&2 "[e] Please install curl or set it in your path! \nFor debian, ubuntu and their derivative gnu/linux distributions run: \nsudo apt install curl"; exit 1; }
fi

curl dict.org/d:$KEYWORD:foldoc


