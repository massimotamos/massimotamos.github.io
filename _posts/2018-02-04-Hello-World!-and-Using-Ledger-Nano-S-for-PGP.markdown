---
layout: post
comments: true
title:  "Hello World! and Using Ledger Nano S for PGP"
date:   2018-02-03 15:04:23
categories: [pgp]
tags: [pgp, ledger, nano s, GIT, signing, security, encryption, SSH]
---

I have been thinking about setting up a blog and sharing what I have been working on. On this journey, I've tried several blog engines and failed miserably. After trial and failure phase, I decided to give a go on github pages and jekyll. And here we are!

I will not go over all the bad things I have seen in those engines (I wont even name them here), but I'd really like to share how I integrated my [Ledger Nano S] with pgp, git and SSH to safely store my private key, sign tags/commits and safely authenticate to my servers/GIT when I was working on building this blog.

Ledger Nano S is a hardware Crypto Wallet (Cold Wallet, Crypto Wallet) with extensible functionalities. There are many other competitors in this field and they are also fascinating devices. Hardware wallet simply generates a new private key or uses your pgp seed ([wordlist]) to generate your existing key and store it. Once your private key is generated, all wallet adresses are generated from the public key. If this wordlist/wallet generation does not make any sense to you please see [BIP32], [BIP39], [BIP44]. You can not directly reach your private key and using the interface provided by the device/software implementation, you have your signing and decryption done.    

Ledger Nano S can also be used as a PGP Card, thanks to [OpenPGP] implementation. With this, you can have 3 independent keys (signing,encryption,authentication) on Nano S and use it for your needs. NanoS can have 3-5 applications on it at the same time. You may need to remove wallet apps time to time.

**Removing wallet apps will never clear/remove/delete your tokens, coins, assets on that particular cryptocurrency, your coins will be safe. Due to the path generation protocols I mentioned earlier (BIP32/39/44) you can re-install the wallet apps. Everytime you install them, you will see the same wallet adress.**

The setup I have:
* Host machine: Windows 10
* Guest machine: Kali Linux 2018.01 (Virtualbox)
* Ledger Nano S with OpenPGP implementation. To install it on NanoS, go to Ledger manager app (chrome app) click 'Show developer Items' at the right bottom side and choose Open PGP (Developer)
![image]({{ site.baseurl }}/assets/images/post1/post1-1.png)


*All implementation will be done on Linux machine. As far as I researched, there doesn't seem to be a working implementation for this on windows.*

Pre-configurations for Virtualbox Linux machine:
* make sure to include USB slot available to guest machine.

![image]({{ site.baseurl }}/assets/images/post1/post1-2.jpg)

After booting up your Linux VM, you can try the shell script below which does the following:
* Installs the smartcard daemon necessary to use our nano S
* Configures some files in order to scdaemon to recognize our device and use pin functionality on device itself
* Sets this daemon to start at boot and restarts
* Sets SSH to use our device for public key authentication (You need to use the public key derived from Nano S and put it inside authorized_keys)
* Sets GIT to use the device for signing

```sh
    apt-get install scdaemon
	echo "reader-port \"Ledger Token [Nano S] (0001) 01 00\"" > ~/.gnupg/scdaemon.conf
	echo "enable-pinpad-varlen" >> ~/.gnupg/scdaemon.conf

	/usr/lib/gnupg/scdaemon --options ~/.gnupg/scdaemon.conf --daemon

	service pcscd restart

	# This will enable pcscd to start on boot
	systemctl enable pcscd.service

	if [ -e ~/.gnupg/scdaemon.conf ]
	then
		echo -e "\\nReader and delegated PIN Support added."
	else
		echo -e "\\nProblem creating scdaemon.conf!"
	fi
	
	##SSH
	echo "enable-ssh-support" >> ~/.gnupg/gpg-agent.conf

	##Copy these to .bashrc
	gpg-connect-agent /bye

	if [ -S $(gpgconf --list-dirs agent-ssh-socket) ]; then
  		export SSH_AUTH_SOCK=$(gpgconf --list-dirs agent-ssh-socket)
	else
  		echo "$(gpgconf --list-dirs agent-ssh-socket) doesn't exist. Is gpg-agent run$"
	fi
```

