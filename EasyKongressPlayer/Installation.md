# PC

## Betriebssystem auf SD Karte installieren
herunterladen und kopieren des Image auf die SD Karte:
*	[Raspberry Pi Imager](https://downloads.raspberrypi.org/imager/imager_latest.exe)
* - Betriebssystem = Media Player OS -> OSMC -> OSMC (Pi2/3)
* - SD-Karte auswhälen
* - Schreiben (Sicherheitsabfrage "Alle Daten werden gelöscht" mit ja bestätigen)

SD Karte in den Pi einlegen und mit Netzwerkkabel und Stromversorgung verbinden.
Nach kurzer Zeit ist der Pi gestartet und steht euch zur Verfügung.

Als nächstes kopieren wir die Medien auf den Pi, da einige Skin-Einstellungen erst vorgenommen werden können, wenn die Mediendatenbank von OSMC erstellt wurde.

## Medien kopieren
Ich benutze zum kopieren das Programm [WinSCP](https://winscp.net/eng/download.php).
> Übertragunsprotokoll: SFTP<BR/>
> Serveradresse: Die IP Adresse des Pi (192.168.xxx.xxx)<BR/>
> Portnummer: 22<BR/>
> Benutzername: osmc<BR/>
> Passwort: osmc<BR/>

Die Warnung das dies ein unbekanntes, unsicheres Ziel ist einfach mit Ok bestätigen. 

in WinScp benutze ich immer die zwei Fenster-Ansicht. Links seht ihr den Lokalen PC, rechts den Pi

auf dem Pi navigiert ihr in den Ordner /home/osmc/Movies/ und kopiert den kompletten Medienordner. Eine Anleitung wie die Videos für OSMC aufbereitet werden müssen findet ihr in dem extra Dokument [Medienbibliothek.md](Medienbibliothek.md)

# OSMC

die nächsten Einstellungen werden direkt auf der Oberfläche von OSMC vorgenommen. Ihr könnt dafür entweder eine USB-Tastatur anschließen, oder den RPI direkt an den TV anschließen und per Fernbedienung alle Einstellungen vornehmen. Bei meinen TV hat die Bedienung immer sofort funktioniert, evtl. müssen aber noch Einstellungen vorgenommen werden, wenn es nicht sofort funktioniert (aktivieren von HDMI CEC, smartLink oder ähnlichem)

## Installing files

 beim ersten Start werden noch einige Einstellungen im OS angepasst, das dauert 2-4 Minuten, danach wird der Pi neu gestartet. Eingaben werden in dieser Zeit nicht gemacht.

## Einrichtungs-Assistent

* Welcome = German -> Yes
* Zeitzone = Europa -> Berlin
* Aktueller Name = superPi -> Akzeptieren
* SSH = (ist bereits aktiviert) -> Akzeptieren
* Lizenz -> Weiter
* Look + Feel -> The OSMC Skin
* Registrierung -> (Newsletter?) -> Nein danke
* Schließen

Du bist nun auf der "leeren" Oberfläche von OSMC gelandet. 
Einige Einstellungen sollen aber noch geändert werden.
(Mit Esc kommst du zurück zum übergeordneten Menü)

## Weitere Einstellungen
> Einstellungen -> Player -> Videos -> Nächstes Video automatisch wiedergeben

"Filme" auswählen und bestätigen. Das Filme aktiviert sind, sieht man daran das die Schrift nun hervorgehoben wird. Speichern mit OK. Du kommst zurück auf die Player Einstellungen, hier sollte hinter dem Menüpunkt "Nächstes Video automatisch wiedergeben" nun Filme stehen.

> Einstellungen -> Medien -> Allgemein 
* Symbol zum übergeordneten Ordner anzeigen = OFF
* Dateierweiterungen anzeigen = OFF
* "Quelle hinzufügen" anzeigen = OFF

> Einstellungen -> Programme
* Hier die beiden embuary Programme auswhälen (mit den Tasten dorthin gehen, sie werden dann etwas größer angezeigt) und das Kontextmenü aufrufen (Tastatur = C). Dann das Programm deaktivieren.
Es bleiben dann noch 2 Programme übrig, die Lupe und OSMC

## Medienbibliothek 
Zuerst sollen die kopiereten Dateien in OSMC auch angezeigt werden. Dazu können Ordner auf dem Pi der Medienbibliothek hinzugefügt werden.
> Videos -> Dateien -> Videos hinzufügen ... 
* Suchen -> Home-Ordner -> Movies

mit OK bestätigen. Du kommst nun zurück in den "Videos hinzufügen"-Dialog. Dort sind jetzt die Felder Pfad und Name gefüllt und du kannst den Dialog bestätigen mit 
* OK

Es wird nun ein weiterer Dialog mit den Parametern für diesen Ordner angezeigt. 
* Dieser Ordner beinhaltet -> Filme
* Bitte Informationsquelle auswählen -> Local information only
Diesen Dialog ebenfalls bestätigen mit
* OK
> Sollen die Informationen für alle Einträge in diesem Pfad aktualisiert werden? -> Ja

Wenn du jetzt in dei "normale" Oberfläche gehst, siehst du einen Menüeintrag "Filme". Dort kannst du alle kopierten Filme sehen, mit den zugewiesenen Grafiken, sowie den korrekten Namen und dem zugewiesenen Genre.

## Skins
Das komplette Look & Feel von OSMC kann sehr stark angepasst werden durch sogenannte Skins. OSMC wird mit 3 verschiedenen Skins ausgeliefert, für den Player wurde jedoch ein weiterer Skin aus dem Internet heruntergeladen und konfiguriert.
 Mein Favorit ist fTV. Die weitere Anleitung basiert darauf diesen Skin zu konfigurieren.
 Außerdem fand ich noch folgende Skins sehr gut in der Menüführung:
* Aeon Nox: SiLVO
* Mimic-LR
Für diese Skins gibt es keine Anleitung aber Fotos / Videos. Die Konfiguration ist außerdem recht ähnlich zu fTV.

### fTV installieren
> Einstellungen -> Benutzeroberfläche -> Skins -> Mehr ...

(Wenn du den Eintrag "Mehr" nicht hast, liegt das vermutlich daran, das der Pi keinen Zugang zum Internet hat...)
* fTV (Skin based on the Fire TV UI) auswählen

Da einige Einstellungen auf den vorhandenen Videos basieren, kannst du hier nur dann weiter machen, wenn die Videobibliothek bereits auf den Pi kopiert wurde.
### Skin konfigurieren...
> Einstellungen -> Benutzeroberfläche -> Skins -> Skin konfigurieren
* Anpassung des Hauptmenüs aktiveren (falls hier nichts passiert, dann nochmal zurück zum OSMC Skin wechseln und versuchen den Skin anzupassen. Wenn es dann dort funktioniert, dann den Skin wieder auf fTV wechseln)
  ->   (Für diese Funktion wird ein Addon benötigt. Installieren?) -> Ja
* Customise Home Menu (das laden dauert etwas)

Hier werden dir nun in der linken Liste alle Menüpunkte der Oberfläche angezeigt. Der oberste Eintrag ist bereits ausgewählt "Suchen". Alle ungewollten Einträge nun durch den Menüpunkt "Löschen" entfernen:
* Suchen
* Watchlist
* Serien
* Favoriten
* Videos
* Musik
* Spiele
* Apps
* Photos
* Wetter
* Einstellungen

Du hast nun nur noch 2 Menüpunkte übrig: Filme und Verlassen.
Wähle den Eintrag "Filme" aus klicke dann 2* auf den Menüpunkt "Hinzufügen".
Das Hauptmenü hat nun folgende Einträge:

    Filme
    \<Kein>
    \<Kein>
    Verlassen

Die zwei leeren Menüeinträge werden nun umprogrammiert in "Kongress" und "Monatssendung"

Der Trick für die einzelnen Menüeinträge ist es, das man die Liste der Filme hinter einem Eintrag filtern kann. Ich benutze dafür die Eigenschaft "Genre" die in der Medienbibliothek gepflegt wurde. Hier können natürlich noch beliebig weitere Kategorien gepflegt werden und dafür dann individuelle Menüeineträge erzeugt werden. Das Schema ist dann immer das gleiche.

Beginnen wir mit dem oberen Menüeintrag, in dem die Kongress-Videos erscheinen sollen. Wähle den Eintrag links in der Liste aus.
> Einen Eintrag für das Menü auswählen -> Videobibliothek -> Filme -> Genre -> Kongress

hiermit hast du Eingestellt, welche Videos angezeigt werden wenn man den Menüpunkt bestätigt.
Als nächstes sollen die Videoeinträge gewählt werden, die angezeigt werden wenn man den Menüpunkt auswählt. Dazu können bis zu 8 Zeilen konfiguriert werden. Die Einträge werden durch ein Widget erzeugt.

> Select Widget Group -> Widget Group 1

> Customise Widget Group

Es werden dir nun die 8 Einträge angezeigt, die auf der Hauptoberlfäche erscheinen. Wenn in der Spalte "Widget Action" der Eintrag "Choose Shortcut" erscheint, bedeutet dies das dieser Eintrag deaktiviert ist. Wir wählen jetzt für die 3 Kongresstage die ersten 3 Einträge und deaktivieren den vierten Eintrag. Der Ablauf ist fast immer identisch.
Wähle die Zeile #1 und dort die Spalte Widget Action (der Eintrag wird Farblich hervorgehoben. Er beginnt mit ActivateWindow) und Starte den einstellungsdialog. Der Dialog fragt nach dem anzuzeigenden Filter.
> Videobibliothek -> Filme -> Genre -> Freitag

Der Dialog wird geschlossen und der erste Eintrag sollte nun so aussehen:
#1    Freitag    ActivateWindow(Videos,videodb://movies/genres/2/,return)    Poster

(Die Zahl kann dabei abweichen, je nachdem in welcher Reihenfolge die Informationen beim kopieren der Dateien importiert wurden)

Das gleiche machen wir nun mit den nächsten 2 Einträgen für Samstag und Sonntag

Beim Eintrag #4 wählen wir als Aktion einfach "Keins"

Der fertige Dialog sollte nun in etwa so aussehen:

Widget | Widget Name | Widget Action | View Type
------ | ----------- | ------------- | ---------
#1     | Freitag     | ActivateWindow(Videos,videodb://movies/genres/2/,return) | Poster
#2     | Samstag     | ActivateWindow(Videos,videodb://movies/genres/3/,return) | Poster
#3     | Sonntag     | ActivateWindow(Videos,videodb://movies/genres/4/,return) | Poster
#4     | Enter Name  | Choose Shortcut  | Poster
#5     | Enter Name  | Choose Shortcut  | Poster
#6     | Enter Name  | Choose Shortcut  | Poster
#7     | Enter Name  | Choose Shortcut  | Poster
#8     | Enter Name  | Choose Shortcut  | Poster

Den Dialog mit OK speichern.

Nun den zweiten Menüeintrag für die Monatssendung einrichten.

Markieren des Eintrag \<Kein>
> Einen Eintrag für das Menü auswählen -> Videobibliothek -> Filme -> Genre -> Kongress

> Select Widget Group -> Widget Group 2

> Customise Widget Group

Widget | Widget Name   | Widget Action    | View Type
------ | ------------- | ---------------- | ---------
#1     | Monatssendung | ActivateWindow(Videos,videodb://movies/genres/5/,return) | Poster
#2     | Enter Name    | Choose Shortcut  | Poster
#3     | Enter Name    | Choose Shortcut  | Poster
#4     | Enter Name    | Choose Shortcut  | Poster
#5     | Enter Name    | Choose Shortcut  | Poster
#6     | Enter Name    | Choose Shortcut  | Poster
#7     | Enter Name    | Choose Shortcut  | Poster
#8     | Enter Name    | Choose Shortcut  | Poster

Zurück in der Übersicht der Menüeinträge werden alle unsere Einstellungen mit einem Klick auf OK gespeichert und der Dialog verlassen.
Wenn du durch mehrmaliges Drücken auf "Zurück" auf der Startseite angekommen ist, kann es noc ein paar Sekunden dauern bis die neuen Einträge im Menü erscheinen.

Sollten nochmal Änderungen an der Oberfläche notwendig sein, findest du das Einstellungen Menü ab sofort unter "Verlassen" -> "Einstellungen". Du kannst den Pi jetzt auch vom Internet trennen. Die einzigen 2 Kabel die ab jetzt noch für den Betrieb benötigt werden, ist das HDMI Kabel für den TV und das Stromkabel.

Zurück zu [Übersicht](README.md) > [Einkaufsliste](Einkaufsliste.md)> [ Videobearbeitung](Medienbibliothek.md)