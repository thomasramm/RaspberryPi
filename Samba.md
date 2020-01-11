 Samba - Dateifreigabe für Windows
==================================

installieren des Paket  
> sudo apt-get install samba samba-common-bin

Benutzer "pi" ein Passwort für Samba geben  
> sudo smbpasswd -a pi

Benutzer "pi" Leserechte auf den Ordner geben (z.B. den Zielordner von [Syncthing](Syncthing.md))
> sudo chown -R pi:pi /media/usbHDD

Beispielkonfigurationsdatei für Samba
-------------------------------------

> sudo nano /etc/samba/smb.conf
````
security = user

#[Name der Freigabe unter Windows]
path = /pfad/zum/Ordner/der/Freigegeben/ist
writeable = über samba Dateien löschen, hinzufügen, ändern
guest ok = ohne Anmeldung auf die Dateien zugreiffen können.

[Fotos]
path = /media/usbHDD/Fotos
writeable = yes
guest ok  = no

[Videos]
path = /media/usbHDD/Videos
writeable = yes
guest ok  = no

[Diashow]
path = /media/usbHDD/Diashow
writeable = yes
guest ok  = yes
````

Neustart von Samba nach jeder Änderung der Config-Datei
> sudo /etc/init.d/samba restart
