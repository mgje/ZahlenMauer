ZahlenMauer
===========
Mit Hilfe dieser Webanwendung lassen sich beliebige 
Zahlenmauern erstellen.

Um erste Erfahrungen zu [CoffeeScript](http://coffeescript.org/) (sehr 
effiziente Sprache für JavaScript Programmierung) zu sammeln, erstellte 
ich im Rahmen eines 90 Minuten Projektes diese einfache Webanwendung. 

Aus einer Liste von Zahlen wird jeweils die Summe der direkten
Nachbarn gebildet und auf einer höheren Ebene ausgegeben.

Installation
============
- Archiv herunterladen (zip)
- Zip-Datei auspacken
- die Datei [zahlenmauer.html](public/zahlenmauer.html) im Verzeichnis public 
in einem Browser öffnen

Weitere Entwicklung
==================
Um eigene Änderungen einzubringen, sollte die Datei [zahlenmauer.coffee](src/zahlenmauer.coffee) 
im Ordner src entsprechend angepasst werden. 

Das kompakte und übersichtliche CoffeeScript Programm[zahlenmauer.coffee](src/zahlenmauer.coffee)
wird in ein korrektes, jedoch schwieriger lesbares JavaScript Programm [zahlenmauer.js](public/js/zahlenmauer.coffee) 
übersetzt. 

Weitere Informationen zum Arbeiten mit CoffeeScript finden sich unter:
[http://coffeescript.org/](http://coffeescript.org/)

Mögliche Erweiterungen 
======================
- Zufällige generierte Zahlenmauern 
- Zahlenmauern mit Lücken für Arbeitsblätter
- Interaktive Zahlenmauern - SuS können ihre Resultate direkt eingeben
