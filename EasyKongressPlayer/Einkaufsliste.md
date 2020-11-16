Liste der notwendigen Hard- und Software

# Hardware

| Name        | Beschreibung           | Kosten  |
| ------------- |-------------| -----:|
| RaspberryPi      | es muß nicht der neueste sein, in meinem Fall ein Pi 2 B | 30€ |
| MicroSD Speicherkarte     | min. 16 GB, besser von einer guten Marken wie SanDisk Klasse A1 (Geschwindigkeit)     |   5€ |
| Netzteil | am besten ein Integriertes Netzteil mit Kabel, ist einfacher in der Bedienung. mind. 2,5A Leistung  |    5€ |
| Gehäuse | SuperPi oder Alternative ohne Power-Taster | 5€ |
| Controller | Ich nutze einen Controller im Super Nintendo Style | 5€|
| Taster | Optional Mini Druck-Taster statt dem Controller | 1€ |
| **Summe** | | 50€ |

Da ich bereits mehrere Raspberry Pi da hatte, betrugen meine Ausgaben für das Projekt 15€ je Box (ich habe gleich 2 gekauft) für das Gehäuse, Controller und Netzteil.
Das Gehäuse war ein echtes schäppchen, normalerweise werden hier für solch ein Gehäuse zwischen 20-30€ Fällig!
Ich habe zwar diverse Handy Netzteile, aber dort muß ein USB Kabel angeschlossen werden, was für die Zielgruppe eine zusätzliche Herausforderung sein könnte - Keep it Simple! -

# Software
Ich benutze für dieses Projekt ausschließlich kostenlose Software

| Software | Beschreibung | Alternative |
|---|---|---|
| [Win32DiskImager](https://www.heise.de/download/product/win32-disk-imager-92033) | Schreiben von iso Dateien auf eine SD Karte. Das Tool kann aber auch aus der SD Karte ein ISO Image machen, damit kann man super Backup von allem erstellen. | der offizielle [RaspberryPi Imager](https://www.raspberrypi.org/software/) |
| [WinSCP](https://winscp.net/) | Kopieren von Dateien auf den Pi | jedes beliebige SFTP Tool |
| [Putty](https://www.putty.org/) | Arbeiten per Remote mit dem Pi | jedes beliebige SSH Tool |
| *zum Aufbereiten der Videos:* || |
| [LoselessCut](https://github.com/mifi/lossless-cut) | Zerschneidet Videos in einzelteile | Video Bearbeitungs Tools |
| [MediaElch](https://www.kvibes.de/mediaelch/) | Erstellen und Verwalten der .nfo Dateien | die Metadaten der Videos können auch mit einem einfachen Texteditor per Hand erstellt werden. |
