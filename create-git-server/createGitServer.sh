#! /bin/bash
apt update && sudo apt install git
useradd -r -m -U -d /home/git -s /bin/bash git
mkdir -p /home/git/.ssh && chmod 0700 /home/git/.ssh
touch /home/git/.ssh/authorized_keys && chmod 0600 /home/git/.ssh/authorized_keys


chown -R git:git /home/git