#!/usr/bin/env sh

DECOLORIZE=0
CMD_SUFFIX=""

if [ "${AFL_NOCOLOR:-0}" = "1" ]; then 
    DECOLORIZE=1
fi

if [ "${AFL_NO_COLOR:-0}" = "1" ]; then 
    DECOLORIZE=1
fi

if [ "${AFL_NOCOLOUR:-0}" = "1" ]; then 
    DECOLORIZE=1
fi

if [ "${AFL_NO_COLOUR:-0}" = "1" ]; then 
    DECOLORIZE=1
fi


echo "DECOLORIZE = ${DECOLORIZE}"

if [ "${DECOLORIZE}" = "1" ]; then
    CMD_SUFFIX="| sed \"s,\x1B\[[0-9;]*[a-zA-Z],,g\""
fi

echo afl-fuzz "$@" ${CMD_SUFFIX}
