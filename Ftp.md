FTP Server
==========

Paket installieren 
> sudo apt-get install proftpd-basic

Konfigurationsdatei1 bearbeiten
> sudo nano /etc/proftpd/proftpd.conf  
* UseIPv6: off  
* ServerName: "Hauszentrale"

Konfigurationsdatei2 bearbeiten
> sudo nano /etc/proftpd/conf.d/proftp-custom.conf
````
# Ftp user doesn't need a valid shell
<Global>
    RequireValidShell off
</Global>

# Default directory is ftpusers home
DefaultRoot ~ ftpuser

# Limit login to the ftpuser group
<Limit LOGIN>
    DenyGroup !ftpuser
</Limit>
````

Zugriff nur auf das Verzeichnis /var/ftp/upload erlauben
> sudo adduser ftpuser --shell /bin/false --home /var/ftp/upload  

Dienst neu starten:
> sudo service proftpd restart