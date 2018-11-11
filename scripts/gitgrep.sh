#!/usr/bin/env bash
export GITGREP_BRANCH=$1
echo $(git branch -a | grep $GITGREP_BRANCH | sed 's/.*origin\///')

