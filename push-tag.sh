#!/bin/bash

if [[ ! -z "${GITHUB_ACTOR}" ]];then
    git config user.name "${GITHUB_ACTOR}"
    git config user.email "${GITHUB_ACTOR}@users.noreply.github.com"
fi

TAG=$(date +v%Y%m%d-%H%M%S)
git tag "${TAG}"
git push origin "${TAG}"
