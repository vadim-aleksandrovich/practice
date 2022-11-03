#! /bin/bash

read -p 'Please enter Нour ssh public key : ' key
echo $key >> /home/git/.ssh/authorized_keys
