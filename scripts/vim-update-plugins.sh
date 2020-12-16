#!/usr/bin/env bash

cd $HOME/.vim/pack/$USER/start

for REPO in `ls`; do
    # Enter plugin dir.
	cd $REPO

    # Change to master branch to pull deps.
    git checkout master

    # Get newest updates.
    git pull

    # Get the commit hash of the last release tag.
	git log --tags | head -n1 | awk '{print $2}' | xargs git checkout

    # Go back to plugins dir.
	cd ..
done

