# Sonoff mit MQTT unter FHEM
Installieren und betreiben von Sonoff Geräten

## Sonoff Gerät mit Tasmota flashen
flash und konfiguration

## MQTT Server installieren
Installation und Konfiguration erfolgt komplett in FHEM

> define myBroker MQTT2_SERVER 1883 global

der Broker richtet Geräte automatisch ein, wenn er Nachrichten bekommt. Dazu soll eigentlich eine Art "generic Device" eingerichtet werden, die alle Nachrichten abfängt und bei nicht angelegten Geräten dies übernimmt. Das hat bei mir nicht so gut geklappt, ich habe dies manuell gemacht. Da ich nur 1 Device habe, kann ich nicht testen was passiert wenn ein zweites dazu kommt.


## MQTT Client in FHEM einrichten
Installation und Konfiguration erfolgt komplett in FHEM

Das Gerät wurde automatisch in FHEM angelegt. Ich habe es um folgende Konfigurationen erweitert:

> set [Gerätename] attrTemplate tasmota_POW

abändern des devStateIcon:  
```` 
{my $onl = ReadingsVal($name,"LWT","false") eq "Online"?"10px-kreis-gruen":"10px-kreis-rot"; my $light = ReadingsVal($name,"state","off");'<a href="http://'.ReadingsVal($name,"IPAddress","none").' "target="_blank">'.FW_makeImage($onl).'</a> <a href="/fhem?cmd.dummy=set $name toggle&XHR=1">'.FW_makeImage($light).'</a><div> uptime: '.ReadingsVal($name,"Uptime",undef).sprintf(" <BR/>aktuell: %.1f W <BR/>Tag: %.2f kWh <BR/>Gestern: %.3f kWh <BR/>Gesamt: %.4f kWh", ReadingsVal($name,"ENERGY_Power","-1"), ReadingsVal($name,"ENERGY_Today","-1"), ReadingsVal($name,"ENERGY_Yesterday","-1"), ReadingsVal($name,"ENERGY_Total","-1")).'</div>
````

abändern der readingsList:  
````
tele/DVES_E772EA/LWT:.* LWT
tele/DVES_E772EA/STATE:.* { json2nameValue($EVENT,'',$JSONMAP) }
tele/DVES_E772EA/SENSOR:.* { json2nameValue($EVENT,'',$JSONMAP) }
tele/DVES_E772EA/INFO.:.* { json2nameValue($EVENT,'',$JSONMAP) }
tele/DVES_E772EA/UPTIME:.* { json2nameValue($EVENT,'',$JSONMAP) }
stat/DVES_E772EA/RESULT:.* { json2nameValue($EVENT,'',$JSONMAP) }
````
### FileLog & Plot
### Auswerten Stromverbrauch