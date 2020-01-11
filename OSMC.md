OSMC
====

Installation des Media-System OSMC

1. Image OSMC_TGT_rbp2_20150929.img mithilfe von Win32DiskImager auf SD schreiben,     Raspberry starten
2. Assistent durchlaufen
3. Ordner Serien+Video verbinden
4. My OSMC -> Pi-Config -> Enter MP2 License: decode_MPG2=0xbec815aa
5. Reboot

PVR 
-----

### DvbSky S960 installieren ###
> wget http://www.dvbsky.net/download/linux/dvbsky-firmware.tar.gz  
> tar -xzf dvbsky-firmware.tar.gz && rm dvbsky-firmware.tar.gz  
> cd dvbsky-firmware && sudo ./copy-firmware.sh  
> sudo reboot  

OSMC -> App Store -> TVHeadend installieren

Aufruf der Oberfläche über IP:9981
> http://192.168.178.3:9981

Installieren notwendiger Pakete zum kompilieren des Treiber
> sudo apt-get install git make gcc patch patchutils libproc-processtable-perl   

Herunterladen der Linux TV Treiber (http://git.linuxtv.org/cgit.cgi/media_build.git/about/)  
> git clone git://linuxtv.org/media_build.git  
> cd media_build  
> ./build   
> make install

! armv7-tvheadend-app-osmc             4.0.5-4                      armhf        TVHeadend for OSMC


### Genre Icon Pack ###
Download http://www.mediafire.com/download/bwzm3g8wnj49lmz/Disparity+Genre.rar

unzip to your /home/osmc/.kodi/addons/skin.eminence/media/

anpassen von 1080i/View_53_Wide.xml, ersetzen von $VAR[SquareImage] durch $VAR[VARLabel].jpg
