OwnCloud
========

OwnCloud ist ein NAS System um Dateien auf mehreren Systemen synchron zu halten. 
Alternativen sind [Syncthing](Syncthing.md) und [Seafile](Seafile.md).
Achtung: Die Anleitung ist schon älter, evtl. hat sich der Installationsprozess vereinfacht/geändert!

Benutzer wächseln auf root
> sudo -s 
> apt-get update && apt-get dist-upgrade
echo 'deb http://download.opensuse.org/repositories/isv:ownCloud:community/Debian_7.0/ /' >> /etc/apt/sources.list.d/owncloud.list  
> wget http://download.opensuse.org/repositories/isv:ownCloud:community/Debian_7.0/Release.key && apt-key add - < Release.key  
> apt-get update && apt-get install owncloud mc -y

Passwort für MySQL festlegen, dann mysql starten
> mysql -uroot -p

`CREATE USER 'owncloud'@'localhost' IDENTIFIED BY 'GeHeIm';`
`CREATE DATABASE IF NOT EXISTS owncloud;`
`GRANT ALL PRIVILEGES ON owncloud.* TO 'owncloud'@'localhost' IDENTIFIED BY 'GeHeIm';`
`quit`

Bearbeiten des Webdienstes Apache
> nano /etc/php5/apache2/php.ini
* upload_max_filesize=4G
* post_max_size = 4G
* output_buffering = 4096
* a2enmod ssl 

SSL Zertifikat erstellen
> mkdir -p /etc/apache2/ssl
> openssl req -newkey rsa:4096 -sha512 -x509 -days 365 -nodes -keyout /etc/apache2/ssl/owncloud.key -out /etc/apache2/ssl/owncloud.crt
* 1 Jahr gülltig, kein Passwort notwendig
* Country: DE
* State: HESSEN
* Locality: IMMENHAUSEN
* Organization: Familie Ramm
* Organizational: .
* Common Name: [Rechnername]
* Mail: [Mailadresse]@thomas-ramm.de

> cd /etc/apache2/sites-available/  
> cp default-ssl owncloud

Bearbeiten der Konfig
> nano owncloud
* unter der Zeile "ServerAdmin" die Zeile "ServerName [Rechnername]]" einfügen
* SSLCertificateFile    /etc/apache2/ssl/owncloud.crt
* SSLCertificateKeyFile /etc/apache2/ssl/owncloud.key
* vor den letzten beiden Zeilen einfügen:
````
<Directory /var/www/owncloud> 
Options Indexes FollowSymLinks MultiViews 
AllowOverride All 
Order allow,deny 
Allow from all 
Satisfy Any 
</Directory>
````

> nano /etc/network/interfaces
````
#iface eth0 inet dhcp
iface eth0 inet static
address 192.168.178.111
netmask 255.255.255.0
gateway 192.168.178.1
````

> /etc/init.d/networking restart  
> a2enmod dav_fs && a2enmod rewrite && a2enmod headers  
> service apache2 restart

im Browser auf die OwnCloud Seite wechseln: 
> http://192.168.178.111/owncloud/