In OSMC wird zu jedem Video eine weitere Datei abgelegt, mit den Informationen zu diesem Video, wie z.B. Name, Erscheinungsjahr, Studio, Sprache sowie mit diversen Postern Bannern und Grafiken.

Ich benutze hiervon nur einen ganz kleinen Teil der Möglichkeiten, nämlich nur das, was ich benötige um eine Minimalistische Oberfläche anzeigen zu können. Die Infos die zu jedem Video gespeichert werden sollen sind:
* Titel = Der Name der angezeigt werden soll
* Sortiername = Hierüber wird die Sortierung geändert, so dass z.B. Vormittag vor Nachmittag einsortiert wird
* Genre = Für die spätere Filterung / Einsortierung in die Menüpunkte. Dem Menüpunkt wird z.B. gesagt: Liste hier alle Filme auf, die vom Genre "Kongress" sind. Die Namen der Genre sind an sich erstmal egal, versuche aber möglichst die Namen zu benutzen, die du später in der Oberfläche sehen möchtest.
* Poster = Die Grafik die angezeigt werden soll, wenn die Oberfläche ein Poster anzeigen will
* FanArt = Eine Hintergrundgrafik die angezeigt wird, wenn ein Film ausgewählt ist. Für Poster und Fanart benutze ich die gleiche Grafik.

Alle Dateien werden in einem einzigen Ordner abgelegt. Für ein Video sind das demnach 4 Dateien. Hier ein Beispiel, wobei der gewählte Dateiname egal ist, die Dateien müssen nur alle mit den gleichen Namen haben, bzw. damit beginnen:

> CO-r21_X_01_r480P.mp4 <BR>
> CO-r21_X_01_r480P.nfo <BR>
> CO-r21_X_01_r480P-fanart.jpg <BR>
> CO-r21_X_01_r480P-poster.jpg <BR>

Du kannst die Informationen entweder von Hand pflegen indem du die .nfo Datei mit einem Editor deiner Wahl bearbeitest und die Grafiken kopierst / umbenennst, oder ein Tool dafür benutzen. Ich beschreibe hier beide Wege.

# Manuell

## Die NFO Datei
Die NFO Datei ist eine xml Datei, die mit jedem Textprogramm bearbeitet werden kann. Windows bietet dir hierfür den "Editor" oder auch bekannt unter "notepad.exe" an.
~~~ xml
<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<movie>
    <title>Freitag Vormittag 1</title>
    <sorttitle>Kongress 01</sorttitle>
    <genre>Kongress</genre>
    <genre>Freitag</genre>
</movie>
~~~ 

Ihr seht, der Code ist recht einfach.
* Title = selbsterklärend
* Sorttitle = Damit alle Videos in der richtigen Reihenfolge dargestellt werden habe ich alle Videos für einen Kongress von 1 - 12 durchnummeriert. Solltest du evtl. mehrere Kongresse kopieren und in deiner Bibliothek einfügen, dann solltest du den Kongressnamen mit einfügen. Sortiertitel könnten demnach sein
  * Kongress 01, Kongress 02, Kongress 03
  * Kongress 2022-01, Kongress 2022-02, Kongress 2022-03 = Sortierung der Kongresse nach Jahr
  * Kongress 2022-Tag 1-Video 01, Kongress 2022-Tag 1-Video 01,Kongress 2022-Tag 1-Video 01
  * Kongresse 2022 - Kongress 01 - Video 01, Kongresse 2022 - Kongress 02 - Video 01 = Alle 3 Kongresse eines Jahres in chronologischer reihenfolge, deshalb wird zuerst nach dem Jahr sortiert, dann kommt die Kongress Nr und danach das Video des Kongress. Deiner Phantasie sind hier keine Grenzen gesetzt.
