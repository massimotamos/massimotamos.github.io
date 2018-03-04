---
layout: post
comments: true
title:  "Score a Shell Challenge Write-Up"
date:   2018-03-04 15:04:23
categories: [writeup, challenge]
tags: [CTF, certifiedsecure, scoreashell]
---

I found the [CertifiedSecure] platform and started to work on "Score a Shell" challenge.

[CertifiedSecure] is an online training platform providing challenges on different levels and training materials. From their introduction:

```
Certified Secure exists to encourage and fulfill the growing interest in IT Security knowledge and skills. We stand for openness, transparency and the sharing of knowledge; 
making sure everybody can experience and enjoy IT security. Security is serious fun!
```

The challenge I wanted to work on was under "Essential Specialities". From here it was looking like a more demanding challenge comparing to others.

![image]({{ site.baseurl }}/assets/images/post5/post5-1.jpg)


The challenge description:

```
Take it to the next level! Score a shell is a tough challenge. The objective is to score a shell and to execute /secret/unlockme. This will result in an unlock code that you have to mail 
to unlock@certifiedsecure.com. Make sure to mention your CS-ID and a short description of your methods.
```

Till here, I was expecting a semi-dynamic webpage where I should look for vulnerable inputs or path-traversals.

The page was a static one with a background image. The background image was in '/images' folder. We will come back to this later. It was really lucky that I also noted this down when I first saw.

![image]({{ site.baseurl }}/assets/images/post5/post5-2.jpg)

I started the recon phase with nikto to see if there is any abnormalities, files or just to have a grasp of possible folder structure quickly.

![image]({{ site.baseurl }}/assets/images/post5/post5-3.jpg)

This robots.txt file could be of help. From here I also identified the /log/ path. If this path is followed, it redirects every request under it to 

```
https://scoreshell.certifiedsecure.org/log/login.php
```

Utilized [hydra] to bruteforce the authentication mechanism with small payloads, just to see the errors but it was obvious that this challenge was not about "brute forcing your way in".

While using burp suite, I came across a warning like "Unexpected Redirect Response Body" and it was giving a big hint.

After a brief search in google, I set-up my burp suite and wanted to follow the requests/responses to see this "Response Body". To do that, after getting the initial request, burp should be 
intercepting the redirection in order us to bypass it. Redirection will happen with HTTP Status code 302 and we need to change this to 200 to let browser render instead of redirect to login.php

![image]({{ site.baseurl }}/assets/images/post5/post5-5.jpg)

And BINGO, before the redirection, this service actually responds with DMESG output. For more information on this vulnerability, you can see [Execution After Redirect].

![image]({{ site.baseurl }}/assets/images/post5/post5-6.jpg)

From this point, as I didn't know anything about the backend, I tried every possible variable I could change. From SessionIDs to url... But none of them worked in any way. 
After some hours of desperation, I wanted to go for some known enumerations with the hope of finding new resources on the system and tried index.php

Second BINGO! Yes there was an index.php but on this point, as it's a php file, I couldnt get the logic inside that. Also, this made it clear that there are bunch of other resources in here.

I tried to enumerate the resources and wanted to go for index.php as well. On this point, I also remembered the hint company gave me when they sent the assignment. 
They recommended to use tilde ~ on resources. Lets try it:

![image]({{ site.baseurl }}/assets/images/post5/post5-7.jpg)

THIRD BINGO!

The Editors like nano and vim creates swap files. This ~ helped us on finding this. Let's see the logic inside index.php.

![image]({{ site.baseurl }}/assets/images/post5/post5-8.jpg)

As we suspected:
```php
if(!isset($_SESSION['authenticated'])) header("Location: /log/login.php");
```
This code is doing the actual redirection but the rest of the code is also getting executed. The important things here:

* There is a GET parameter "localfile"
* A mini firewall preventing usage of ./ and ../ which should be bypassed
* file_get_contents method

So it was obvious to fuzz this "localfile parameter" and I set up my burp with loading the payloads. I generally use the payloads here: https://github.com/swisskyrepo/PayloadsAllTheThings . 
Nice collection of different fields. Note here: I used the payloads on small amounts. After getting 10-15 responses, you can actually understand if it will work or not. No need to use entire file:).

![image]({{ site.baseurl }}/assets/images/post5/post5-9.jpg)

Unfortunately, couldnt find much. Got some directives but none of them seemed useful. At this point I needed to to some manual checking with [Path Truncation], in order to avoid this little firewall.

And with using the payload

```
..././..././//./..././..././//./.../././//./etc/passwd
```

