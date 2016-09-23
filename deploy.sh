#!/bin/bash

echo -e "\033[0;32mDeploying updates to GitHub...\033[0m"

# Build the project.
hugo # if using a theme, replace by `hugo -t <yourtheme>`

# Commit changes.
msg="rebuilding site `date`"
if [ $# -eq 1 ]
  then msg="$1"
fi

# push on source code repo
git add .
git commit -m "$msg"
git push origin master


# Go To Public folder
cd public
# Add changes to git.
git add -A

git commit -m "$msg"

# Push source and build repos.
git push origin master

# Come Back
cd ..
