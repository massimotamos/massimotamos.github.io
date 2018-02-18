---
layout: post
comments: true
title:  "Reverse Engineering with Immunity Debugger"
date:   2018-02-09 15:04:23
categories: [reverse]
tags: [reverse, engineering, immunity, strings, executable]
---

Reverse engineering is one of my favourite topics in CybSec. I haven't had any time to improve myself but from CTFs I have participated in and some seminars, I have some fundemental knowledge.

In this blog post, I'll be analyzing an executable provided for Malware lecture in Cyber Security MSc. by [Jaanus Kääp]. His seminar was so exciting and we surely learnt a lot. I'll be using basic commandline tools on Kali Linux and Immunity Debugger. All files can be found at [Task Repo].

[Sectools] describes Immunity Debugger as: a debugger whose design reflects the need to write exploits, analyze malware, and reverse engineer binary files. It builds on a solid user interface with function graphing, the industry's first heap analysis tool built specifically for heap creation, and a large and well supported Python API for easy extensibility.

My setup for this:
* Host Machine: Windows 10
* Virtualbox
* Guest Machine: Windows 7 (You can download official and [free Windows VMs])
* Guest Machine: Kali Linux

There was already a hint on the task submission page.

![image]({{ site.baseurl }}/assets/images/post2/post2-1.png)

Provided material was an executable, the function was simple: given a username, it generates a serial. The task was to find the algorithm and create a keygen if possible -of course I would create one-. Lets remember why keygens were so damn cool: https://soundcloud.com/dualtrax/sets/orion-keygen-music. 

From description, it can be assumed that the input and the whole string manipulation would be on English characters. I directly excluded numerical values for input considerations.

In order to have better understanding of input and output, I tried some extreme cases.

![image]({{ site.baseurl }}/assets/images/post2/post2-2.png)

From here it was clear that:
* No Numerical Values
* No special Characters
* Just Lower case English Alphabet [a-z]

Let's see this executable in Immunity Debugger

![image]({{ site.baseurl }}/assets/images/post2/post2-3.png)

The first thing to look for are strings. Using “All referenced text strings” under
“Search for”, some more logical stuff can be identified. This actually led the way to break the code apart.

![image]({{ site.baseurl }}/assets/images/post2/post2-4.png)

The fun part begins when the actual algorithm can be found before the compare (if) statement. After finding the
part illustrated in the picture below, it was identified that:
* The program loops exactly the same time as input length. So if the input is “kaan”, it will loop 4
times. This indicates there is some kind of manipulation char by char.
* When I googled “SAR”, “MOVZX” and “MOVSX” with “IMUL” instructions, so many pages related to
“bit shifting” algorithms came up. From here, it can be understood that there could be a shifting
algorithm like having bbbb when input is aaaa with 1 index shift.
* Using the lecturer’s advice, input “aaaa” was used to identify the algorithm. As they can be seen
in expression watchtable, AL (lower 8 bits of EAX) was being compared to that area and for every
“61” => a, the value thats being compared is “6B”=> k. After testing with 2-3 letters, it can be
identified that

```
    For char in inputstring:
        Serial += englishletters[char.index + 10]
``` 

The serial consists of the chars, shifted 10 times forwards in English alphabet in lower characters.

![image]({{ site.baseurl }}/assets/images/post2/post2-5.png)

Is the task done? Of course no! Now the coolest part: preparing the keygen. For this I'm using my beloved python.(It also has 16 bit keygen background music as well...). I used Vim editor and tkinter gui library to prepare the keygen.

![image]({{ site.baseurl }}/assets/images/post2/post2-6.png)

And I was successful on reverse engineering this executable:

![image]({{ site.baseurl }}/assets/images/post2/post2-7.png)




[Jaanus Kääp]:      https://www.clarifiedsecurity.com/jaanus-kaap/
[Free Windows VMs]: https://developer.microsoft.com/en-us/microsoft-edge/tools/vms/
[Sectools]: http://sectools.org/tool/immunitydebugger/
[Immunity Debugger]: https://www.immunityinc.com/products/debugger/
[Task Repo]: https://github.com/KaanSK/Reverse-Engineering-Example-with-Python-Keygen

