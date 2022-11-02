#! /bin/bash

read -p 'Please, indicate repository name: ' repo
git init --bare /home/git/$repo.git
chown -R git:git /home/git