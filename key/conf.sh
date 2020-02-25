#! /bin/bash

sudo apt install -y wget gnupg2 gnupg-agent scdaemon pcscd git 
cd ~/.gnupg
wget https://raw.githubusercontent.com/KaanSK/kaansk.github.io/master/key/gpg-agent.conf
echo "export GPG_TTY=\"\$(tty)\"" >> ~/.bashrc
echo "export SSH_AUTH_SOCK=\"/run/user/$UID/gnupg/S.gpg-agent.ssh\"" >> ~/.bashrc
echo "gpg-connect-agent updatestartuptty /bye > /dev/null" >> ~/.bashrc
git config --global user.email "kaansk@gmail.com"
git config --global user.name "Kaan S.Karadag"
gpg --keyserver pgp.circl.lu --recv-keys 0xC87A8F9F5B2F03CB
ssh-add
git config --global user.signingkey 0xC87A8F9F5B2F03CB
gpg --card-status
