#! /bin/bash

sudo apt install -y wget gnupg2 gnupg-agent scdaemon pcscd 
cd ~/.gnupg
wget https://raw.githubusercontent.com/drduh/config/master/gpg-agent.conf
echo "export GPG_TTY=\"\$(tty)\"" >> ~/.bashrc
echo "export SSH_AUTH_SOCK=\"/run/user/$UID/gnupg/S.gpg-agent.ssh\"" >> ~/.bashrc
echo "gpg-connect-agent updatestartuptty /bye > /dev/null" >> ~/.bashrc