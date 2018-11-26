#!/bin/bash

# 1. Ignore the lines of .eslintignore
# 2. Find the fork point (where your git branch differs from origin/master)
# 3. Print the names of files that changed from your head to the fork point, minus eslint ignored files

# 1. Find ignored files
ignoreFile='.eslintignore'
ignored=''
if [[ -f $ignoreFile ]]; then
    while IFS= read -r line; do
        ignored="${ignored} :(exclude)${line}"
    done < $ignoreFile
fi

# 2. Find branch point
origin='origin/master'
branch_point=$(git merge-base --fork-point origin/master)

# 3. Get changed file names
git diff --name-only --diff-filter=d $branch_point -- . $ignored
