#!/bin/bash
echo -e "\033[0;32mDeploying updates to GitHub...\033[0m"

cd site/public

if [ -n "$AUTH_SECRET" ]
then
    touch ~/.git-credentials
    chmod 0600 ~/.git-credentials
    echo $AUTH_SECRET > ~/.git-credentials

    git config credential.helper store
    git config user.email "63507695+anudeepsamaiya-blog-bot@users.noreply.github.com"
    git config user.name "anudeepsamaiya-blog-bot"
fi

git add .
git commit -m "Publishing to anudeepsamaiya.github.io.git:master"
git pull --rebase origin master
git push origin HEAD:master
