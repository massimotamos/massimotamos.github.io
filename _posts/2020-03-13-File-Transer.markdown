# SimpleHTTPServer 

``
python -m SimpleHTTPServer 8000
``

Or customizing:

```python
#!/bin/python
import SimpleHTTPServer
import SocketServer

PORT = 8000

Handler = SimpleHTTPServer.SimpleHTTPRequestHandler

httpd = SocketServer.TCPServer(("", PORT), Handler)

print "serving at port", PORT
httpd.serve_forever()
```
---
# Download with wget

### Continue an Incomplete Download
``
wget -c file
``

### Mirror an Entire Website
``
wget -m http://example.com
``

options:

* ``--convert-links`` changes links inside each downloaded page so that they point to each other, not the web.

* ``--page-requisites`` downloads things like style sheets, so pages will look correct offline.
* ``--no-parent`` stops wget from downloading parent sites. So if you want to download http://example.com/subexample, you won’t end up with the parent page.

### Download an Entire Directory
``
wget -r ftp://example.com/folder
``

### Download a List of Files at Once
``
wget -i download.txt
``

Few other options:

* ``-b`` :run then download in the background.
* ``-t 10`` :keep trying to download even if there is a 404 error. will try to download 10 times;
* ``--limit-rate=200k`` :Limit the download bandwidth speed at 200KB/s.

---
# /dev/tcp examples 

### Downloading a URL via /dev/tcp:
``
$ exec 5<>/dev/tcp/www.net.cn/80
$ echo -e "GET / HTTP/1.0\n" >&5
$ cat <&5
``

---------------------

# Start Kali FTP Daemon
### 1 Install atftpd

Install atftpd package. Disable inetd and run systemd service. /srv/tftp is used for TFTP server directory.

```bash
$ sudo apt install -y atftpd
$ sudo sed -e 's/^USE_INETD=true/USE_INETD=false/g' -i /etc/default/atftpd
$ sudo systemctl enable atftpd
$ sudo systemctl restart atftpd
```

---------------------
# Transferring Files to Windows

### TFTP (Windows XP & Windows 2003)
A TFTP client is installed by default on windows machines up to Windows XP and Windows 2003. What is good about TFTP is that you can use it non-interactively. Which means less risk of losing your shell.



---
#### References:
1. https://www.howtogeek.com/281663/how-to-use-wget-the-ultimate-command-line-downloading-tool/
2. http://fibrevillage.com/scripting/603-dev-tcp-examples-and-trouble-shooting
3. https://docs.python.org/2/library/simplehttpserver.html
