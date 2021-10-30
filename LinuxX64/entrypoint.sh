#!/bin/bash

export RUNNER_ALLOW_RUNASROOT=1
export PATH=$PATH:/actions-runner

echo "Set Configuration"
config.sh \
    --url "${SHORT_URL}" \
    --token "${RUNNER_TOKEN}" \
    --name "${RUNNER_NAME}" \
    --work "${RUNNER_WORKDIR}" \
    --labels "${LABELS}" \
    --unattended \
    --replace

unset RUNNER_TOKEN

run.sh