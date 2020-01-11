Seafile
=======

Seafile ist ein NAS System um Dateien auf mehreren Systemen synchron zu halten. 
Alternativen sind [Syncthing](Syncthing.md) und [OwnCloud](OwnCloud.md).
Achtung: Die Anleitung ist schon älter, evtl. hat sich der Installationsprozess vereinfacht/geändert!

Benötigte Pakete installieren
 > sudo apt-get install python2.7 python-setuptools python-simplejson python-imaging sqlite3 nginx php5 php5-fpm php-pear php5-common php5-mcrypt php5-mysql php5-cli php5-gd

Benutzer für den Dienst einrichten
> sudo adduser seafile --disabled-login
* Seafile,Enter,Enter,Enter,Enter,J

Wechseln zum Benutzer seafile
> sudo su - seafile  

Programm herunterladen
> mkdir seafile-server && cd seafile-server && wget https://bitbucket.org/haiwen/seafile/downloads/seafile-server_4.0.6_pi.tar.gz 

Entpacken
> tar -xvf seafile-server_4.0.6_pi.tar.gz && mkdir installed && mv seafile-server_4.0.6_pi.tar.gz ./installed && cd seafile-server-4.0.6

Konfiguration
--------------
> ./setup-seafile.sh
* server name:        piNas
* server ip/domain:   thomas-ramm.no-ip.org
* server port:        10001
* seafile data dir:   /home/seafile/seafile-server/seafile-data
* seafile port:       12001
* fileserver port:    8082

Seafile (Dienst) starten
 > ./seafile.sh start

Seafile (Oberfläche) starten
 > ./seahub.sh start 8000

Seafile beenden
 > exit

Datenverzeichnis verschieben, z.B. auf externe Festplatte hdd)
 > cd /home/seafile/seafile-server/  
 > sudo ./seafile-server-latest/seafile.sh stop  
 > mv /home/seafile/seafile-server/seafile-data /media/hdd/  
 > ln -s /media/hdd/seafile-data/ /home/seafile/seafile-server/seafile-data

 Autostart
-> script anlegen, siehe http://manual.seafile.com/deploy/start_seafile_at_system_bootup.html  
> sudo update-rc.d seafile defaults
