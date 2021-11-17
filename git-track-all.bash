#!/usr/bin/env bash

## stat -f '%A ... %N' .* *

for branch in $(git branch --all | grep '^\s*remotes' | egrep --invert-match '(:?HEAD)$'); do
    echo "$branch"
    git branch --track "${branch##*/}" "$branch"
    git fetch --all
    git pull --all
done

## git branch -a |
##   grep -v HEAD |
##   perl -ne 'chomp($_); s|^\*?\s*||; if (m|(.+)/(.+)| && not $d{$2}) {print qq(git branch --track $2 $1/$2\n)} else {$d{$_}=1}' |
##   csh -xfs