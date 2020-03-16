Apparently unless you do not have a mainboard with two i9 processors on it, running the latest windows 10 in a virtualized environment, will be be damt slow...
If you do not believe it, you just have to try it...

What an we do to make your virtual cpu run less than 100%? I succesfully tested some advices that I found around the netz and I want to share them with you.

### Disable the MS Defender
This may not be a good idea if you want to install products downloaded from the internet or you use the VM for surfing. It only makes sense if you use that VM for a narrowed scope, like running an application that in Wine will not work.

THere are three ways to disable Windows Defender:

1. Permanently disabled(1):

	1.1. Open a Text Editor Notepad and Type or Copy/Paste this code:
	`Windows Registry Editor Version 5.00
[HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows Defender]
"DisableAntiSpyware"=dword:00000001
   `
	1.2 Save the file with a .reg extension and run it!

2. Temprary disable Windows Defender: [how-to](https://learn.g2.com/how-to-turn-off-windows-defender)

3. Third way, this is a suggestion coming form my wife: buy a Mac :-)

There are other steps you can take to make Win10 lighter and it is by disabling unnecesary services.
Run the command mcc.msc and deselect the following services:

* BitLocker: It is likey that you do not care to encrypt your virtual disk
* Bluetooth audio gateway
* Bluetooth support services
* Diagnostic Execution service (remember this is a vm...)
* Data Usage
* Encrypting File system
* Windows Camera Frame Service
* Windows Mobile Hotspot service
* Geolocation Service
* Downloaded Maps Service
* Microsoft iSCSI Intiation Service
* Natural Authentication
* Performance Logs & Alerts
* Quality Windows Audio Service
* Retail Demo Service
* Radio Management Service
* Smart CArd
* Smart Card Enumeration
* Smart Card removal Service
* Windows Backup
* Payments and NFC
* Sensor Data Service
* Sensor Service
* Sensor Monitor Service
* Spatial Data Service
* Sprint Service
* Telephony
* Themes
* Volumetric Audio compositions Service
* WarpJITSvc
* Windows Miometric Service
* Parental Control
* Windows Update
* XBox services (all)


### References:
1. https://haxbabatech.blogspot.com/2017/08/disable-windows-defender-at-one-click.html