Executing this, your machine should be able to recognize Nano S. You can test this via ```pcsc_scan``` command. If its not getting recognized, try enabling/disabling nano S on Virtualbox Menus/Devices/Ledger Nano S [0200] as illustrated in picture below.

![image]({{ site.baseurl }}/assets/images/post1/post1-3.png)

If you have not generated OpenPGP keys, go to [OpenPGP Doc] page 13 and configure.

Once you successfully generated your keys, last step is to add it to GIT so that you can also sign your commits and tags which is a really good addition to your app security.

To get {$KEY_ID}, issue the following command on shell to see your keys with keygrips:
```sh
$gpg -k --with-subkey-fingerprint --with-keygrip YOUR-KEY-NAME-HERE(ex:KAAN)
```
You Should see a screen like this and should copy the keygrip of Signature key:

```
    pub rsa2048 2017-08-25 [SC]
    '' 7886147C4C2E5CE2A4B1546C831415DA94A9A15C''
    '' Keygrip = DE2B63C13AB92EBD2D05C1021A9DAA2D40ECB564''
    uid [ultimate] cedric
    sub rsa2048 2017-08-25 [E]
    '' 789E56872A0D9A5AC8AF9C2F8E95F2999EEC38C4''
    '' Keygrip = 9D7C2EF8D84E3B31371A09DFD9A4B3EF72AB4ACE''
    sub rsa2048 2017-08-28 [A]
    '' 2D0E4FFFAA448AA2770C7F02C20B90E12F68F035''
    '' Keygrip = 6D60CB58D9D66EE09804E7FE460E865A91F5E41A''
```

Replace {$Signature_KEY_ID} with Signature keygrip and issue the following command.
```
$git config --global commit.gpgsign true
$git config --global user.signingkey {$Signature_KEY_ID}
```

You can also get the SSH key from ledger to copy over your servers using:
```
$gpg --export-ssh-key {$Authentication_KEY_ID}

ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDCIARKh0IZTHld+I6oA8nwrgnCUQE8f
7X3pmI4ZwryT52fKhpcsQJsd3krodXrM//LiK8+m2ZRMneJ9iGlqqE7SCyZkNBj1GUm9s
rK3Q5eoR6nU0s+sq17b/FAtQWHBJTqqaOtyA33hFj5twUtWZ6rokX9cNZrD1ne8kRVHDe
3uEBsaY5PR1Tuko/GwywLyZu0SwfEobl/RPjL7P8rUSc7DTHpQMw8fjJFb4BNvIHAlaVC
5FwZwkuogygaJdN/44MayHFmOZmzx9CAgYgLpTzen35+CcyhlqCqi+HjNlnHL2DDWd4iR
d3Y6pY8LjS3xQkECc3Bhedptp17D+H9AVJt openpgp:0x2F68F035
```

After setting up everything, do not forget to open OpenPGP app on Nano S and you can try using GIT and SSH with your new token.


[Ledger Nano S]:      https://www.ledgerwallet.com/products/ledger-nano-s
[Wordlist]: https://en.wikipedia.org/wiki/PGP_word_list
[BIP32]: https://github.com/bitcoin/bips/blob/master/bip-0032.mediawiki
[BIP39]: https://github.com/bitcoin/bips/blob/master/bip-0039.mediawiki
[BIP44]: https://github.com/bitcoin/bips/blob/master/bip-0044.mediawiki
[OpenPGP]: https://github.com/LedgerHQ/blue-app-openpgp-card
[OpenPGP Doc]: https://github.com/LedgerHQ/blue-app-openpgp-card/blob/master/doc/user/blue-app-openpgp-card.pdf

