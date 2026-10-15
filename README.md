# 💧 Teig Rechner

![Built with Claude](https://img.shields.io/badge/Built%20with-Claude-D97757)
![No build step](https://img.shields.io/badge/build-none-lightgrey)

Ein Rechner für drei hausgemachte Teige – skaliert Mehl, Wasser, Hefe/Sauerteig und Salz automatisch nach Stückzahl, Stückgewicht und (je nach Rezept) Mehlsorte, Hydration oder Zutaten-Varianten.

**Live:** https://krushpak.github.io/pizza-teig-rechner/

## Rezepte

- **🍕 Pizza** – Biga-Pizzateig (50 % Vorteig, reduzierter Trieb). Hydration wird aus dem Mehl-Protein-Gehalt geschätzt, lässt sich aber manuell übersteuern. Zusätzliche Pizzen ohne Vorteig lassen sich nachträglich in den Hauptteig einrechnen.
- **🍞 Weizenbrot** – Helles Sauerteigbrot mit Vorteig, optionalem Semola- und Kartoffel-Anteil.
- **🌾 Roggenbrot** – Engelmann'scher Flachlaib (EFL#1): Sauerteig + Brühstück aus Roggenschrot, mit Pizzamehl zum Flachlaib verknetet, gebacken im Dampf-Backofen mit gestufter Feuchtigkeit.

## Funktionen

- Ausklappbare Schritt-für-Schritt-Anleitung für jeden Zubereitungsschritt
- Mengen immer frei nach Stückzahl & Stückgewicht skalierbar
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
