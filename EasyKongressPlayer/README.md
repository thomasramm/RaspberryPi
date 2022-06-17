# KongressPlayer

Ich wollte für Ältere Personen, die technisch nicht versiert sind eine einfache Möglichkeit schaffen sich den Kongress anzuschauen. Eine Einfache Lösung war es, das Programm auf einen USB Stick zu kopieren, diesen in den TV zu stecken und über das TV Menü die Videos abzuspielen.
Leider waren einige auch mit dieser - für technisch versiertere - sehr einfachen Lösung überfordert. Etwas einfacheres musste her.
Vor einigen Jahren hatte ich mal lür einen Messestand und für eine Museumsausstellung in der Dokumentahalle die Herausforderung das den ganzen Tag über verschiedene Videos in einer Endlosschleife abgespielt werden sollten, das ganze sollte Wartungsfrei und einfach zu bedienen sein. Meine damalige Lösung waren RaspberryPi die auf der Rückseite der TV Bildschirme befestigt waren (VESA Halterung).
Installiert hatte ich OSMC ein Kodi-OS. Beim Booten wurde sofort eine Playlist mit den Videos in einer Endlosschleife abgespielt.

## Herausforderung
Für den KongressPlayer kam mir die Idee es genauso zu machen, hier gibt es aber weitere Herausforderungen:
* Niemand in der Zielgruppe schaut alles auf einmal an. Die Videos müssen also gestoppt und später wieder gestartet werden können.
* Der RasPi hat keinen An/Aus Schalter, das abziehen vom Strom könnte das OS beschädigen. Bei den Ausstellungs TV ist das jedoch nicht einmal passiert, so das dieser Punkt vernachlässigt werden kann.
* Die Bedienung muß so einfach sein, das es ohne Einweisung klappt (wahrscheinlich hat die Zielgruppe die Einweisung längst wieder vergessen wenn sie eine Woche später noch was schauen will)

## Lösung
Meine Lösung war deshalb:
* Installieren von OSMC (Kodi) als Abspielplattform
* Bedienung über die TV Fernbedienung (HDMI CEC)
* Optional: Bedienung über zwei Taster: Play/Pause + Nächstes Video, die Taster können am GPIO des Raspi angeschlossen werden und dann Scripte aktivieren, die die Befehle in Kodi umsetzen. Das habe ich aber bisher noch nicht umgesetzt.

Bei der Oberfläche habe ich 3 Favoriten mit ihren eigenen Vor- und Nachteilen:

### fTV (Favorit)
[Video](KongressPlayer_fTV.mp4)
Pro
* Hier gibt es in der Bedienung gefühlt nur 1 Ebene
* Es gibt keine "Sackgassen" die über "Zurück" beendet werden müssten, man wechselt die Ebenen durch drücken auf Links / Rechts.
* Die Anzeige ist sehr minimalistisch
Contra
* Gesehene / Neue Filme werden nicht hervorgehoben
* Bei der Auswahl eines Videos werden unter dem Video weitere Menüpunkte angezeigt, die leider nicht ausgeblendet werden können

### Mimic-LR
[Video](KongressPlayer_MimicLR.mp4)
Pro
* Wird nur das Hauptmenü benutzt, Übersichtliche Darstellung aller Videos
* Darstellung des Video-Status "Laufend, Gesehen"
Contra
* Zwei Video-Ebenen (Hauptseite vs. Klick auf die Kategorie)
* Von der zweiten Ebene auf die Hauptseite kommt man nur über eine Zusätzliche Taste "Zurück"
* 

### ArcticZephyr
[Video](KongressPlayer_ArcticZephyr.mp4)
Pro
* Hintergrundbild je Kategorie einstellbar
* Beste Darstellung des Video-Status "Neu, Laufend, Gesehen"
Contra
* Zwei Video-Ebenen (Hauptseite vs. Klick auf die Kategorie)
* Von der zweiten Ebene auf die Hauptseite kommt man nur über eine Zusätzliche Taste "Zurück"

## Anleitung
In diesem Projekt habe ich (hoffentlich) alle Schritte aufgezeichnet die Notwendig sind um dieses Projekt nachzubauen.
Der Aufbau besteht aus drei Teilen:

1. [Notwendige Hard- und Software](Einkaufsliste.md)

2. [Vorbereiten der Videos](Medienbibliothek.md)

   Dieser Schritt ist nach jedem Kongress notwendig.

3. [Installation und Einrichtung des Betriebssystem](Installation.md), inkl. Anpassen der Oberfläche.

   Die Installation und Einrichtung ist natürlich nur einmalig notwendig, lediglich das Kopieren neuer Daten muss per Hand erfolgen.

