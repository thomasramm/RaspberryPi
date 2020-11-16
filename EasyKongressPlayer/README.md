KongressPlayer
==============

Ich wollte für Ältere Personen, die technisch nicht versiert sind eine einfache Möglichkeit schaffen sich den Kongress anzuschauen. Eine Einfache Lösung war es, das Programm auf einen USB Stick zu kopieren, diesen in den TV zu stecken und über das TV Menü die Videos abzuspielen.
Leider waren einige auch mit dieser - für technisch versiertere - sehr einfachen Lösung überfordert. Etwas einfacheres musste her.
Vor einigen Jahren hatte ich mal lür einen Messestand und für eine Museumsausstellung in der Dokumentahalle die Herausforderung das den ganzen Tag über verschiedene Videos in einer Endlosschleife abgespielt werden sollten, das ganze sollte Wartungsfrei und einfach zu bedienen sein. Meine damalige Lösung waren RaspberryPi die auf der Rückseite der TV Bildschirme befestigt waren (VESA Halterung).
Installiert hatte ich OSMC ein Kodi-OS. Beim Booten wurde sofort eine Playlist mit den Videos in einer Endlosschleife abgespielt.

Für den KongressPlayer kam mir die Idee es genauso zu machen, hier gibt es aber weitere Herausforderungen:
* Niemand in der Zielgruppe schaut alles auf einmal an. Die Videos müssen also gestoppt und später wieder gestartet werden können.
* Der RasPi hat keinen An/Aus Schalter, das abziehen vom Strom könnte das OS beschädigen. Bei den Ausstellungs TV ist das jedoch nicht einmal passiert, so das dieser Punkt vernachlässigt werden kann.
* Die Bedienung muß so einfach sein, das es ohne Einweisung klappt (wahrscheinlich hat die Zielgruppe die Einweisung längst wieder vergessen wenn sie eine Woche später noch was schauen will)

Meine Lösung war deshalb:
* Installieren von OSMC (Kodi) als Abspielplattform
* Bedienung über zwei Taster: Play/Pause + Nächstes Video, die Taster können am GPIO des Raspi angeschlossen werden und dann Scripte aktivieren, die die Befehle in Kodi umsetzen.
* Optional: Bedienung über die TV Fernbedienung (HDMI CEC)

Bei der Suche nach kleinen Tastern die ich in ein RasPi Gehäuse einbauen kann, bin ich über ein Angebot für das SuperPi-Gehäuse gestoßen. Für 5€ im Angebot war es sogar günstiger als alle anderen halbwegs vernünftigen Gehäuse, es gibt genug Platz um kleine Taster einzubauen und das beste: Über eine Erweiterungsplatine gibt es einen "Echten" Ein-Aus-Schalter am Gehäuse. Perfekt :-)

In diesem Projekt habe ich (hoffentlich) alle Schritte aufgezeichnet die Notwendig sind um dieses Projekt nachzubauen.
Der Aufbau besteht aus zwei Teilen:

1. Installation und Einrichtung des Betriebssystem, inkl. Anpassen der Oberfläche.
: Dieser Schritt ist nur einmalig notwendig, statt die Einrichtung nachzubauen, kann auch ein fertiges Image heruntergeladen werden.

2. Vorbereiten der Videos und überspielen auf den Pi
: Dieser Schritt ist nach jedem Kongress notwendig, die Dateien könnten dann aber untereinander ausgetauscht werden um sich Arbeit zu ersparen.

Ich habe ein paar Schritte auch als Video aufgenommen und in der Anleitung verlinkt.

[Video Oberfläche]