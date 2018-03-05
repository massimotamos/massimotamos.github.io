---
layout: post
comments: true
title:  "Security.txt!? What is it and Why do we Need it"
date:   2018-03-04 18:04:23
categories: [appsec]
tags: [securitytxt, RFC5785]
---

You all know about robots.txt already but are you aware of the proposal security.txt and how it will help your app/company?

Security researchers often face problems when it comes to communicate the site-owner/company about a vulnerability and the app can be not in any bug bounty programs. Then, how should researcher share this information? Majority of time, the vulnerabilities found are just left undisclosed because of problems on communication side.

What can we do about it? The most logical and easiest solution would be including details on whom to communicate with and how on the website. Yet, without any standards, researcher could also use his time to look for any communication channels or responsible and we all know that not every website/app has good UI-UX.

To adress this, people came up with the solution: [Security.txt]. It's a text based file stored just like robots.txt with information on Security responsibles and ways to disclose a vulnerability for that particular app. **_Security.txt has been submitted to RFC review and currently is just an [Internet Draft]._** 

Let's look at the Internet Draft

![image]({{ site.baseurl }}/assets/images/post6/post6-1.jpg)

Now let's look at how Google implemented it:

![image]({{ site.baseurl }}/assets/images/post6/post6-2.jpg)

And this is mine: [KaanSK Security.txt]https://kaansk.github.io/.well-known/security.txt)

You can also realize _.well-known_ folder in URLs. This has been spesified in [RFC5785] as:


>It is increasingly common for Web-based protocols to require the discovery of policy or other information about a host ("site-wide metadata") before making a request. For example, the Robots Exclusion Protocol http://www.robotstxt.org/ specifies a way for automated processes to obtain permission to access resources; likewise, the Platform for Privacy Preferences [W3C.REC-P3P-20020416] tells user-agents how to discover privacy policy beforehand.
>While there are several ways to access per-resource metadata (e.g., HTTP headers, WebDAV's PROPFIND [RFC4918]), the perceived overhead (either in terms of client-perceived latency and/or deployment difficulties) associated with them often precludes their use in these scenarios.
>
>When this happens, it is common to designate a "well-known location" for such data, so that it can be easily located. However, this approach has the drawback of risking collisions, both with other such designated "well-known locations" and with pre-existing resources.
>To address this, this memo defines a path prefix in HTTP(S) URIs for these "well-known locations", /.well-known/. Future specifications that need to define a resource for such site-wide metadata can register their use to avoid collisions and minimise impingement upon sites' URI space.

To conclude, security.txt is not a replacement for bug bounties. Its just an extension or addition. It will make the vulnerability disclose process more convenient for security researchers and website/app owners.


[RFC5785]: https://tools.ietf.org/html/rfc5785
[Internet Draft]: https://tools.ietf.org/html/draft-foudil-securitytxt-02
[Security.txt]: https://securitytxt.org/
