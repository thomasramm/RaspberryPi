I2C
===

Allgemeine Befehle
-------------------
> i2cdetect -y 1  
> i2cget -y 0x20  

=== 16 Bit Chipsatz ????? ===

Modul mit Adresse 20 als Ausgang setzen (Block A + B), input ist der Default-Wert
>i2cset -y 1 0x20 0x01 0x00  
>i2cset -y 1 0x20 0x00 0x00

Bus 2, Pin B, 15=Pin 15 mit 100k Pillup setzen, alle anderen aus (wichtig, damit an/aus korrekt erkannt wird!)
> sudo i2cset -y 1 0x21 0x0D 0x40 

Pin B, byte lesen. Pin15=1 wenn aus, Pin15=0 wenn gedrückt
> sudo i2cget -y 1 0x21 0x13    

Pin B, Polarität ändern, 1 = umkehren
> sudo i2cset -y 1 0x21 0x03 0x40

Pin B, byte lesen. Pin15=1 wenn gedrückt, Pin15=0 wenn aus
> sudo i2cget -y 1 0x21 0x13      

die einzelnen PIN anmachen
> i2cset -y 1 0x20 0x15 0x01  
> i2cset -y 1 0x20 0x15 0x02  
> i2cset -y 1 0x20 0x15 0x04  
> i2cset -y 1 0x20 0x15 0x08  
> i2cset -y 1 0x20 0x15 0x20  
> i2cset -y 1 0x20 0x15 0x40  
> i2cset -y 1 0x20 0x15 0x80  


Alle PIN auf Ausgang setzen
> i2cset -y 1 0x24 0x00 0x00  
> i2cset -y 1 0x24 0x01 0x00

Alle Ausgänge ON
> i2cset -y 1 0x24 0x14 0xff  
> i2cset -y 1 0x24 0x15 0xff  

Jetzt im wechsel ON/OFF
> i2cset -y 1 0x24 0x14 0xaa  
> i2cset -y 1 0x24 0x15 0xaa  

Gegenrichtung
> i2cset -y 1 0x24 0x14 0x55  
> i2cset -y 1 0x24 0x15 0x55  

Watchdog
---------

Bei zu großen Störungen setzen sich die Chip auf 0 zurück, dann müssen die Ausgänge wieder als solche definiert werden. Deshalb läuft ein CronJob der 1x/Minute die Ausgänge prüft.

> sudo crontab -e
* **/1 * * * * /opt/fhem/log/i2cwatchdog.sh

