Syncthing
=========

Dienst zum sync. der Dateien zwischen diversen PC's Handy's etc. 
Programm gibt es für Windows, Linux, Android


HDD einbinden siehe HDD.md

Einbinden der Debian Quellen in die Liste erlaubter Paketquellen
> curl -s https://syncthing.net/release-key.txt | apt-key add -
echo "deb http://apt.syncthing.net/ syncthing release" | tee -a /etc/apt/sources.list.d/syncthing-release.list

Update der Paketlisten & installieren & starten. Dabei wird ein Key generiert.
> apt-get update && apt-get install syncthing && syncthing

Programm wieder beenden mit [Strg]+[C]

Freigabe der webOberfläche von allen anderen PC (aktuelle Einstellung ist nur vom PI aus, der bei mir aber keine Oberfläche hat)
> nano ~/.config/syncthing/config.xml  
ersetze `<address>127.0.0.1:8384</address>`  
durch   `<address>0.0.0.0:8384</address>`  

den PI neu starten
> sudo reboot now

Zusatz
------
bin mir nicht sicher ob das überhaupt noch notwendig ist: installieren des Quellcode und verschieben der Service-Datei nach systemd

````
apt-get install git
git clone https://github.com/syncthing/syncthing
cd syncthing/etc/linux-systemd/system
sudo mv syncthing@.service /etc/systemd/system/syncthing@.service

sudo systemctl enable syncthing@pi.service
sudo systemctl start syncthing@pi.service
````

Dateifreigabe im Netz siehe Samba.md
