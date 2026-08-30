# 🍕 Pizza Teig Rechner

![Built with Claude](https://img.shields.io/badge/Built%20with-Claude-D97757)
![No build step](https://img.shields.io/badge/build-none-lightgrey)

Ein Rechner für Biga-Pizzateig (50 % Vorteig, reduzierter Trieb): skaliert Mehl, Wasser, Hefe und Salz automatisch nach Anzahl der Pizzen, Teiglingsgröße, Mehl-Protein-Gehalt und Hydration.

**Live:** https://krushpak.github.io/pizza-teig-rechner/

## Funktionen

- Anzahl Pizzen & Gewicht pro Teigling frei einstellbar
- Hydration wird aus dem Mehl-Protein-Gehalt geschätzt, lässt sich aber jederzeit manuell übersteuern
- Ausklappbare Schritt-für-Schritt-Anleitung für Biga und Hauptteig
- Nachträglich zusätzliche Pizzen ohne Vorteig direkt in den Hauptteig einrechenbar (inkl. Hinweis auf zusätzliche Hefe ab 3 Teiglingen)
- Läuft komplett offline im Browser – keine Daten verlassen das Gerät, Einstellungen werden nur lokal gespeichert
- Als Web-App auf dem iPhone-Homescreen nutzbar (Safari → Teilen → „Zum Home-Bildschirm")

## Technik

Eine einzelne, in sich geschlossene `index.html` – reines HTML/CSS/JavaScript, kein Build-Schritt, kein Framework, keine Abhängigkeiten.

## Aktualisieren

```bash
./publish.sh
```

## KI-Hinweis

Dieses Projekt – Rechenlogik, Design und Rezept-Formulierung – wurde größtenteils mit Unterstützung von [Claude](https://claude.com) (Anthropic) entwickelt.
