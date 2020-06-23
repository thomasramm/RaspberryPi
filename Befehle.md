
Paketverwaltung
---------------

| Beschreibung | Befehl |
|-|-|
| Paketindex aktualisieren: |	sudo apt-get update |
| upgrade all your packages: |	sudo apt-get dist-upgrade |
| Paktedownloads bereinigen: |	sudo apt-get clean |
| Paket installieren: |		sudo apt-get install [paketname] |
| Paket suchen	|		sudo apt-cache search [paketname] |
| Paket entfernen: | sudo apt-get --purge remove [paketname] |
| nicht benötigte Pakete entfernen: | sudo apt autoremove |

TAR Archive
-----------
| Beschreibung | Befehl |
|-|-|
| Tar-Archiv entpacken      |	sudo tar xvzf [archivname].tar.gz |
| Ordner in Archiv packen   |	sudo tar -cvzf ./fhem.tar.gz fhem/ |
| Ordner rekursiv löschen   |	rm -r fhem |

Dienste steuern
---------------

* service syncthing start
* service syncthing stop
* service syncthing reload

Zeitgesteuerte Befehle
----------------------
````
crontab -e
#Minute Stunde Tag Monat Wochentag (0=Sonntag, 1=Montag)
10 0 * * * /home/pi/syncthing_backup.sh #täglich um 0:10
*/1 * * * * /opt/fhem/log/i2cwatchdog.sh #minütlich
````

Scripte schreiben
-----------------
Beispiel eines Script das Dateien in einem Ordner sichert.
````
nano syncthing_backup.sh
#!/bin/sh
sudo tar -cvzf /media/hdd2tb/Thomas/Projekte/RaspberryPi/Eigene\ Dateien/syncthing_config.tar.gz ~/.config/syncthing/
````

Netzwerk-Konfiguration
----------------------
Hardware prüfen
> ifconfig -a 		

Übersicht der vorhandenen WLAN
> sudo iwlist wlan0 scan  
>sudo iwlist wlan0 scan | egrep "(ESSID|IEEE)" #mit Filter  
	
WLAN de-/aktivieren
> sudo ifconfig wlan0 down  
> sudo ifconfig wlan0 up  

I2C - Bus
---------
Auslesen der am Bus hängenden I2C-Module (Bus1)
> i2cdetect -y 1

Setzen eines Ausgangsmodul mit Adresse 20 auf Wert 00000000
>i2cset -y 1 0x20 0x00  

Setzen eines Ausgangsmodul mit Adresse 20 auf Wert 11111111  
>i2cset -y 1 0x20 0xFF

Auslesen eines Eingangsmodul mit Adresse 20
>i2cget -y 1 0x20

Abfragen der aktuellen Bus-Geschwindigkeit
> sudo cat /sys/module/i2c_bcm2708/parameters/baudrate

Ändern der geschwindigkeit
> sudo nano /boot/config.txt
* dtparam=i2c_arm=on
* dtparam=i2c1_baudrate=32000`

Screen
------
Ausführen von länger laufenden Befehlen, ohne das das SSH Terminal offen bleiben muss

Starten des Dienstes
> screen

Starten der lang laufenden Befehle

Trennen der Sitzung, ohne die Befehle zu beenden (Detatch)
> [Strg]+A D

später wieder eine neue SSH Sitzung starten und die Screen Sitzung wieder aktivieren
> screen -r

Auflisten der Namen aller laufenden Screen-Sitzungen:	
> screen -ls 