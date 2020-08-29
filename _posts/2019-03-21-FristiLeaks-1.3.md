# FristiLeaks 1.3

As stated in the page from were I dowloaded the VM:

`https://www.vulnhub.com/entry/fristileaks-13,133/`

You first need to assign the MAC address:

`08:00:27:A5:A6:76`

to get an IP:

`192.168.1.106`

Scanning for Enumeration, our friend:

`sudo nmap -sV -O 192.168.1.106`

The outcome:

```
tamosma@kali:~/hck-exercise/fristiLeaks_1.3.ora$ sudo nmap -sV -O 192.168.1.106
Starting Nmap 7.80 ( https://nmap.org ) at 2020-03-21 17:26 EDT
Nmap scan report for 192.168.1.106
Host is up (0.00057s latency).
Not shown: 999 filtered ports
PORT   STATE SERVICE VERSION
80/tcp open  http    Apache httpd 2.2.15 ((CentOS) DAV/2 PHP/5.3.3)
MAC Address: 08:00:27:A5:A6:76 (Oracle VirtualBox virtual NIC)
Warning: OSScan results may be unreliable because we could not find at least 1 open and 1 closed port
Device type: general purpose
Running: Linux 2.6.X|3.X
OS CPE: cpe:/o:linux:linux_kernel:2.6 cpe:/o:linux:linux_kernel:3
OS details: Linux 2.6.32 - 3.10, Linux 2.6.32 - 3.13
Network Distance: 1 hop
```
We do not get much back:

There is an http service at:
`0/tcp open  http    Apache httpd 2.2.15 ((CentOS) DAV/2 PHP/5.3.3)`

and the OS is:

```
OS CPE: cpe:/o:linux:linux_kernel:2.6 cpe:/o:linux:linux_kernel:3
OS details: Linux 2.6.32 - 3.10, Linux 2.6.32 - 3.13
```
Trying to access the webpage:

http://192.168.1.106/

we get the message:

`Keep Calm and Drink Fristi`

Since there is only a service, I decide to explore more with nikto:

```nikto -h 192.168.1.106 -p 80```

and we get back:

```
tamosma@kali:~ nikto -h 192.168.1.106 -p 80
- Nikto v2.1.6
---------------------------------------------------------------------------
+ Target IP:          192.168.1.106
+ Target Hostname:    192.168.1.106
+ Target Port:        80
+ Start Time:         2020-03-21 17:41:33 (GMT-4)
---------------------------------------------------------------------------
+ Server: Apache/2.2.15 (CentOS) DAV/2 PHP/5.3.3
+ Server may leak inodes via ETags, header found with file /, inode: 12722, size: 703, mtime: Tue Nov 17 13:45:47 2015
+ The anti-clickjacking X-Frame-Options header is not present.
+ The X-XSS-Protection header is not defined. This header can hint to the user agent to protect against some forms of XSS
+ The X-Content-Type-Options header is not set. This could allow the user agent to render the content of the site in a different fashion to the MIME type
+ Entry '/cola/' in robots.txt returned a non-forbidden or redirect HTTP code (200)
+ Entry '/sisi/' in robots.txt returned a non-forbidden or redirect HTTP code (200)
+ Entry '/beer/' in robots.txt returned a non-forbidden or redirect HTTP code (200)
+ "robots.txt" contains 3 entries which should be manually viewed.
+ Apache/2.2.15 appears to be outdated (current is at least Apache/2.4.37). Apache 2.2.34 is the EOL for the 2.x branch.
+ PHP/5.3.3 appears to be outdated (current is at least 7.2.12). PHP 5.6.33, 7.0.27, 7.1.13, 7.2.1 may also current release for each branch.
+ Allowed HTTP Methods: GET, HEAD, POST, OPTIONS, TRACE 
+ OSVDB-877: HTTP TRACE method is active, suggesting the host is vulnerable to XST
+ OSVDB-3268: /icons/: Directory indexing found.
+ OSVDB-3268: /images/: Directory indexing found.
+ OSVDB-3233: /icons/README: Apache default file found.
+ 8727 requests: 0 error(s) and 15 item(s) reported on remote host
+ End Time:           2020-03-21 17:41:55 (GMT-4) (22 seconds)
```
Another way to achieve the same scanning results as above but with nmap:

```nmap -A -O -p80 192.168.1.106```

where -A and -O are related to the O.S. detection.

No much, so let's look for vulnerabilities related to Apache, PHP 5.3.3 and CentOS.

So let's search in searchsploit for Apache 2.2.15





