# FHEM

Installation von Raspbian + FHEM + Zugriff auf das [I2C](I2C.md) Protololl

Raspbian Image mit Win32DiskImager auf eine SD Karte schreiben.  
Dann auf der SD Karte eine leere Textdatei mit dem Namen "ssh." erstellen (ohne Dateiendung), dies aktiviert den SSH zugriff.

RasPi booten, im Router nach der IP Adresse suchen und unter Windows mit dem Tool putty auf den raspi verbinden.
* Benutzername: pi
* Passwort: raspberry

Wichtige Systemkonfigurationen vornehmen
> sudo raspi-config
* Hostname
    * Hauszentrale
* Localisazion
    * Change Locale -> de_DE.UTF-8 UTF-8	
	* Change Timezone -> Europe -> Berlin
	* Change Wi-fi Country -> DE Germany
	* Interfacing Options
	    * P5 I2C -> Enable
	* Advanced Options -> Expand Filesystem
	* Update

Neustart des Raspberry
> sudo reboot 

Aktualisieren des Betriebssystem
> sudo apt-get update && sudo apt-get dist-upgrade -y && sudo apt-get autoremove -y && sudo reboot  

Installieren von Paketen die für FHEM + I2C benötigt werden.

> sudo apt-get -f install && sudo apt-get install perl libdevice-serialport-perl libio-socket-ssl-perl libwww-perl libxml-simple-perl libjson-perl i2c-tools git libcgi-pm-perl sqlite3 libdbd-sqlite3-perl libtext-diff-perl -y (mal ohne folgende Pakete versucht: mplayer mp3wrap)

Umstellen der Bus-Geschwindigkeit des I2C
> sudo nano /boot/config.txt  
* dtparam=i2c1_baudrate=32000


Herunterladen und Installieren von FHEM
> sudo wget http://fhem.de/fhem-6.0.deb && sudo dpkg -i fhem-6.0.deb && rm fhem-6.0.deb  

Rechte korrigieren
> cd /opt && sudo chmod -R a+w fhem && sudo usermod -a -G tty pi && sudo usermod -a -G tty fhem

Benutzer konfigurieren
> sudo adduser fhem gpio && sudo adduser fhem i2c && sudo reboot

FHEM ist fertig installiert, du kannst die Haussteuerung nun über den Browser aufrufen. FHEM läuft per default auf Port 8083
> http://[ip-adresse]:8083

Hinzufügen weiterer Quellen für FHEM Pakete in der Komandozeile von FHEM (ganz oben im Browserfenster)  
`update add https://raw.githubusercontent.com/RettungsTim/fhem-rollo/master/controls_fhemrollo.txt`  
`update add https://raw.githubusercontent.com/ThomasRamm/fhem-taster/master/controls_taster.txt `  
`update add https://raw.githubusercontent.com/knowthelist/fhem-tablet-ui/master/controls_fhemtabletui.txt`  
`update add https://raw.githubusercontent.com/nesges/Widgets-for-fhem-tablet-ui/master/controls_widgets-for-fhem-tablet-ui.txt`  
`update all`  
`shutdown restart`  

---

## HUE Emulation zur Integration FHEM+Home+Alexa+Harmony

### Java installieren
> sudo apt-get install oracle-java8-jdk  

### HaBridge installieren
> sudo mkdir -p /opt/habridge /etc/habridge /etc/habridge/data  
> sudo wget https://github.com/bwssytems/ha-bridge/releases/download/v4.5.6/ha-bridge-4.5.6.jar -O /opt/habridge/ha-bridge.jar

Bearbeiten der Config-Datei
> sudo nano /etc/systemd/system/habridge.service
````
[Unit]
Description=HA Bridge
Wants=network.target
After=network.target

[Service]
Type=simple

ExecStart=/usr/bin/java -jar -Dconfig.file=/etc/habridge/habridge.config /opt/habridge/ha-bridge.jar

[Install]
WantedBy=multi-user.target
````

Systemdienst starten
````
sudo systemctl daemon-reload
sudo systemctl start habridge.service
sudo systemctl enable habridge.service
````

Die HaBridge ist nun installiert und die Webseite des dienstes kann aufgerufen werden.


### FHEM Konfiguration 

`define WEBhabridge FHEMWEB 8088 global`  
`attr WEBhabridge csrfToken none`  
`attr WEBhabridge allowfrom 127.0.0.1|192.168.1.10`  

### HA Bridge Konfiguration

Beispieleinträge:
Ziel | Typ | Befehl | Art | Kodierung
|-|-|-|-|-
| ON | HTTP Device | http://hauszentrale:8088/fhem?cmd=set%20WohnLicht2%20on&XHR=1 | GET | text/html
| OFF | HTTP Device | http://hauszentrale:8088/fhem?cmd=set%20WohnLicht2%20off&XHR=1 | GET | text/html
| OFF | HTTP Device  | http://hauszentrale:8088/fhem?cmd=set%20RolloEssen%20closed&XHR=1 | GET | text/html
| DIM | HTTP Device | http://hauszentrale:8088/fhem?cmd=set%20RolloEssen%20position%20${intensity.percent}&XHR=1 | GET | text/html
| ON  | HTTP Device | http://hauszentrale:8088/fhem?cmd=set%20RolloEssen%20open&XHR=1 | GET | text/html

## Weitere Module

* [Telegram](Ubuntu.md)
* [Google Home](Ubuntu.md)