* Genre = Für die Filterung später können hier beliebige Kategorien eingetragen werden. Ein Video kann auch in mehreren Kategorien einsortiert werden. Ich benutze hier z.B. die Kategorie Kongress für den Hauptmenüeintrag "Kongress" und eine zweite Kategorie mit den Wochentagen für die Aufteilung der Videos in Zeilen. Du kannst deine Videos aber z.B. auch nach Typ aufteilen und anzeigen, wie Musik,Vorträge,Videos. Die Genre die ich benutze und auch in der Installationsanleitung benötigt werden sind:
  * Kongress
  * Monatssendung
  * Freitag (zusammen mit dem Genre Kongress)
  * Samstag (zusammen mit dem Genre Kongress)
  * Sonntag (zusammen mit dem Genre Kongress)

## Die Grafiken
Wo du die Grafiken herbekommst ist dir überlassen, du kannst z.B. auf deinem PC ein Video starten und dann einen Screenshot machen, oder die Vorschaugrafiken aus der Jw Library kopieren. Wichtig ist nur, das sie als .jpg Datei gespeichert werden.
Der Name muss dem Video entsprechen und dann den zusatz -fanart oder -poster enthalten. Ich habe für beide Bilder die gleiche Grafik benutzt.

# Hilfsprogramm
Ich benutze für die Pflege der Infomationen ein Hilfsprogramm zur Verwaltung der Bibliothek. Es gibt dafür verschiedene Tools, ich benutze das Tool [MediaElch](https://github.com/Komet/MediaElch/releases). Dies kann kostenlos heruntergeladen werden, ihr müsst das Archiv dann nur noch entpacken und die Datei MediaElch.exe starten

## MediaElch konfigurieren
Zuerst müssen ein paar allgemeine Einstellungen vorgenommen werden. Wählt dazu den Menüpunkt "Einstellungen" (links neben dem i)

> Global
* Bilder der Schauspieler herunterladen = Nein (Haken entfernen)
* Startbereich = Filme

Klickt auf "Hinzufügen" wählt den Ordner aus, in dem ihr eure Videos abgelegt habt.

* Typ = Filme
* Sep. Verzeichnisse = Nein (den Haken entfernen)
* Beim start neu laden = Ja (Haken setzen)

-> Einstellungen speichern

Ihr solltet nun im Hauptfenster die Liste aller heruntergeladenen Videos sehen. Link im Programm könnt ihr wechseln zwischen Filme, Musik, Fotos, etc. wir benutzen aber nur die Film-Bibliothek

## Filme bearbeiten

Wähle in der Liste der Videos das erste Video an. Es wird mit dem Namen angezeigt, wie die Datei im Ordner heißt, also z.B. CO-r21_X_01_r480P.mp4

Im Rechten Teil des Programms kannst du nun die gewünschten Einstellungen vornehmen:
> Information
* Titel = Freitag Vormittag 1 (Der Eintrag in der Liste wird sofort auf diesen Namen abgeändert)
* Titel für Sortierung = Kongress 01 (Die Einträge in der Liste werden sofort neu sortiert)
> Erweitert

Bei Genres musst du den Namen eingeben und mit Enter bestätigen. Das Genre wird dadurch erstellt und auch gleich für das Video gewählt. Gib hier ein
* Kongress
* Freitag

Bei zukünftigen Videos werden dir diese beiden Genre in Grau angezeigt. Möchtest du das Genre für ein weiteres Video nutzen, dann einfach anklicken. Zugeordnete Genre werden in Blau angezeigt.

Als letztes müssen noch die Bilder für das Video gewählt werden.
Klicke ganz rechts auf "Poster" und dann auf "Lokales Bild auswählen". Wiederhole den Schritt für "Fanart". Die anderen Grafiken werden nicht benötigt. 

Wenn du alle Filme entsprechend bearbeitet hast, klicke auf das Symbol mit den zwei Disketten für "Alle Speichern"

Du bist nun mit dem Programm fertig, in dem Ordner mit deinen Filmen sollte nun für jeden Film die .nfo Datei sowie die beiden Grafiken abgelegt sein. Du kannst mit der [Installation](Installation.md) fortfahren.

Zurück zu [Übersicht](README.md) > [Einkaufsliste](Einkaufsliste.md) | 
Weiter zu [Installation](Installation.md)
