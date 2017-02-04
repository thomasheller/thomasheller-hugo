#!/usr/bin/zsh

# Deploy site to GitHub pages by commiting and pushing to the repository
# See: https://gohugo.io/tutorials/github-pages-blog/
#
# Usage: `deploy.sh' deploys with default commit message (timestamp)
#        `deploy.sh "foo bar"' deploys with custom commit message

echo -e "\033[0;32mDeploying updates to GitHub...\033[0m"

# Build the project.
hugo -t cocoa-eh-tmh

# Go To Public folder
cd public
# Add changes to git.
git add -A

# Commit changes.
msg="rebuilding site `date`"
if [ $# -eq 1 ]
  then msg="$1"
fi
git commit -m "$msg"

# Push source and build repos.
git push origin master

# Come Back
cd ..
