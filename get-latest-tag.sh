#!/bin/bash

tag=$(git tag | tail -n 1)
echo "tag-name=$tag" >> $GITHUB_OUTPUT
