Mailclient
==========
versenden von Mails von der Komandozeile aus, dadurch integration von Mailversand in scripte möglich.

Programm installieren
> sudo apt-get update && sudo apt-get install ssmtp mailutils  

Konfigurationsdatei bearbeiten (am Beispiel der Domain thomas-ramm.de)
> sudo nano /etc/ssmtp/ssmtp.conf
````
root=[Absender@thomas-ramm.de]
mailhub=[mail.thomas-ramm.de:587]
hostname=[pi.thomas-ramm.de]
FromLineOverride=NO
AuthUser=[Absender@thomas-ramm.de]
AuthPass=[PASSWORT]
UseSTARTTLS=YES
AuthMethod=LOGIN
rewriteDomain=thomas-ramm.de
````

Testmail senden:
> echo "Test Inhalt text" | mail -s "Test Betreff Mail" mailempfänger@maildienst.de
