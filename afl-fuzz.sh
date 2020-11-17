#!/usr/bin/env sh

DECOLORIZE=0
CMD_SUFFIX=""

if [[ -n "${AFL_NOCOLOR}" && "0" != "${AFL_NOCOLOR}" ]] ;
    then DECOLORIZE=1
fi

if [[ -n "${AFL_NO_COLOR}" && "0" != "${AFL_NO_COLOR}" ]] ;
    then DECOLORIZE=1
fi

if [[ -n "${AFL_NOCOLOUR}" && "0" != "${AFL_NOCOLOUR}" ]] ;
    then DECOLORIZE=1
fi

if [[ -n "${AFL_NO_COLOUR}" && "0" != "${AFL_NO_COLOUR}" ]] ;
    then DECOLORIZE=1
fi

echo "DECOLORIZE = ${DECOLORIZE}"

if [[ "${DECOLORIZE}" == "1"]]; then
    CMD_SUFFIX="| sed \"s,\x1B\[[0-9;]*[a-zA-Z],,g\""
fi

echo afl-fuzz "$@" ${CMD_SUFFIX}
