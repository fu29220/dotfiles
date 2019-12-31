#!/bin/bash

USER=XXX

REMOTE_ARR=(
    hpcgpu15.ai.lycc.qihoo.net:/home/$USER
    hpcgpu2.aitc.lycc.qihoo.net:/home/$USER/Works
    gpu06.sys.zzzc.qihoo.net:/home/$USER/Works
)
ARR_LEN=${#REMOTE_ARR[*]}

ARR_ID=$1
[[ -z ${ARR_ID} ]] && ARR_ID=0

[[ ${ARR_ID} -ge ${ARR_LEN} ]] && {
    echo "please check remote_host id"
    exit
}

PJ_DIR=$(dirname $(
    cd "$(dirname "$0")"
    pwd
))

rsync \
    --exclude .git \
    --exclude cache \
    --exclude docum \
    -avz ${PJ_DIR} $USER@${REMOTE_ARR[${ARR_ID}]}
    # -rtlq ${PJ_DIR} $USER@${REMOTE_ARR[${ARR_ID}]}
