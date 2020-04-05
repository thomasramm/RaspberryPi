HDD
===

Anbinden einer Festplatte per USB, die beim Booten ins Dateisystem eingebunden wird, mit Windows Dateisystem


Dateisystem erweiterungen installieren
> sudo apt-get -y install ntfs-3g hfsutils hfsprogs exfat-fuse  

Ordner anlegen in dem der Inhalt der Festplatte eingebunden wird
> sudo mkdir /media/hdd2tb  

jetzt USB laufwerk einstecken, an der folgenden ausgabe die erste+letzte Spalte merken.
Abhängig vom Dateisystem (Spalte 2) mounten, wobei die letzen 2 Parameter /sda = Spalte 1 und der Pfad gleich dem Parameter in Zeile 3 entsprechen muss.
> sudo blkid -o list -w /dev/null

Beispiele:
````
FAT32	> sudo mount -t vfat -o utf8,uid=pi,gid=pi,noatime /dev/sda1 /media/hdd2tb
NTFS	> sudo mount -t ntfs-3g -o utf8,uid=pi,gid=pi,noatime /dev/sda1 /media/hdd2tb
HFS+	> sudo mount -t hfsplus -o utf8,uid=pi,gid=pi,noatime /dev/sda1 /media/hdd2tb
exFAT	> sudo mount -t exfat -o utf8,uid=pi,gid=pi,noatime /dev/sda1 /media/hdd2tb
ext4	> sudo mount -t ext4 -o defaults /dev/sda1 /media/hdd2tb
````

entfernen des Speichers
> sudo umount /media/usbstick

automatisches Mounten bei Systemstart duch bearbeiten der fstab Datei. Hier eine Zeile für die Festplatte anhängen, wobei UUID der letzten Spalte der vorherigen Ausgabe entspricht.
> sudo nano /etc/fstab
````
FAT32	> UUID=3241-40CE /media/usbstick/ vfat utf8,uid=pi,gid=pi,noatime 0
NTFS	> UUID=3241-40CE /media/usbstick/ ntfs-3g utf8,uid=pi,gid=pi,noatime 0
HFS+	> UUID=3241-40CE /media/usbstick/ hfsplus utf8,uid=pi,gid=pi,noatime 0
exFAT	> UUID=3241-40CE /media/usbstick/ exfat utf8,uid=pi,gid=pi,noatime 0
ext4	> UUID=3241-40CE /media/usbstick/ ext4 defaults 0
````

Bei mir funktioniert:
````
UUID=1885-77DA /media/Seagate\040Bac/ exfat utf8,uid=osmc,gid=osmc,noatime 0
UUID=c61d50e3-bfac-44d8-b7fb-5c9d10c8d2ce /media/usbHDD1/ ext4 defaults 0
````


BACKUP AUF EXTERNE FESTPLATTE
-----------------------------

HDD im Dateisystem aktivieren
> sudo mount -t ntfs-3g -o utf8,uid=pi,gid=pi,noatime /dev/sdb1 /media/usbHDD2
> sudo mount -t ext4 /dev/sda1 /media/usbHDD2 

Starten der Terminal-Sitzung
> screen

Synchronisieren der Dateien lokal mit der eingebundenen HDD
> sudo rsync -av --progress --exclude=/lost+found/ /media/hdd2tb/ /media/usbHDD2/

Evtl. Sitzung trennen und Steuerpc herunterfahren, falls das ganze länger dauert
>[Strg]+A D 

SSH beenden und später wieder neu starten
> screen -r 

Wenn alle Backups fertig sind, dann Festplatte sicher entfernen 
> sudo umount /media/hdd2tb