![image]({{ site.baseurl }}/assets/images/post5/post5-10.jpg)

FOURTH BINGO! In here I also saw the www user which hinted me there may be a www folder with web resources, actually at this point only resources I knew were index and login.php.

As I didn't have much information, I just wanted to traverse and see the insides of folders one by one using "localfile" parameter I have prepared for LFI. This was the result for /usr and I just 
traversed through every folder here and their subfolders. 

In here, we do have a traversing solution but still do not have any place to upload any shell...

FIFTH BINGO! I identified the folder for "/log" resources under "usr/local/www/data/log/". Lets look into the services we have here:

![image]({{ site.baseurl }}/assets/images/post5/post5-12.jpg)

We do have an "upload-test" and authentication php files here. Seems like we are really close to get that Shell!

upload-test.php

```php
// Security: authenticate the user first

	require "authenticate.php";

	// process the image upload

	if((isset($_FILES["image"]))) { 

		$filename = basename($_FILES["image"]["name"]); 

		// security: must be a GIF image (important !!)

		if(strpos($filename, ".gif") === false) { 

			print "Security Breach!"; 
			
			exit;
		}

		// destination is /images/$filename 

		$destination = $_SERVER["DOCUMENT_ROOT"]."/images/"; 

		$destination .= basename($filename);
		
		// move the uploaded file 

		$tmpname = $_FILES["image"]["tmp_name"];

		if(move_uploaded_file($tmpname, $destination)) {

			print "Image uploaded, thanx!";
		
		} else print "Image upload failed"; 

		exit;
	}
```

We should find a way to authenticate or bypass it to use this functionality. For that, let's look at "authenticate.php"

```php
<?

	// both the username and password must be specified

	if(!isset($_GET["username"]) || !isset($_GET["password"])) {

		print "Missing username/password parameter";

		die;
	}

	$username = $_GET["username"]; 

	$password = $_GET["password"];

	// prepare database connection 

	mysql_connect("localhost", "illustrated", "PiVnmzctHEKKbMToOAcmZWI5");

	mysql_select_db("illustrated");

	// validate the specified username 

	$res = mysql_query("SELECT id FROM users WHERE username = 'a' union select '123 union  select 123' -- -'");

	if(!$res || !($row = mysql_fetch_row($res))) {

		print "Unknown username specified";

		die;
	}
	
	// validate the associated password
	
	$res = mysql_query("SELECT password FROM users WHERE id = ".$row[0]);

	if(!$res || !($row = mysql_fetch_row($res))) {

		print "Illegal userid record retrieved";

		die;
	}

	if($password != $row[0]) {

		print "Invalid password specified";

		die;
	}

	// Access Granted
?>

```

In this code, username and password is being fetched on 2 different sections and if username exists, its being feeded to the second one. The injection we should prepare should inject rogue statement to both. 
Meaning we will be exploiting the output of the first one.

After trial and error I got the injection/authentication bypass right with payload:

```
a' union select '123 union  select 123' -- -    (also password will be suplied as 123 on GET parameter)
```

Lets try and use this image upload:

![image]({{ site.baseurl }}/assets/images/post5/post5-13.jpg)

Even if we do have a valid file upload point here, we need to bypass the security checks on upload mechanism.

```
strpos($filename, ".gif") === false
```

So, including .gif in the name of the file seem to be the key here. I also downloaded php shells from: https://github.com/JohnTroony/php-webshells  and used cw.php as I had experience on this.

SIXTH BINGO (In order to upload this, I intercepted the upload and added username and password to querystring parameters as authentication.php was included in 
upload-test.php and preventing any upload without these parameters.)

![image]({{ site.baseurl }}/assets/images/post5/post5-14.jpg)

In the upload-test.login I also identified the upload folder in "$destination = $_SERVER["DOCUMENT_ROOT"]."/images/"; " this was the same folder on my initial inspection so we do not need any more 
abra kadabra to move around.

Using the shell we uploaded and getting the flag with URL https://scoreshell.certifiedsecure.org/images/{YOURSHELL}.gif.php:


![image]({{ site.baseurl }}/assets/images/post5/post5-15.jpg)








[Path Truncation]: https://hackingparadisesn.blogspot.com.ee/2015/05/introduction-to-local-file-inclusion.html
[Execution After Redirect]: https://www.owasp.org/index.php/Execution_After_Redirect_(EAR)
[Netsparker]: https://www.netsparker.com/
[hydra]: https://tools.kali.org/password-attacks/hydra
[CertifiedSecure]: https://www.certifiedsecure.com

