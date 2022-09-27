#!/bin/bash

if [[ ! -z "${GITHUB_ACTOR}" ]];then
    git config user.name "${GITHUB_ACTOR}"
    git config user.email "${GITHUB_ACTOR}@users.noreply.github.com"
    SUFFIX=""
else
    SUFFIX="-manual"
fi

TAG=$(date +v%Y.%m.%d)"${SUFFIX}"
echo "New tag: ${TAG}"
git tag "${TAG}"
git push origin "${TAG}"
