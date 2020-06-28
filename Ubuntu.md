<!-- vscode-markdown-toc -->
* 1. [Erster Login](#ErsterLogin)
* 2. [Nützliche Ubuntu Befehle](#NtzlicheUbuntuBefehle)
* 3. [Paket-Management](#Paket-Management)
* 4. [FHEM](#FHEM)
* 5. [Google "FHEM Connect"](#GoogleFHEMConnect)
	* 5.1. [auf der Konsole](#aufderKonsole)
	* 5.2. [Konfiguration in FHEM](#KonfigurationinFHEM)
	* 5.3. [Konfiguration in Google Home App](#KonfigurationinGoogleHomeApp)
* 6. [Telegram Bot](#TelegramBot)
	* 6.1. [Konfiguration in Telegram App](#KonfigurationinTelegramApp)
	* 6.2. [Konfiguration in FHEM](#KonfigurationinFHEM-1)

<!-- vscode-markdown-toc-config
	numbering=true
	autoSave=true
	/vscode-markdown-toc-config -->
<!-- /vscode-markdown-toc -->
##  1. <a name='ErsterLogin'></a>Erster Login
Erster login mit Benutzer ubuntu, passwort ubuntu. Beim ersten Login wirst du aufgefordert das Passwort zu ändern, danach trennt sich die SSH Sitzung.

Tastaturlayout und Zeitzone DE
> sudo dpkg-reconfigure keyboard-configuration
> sudo timedatectl set-timezone Europe/Berlin

Rechnername ändern
> sudo vim /etc/hostname

##  2. <a name='NtzlicheUbuntuBefehle'></a>Nützliche Ubuntu Befehle
Eigene IP anzeigen
> ip addr show

##  3. <a name='Paket-Management'></a>Paket-Management
Pakete installieren (NodeJS und NPM)
> sudo apt update  
> sudo apt full-upgrade  
> sudo apt autoremove  
> sudo apt install nodejs npm  

##  4. <a name='FHEM'></a>FHEM

siehe dazu [Fhem.md]

##  5. <a name='GoogleFHEMConnect'></a>Google "FHEM Connect"


###  5.1. <a name='aufderKonsole'></a>auf der Konsole
> sudo npm install -g gassistant-fhem --unsafe-perm


###  5.2. <a name='KonfigurationinFHEM'></a>Konfiguration in FHEM
> define gassistant gassistant

warten bis das Reading gassistantFHEM.loginURL erscheint. Auf den dort erschienenen Link klicken und mit dem Google Konto anmelden.
Es erscheint nun ein Autorisierungscode diesen in FHEM eintragen.
>set gassistant authcode=[TOKEN_GGGGGGGGGGG]

###  5.3. <a name='KonfigurationinGoogleHomeApp'></a>Konfiguration in Google Home App
+ auswählen, Gerät einrichten, "Du hast bereits Geräte eingerichtet?" auswählen, FHEM Connect auswählen und wieder einloggen (Empfehlung: Login with Google). Noch ein paar Sekunden warten, danach sollte ein Testlight in der Home App steuerbar sein, welches in FHEM im Raum GoogleAssistant zu finden ist.

##  6. <a name='TelegramBot'></a>Telegram Bot

###  6.1. <a name='KonfigurationinTelegramApp'></a>Konfiguration in Telegram App
Erstelle ein Account bei Telegram (falls noch nicht vorhanden).
Suche dann nach einem Kontakt namens @BotFather um einen eigenen Bot zu erstellen, der dir später die Nachrichten schickt.

/start
/newbot
fhemBot
username: [NameDesBot]
t.me/[NameDesBot]
token to access the HTTP API: [TOKEN_XXXXXXXXXXXXXXX]

gib nun bei den Kontakten den username des neu erstellten Bot ein und "sprich" mit ihm:

z.B. Ändern des Passwort:
/password [geheim]

###  6.2. <a name='KonfigurationinFHEM-1'></a>Konfiguration in FHEM
> define myTelegramBot TelegramBot [TOKEN_XXXXXXXXXXXXXXX]
> attr myTelegramBot defaultPeer [Kontaktname]  
> attr myTelegramBot pollingTimeout 10

Nun von Telegram aus eine Nachricht an den Bot schicken, erst danach kann FHEM Nachrichten an den Bot senden. Alternativ den Kontakt in FHEM manuell eintragen
> setstate myTelegramBot 2020-06-23 00:00:00 Contacts [KONTAKTID]:[KONTAKTNAME]:

Neustarts??
> sudo nano /etc/systemd/system/fhem.service
Type=simple
> systemctl daemon-reload
> sudo systemctl status fhem
> 