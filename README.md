# 💧 Teig Rechner

![Built with Claude](https://img.shields.io/badge/Built%20with-Claude-D97757)
![Web: no build step](https://img.shields.io/badge/Web-kein%20Build--Schritt-lightgrey)
![macOS 14+](https://img.shields.io/badge/macOS-14%2B-black)
![Swift 6](https://img.shields.io/badge/Swift-6-F05138)

Ein Rechner für drei hausgemachte Teige – skaliert Mehl, Wasser, Hefe/Sauerteig und Salz automatisch nach Stückzahl, Stückgewicht und (je nach Rezept) Mehlsorte, Hydration oder Zutaten-Varianten.

## Versionen

Es gibt den Teig Rechner in zwei Varianten mit denselben Rezepten und derselben Rechenlogik:

| | 🌐 Web-App | 🖥️ Mac-App |
| --- | --- | --- |
| **Läuft auf** | jedem Browser, iPhone & iPad (als Home-Bildschirm-App) | macOS 14 oder neuer, Apple Silicon & Intel |
| **Öffnen** | **[krushpak.github.io/pizza-teig-rechner](https://krushpak.github.io/pizza-teig-rechner/)** | **[Download im neuesten Release](https://github.com/krushpak/pizza-teig-rechner/releases/latest)** (`TeigRechner-macOS.zip`) |
| **Technik** | eine `index.html`, reines HTML/CSS/JS | native SwiftUI-App, Quellcode in [`macos/`](macos/) |
| **Extras** | offline nutzbar, Einstellungen bleiben lokal | Seitenleiste & Zwei-Spalten-Layout, Werte direkt eintippbar, Einkaufsliste kopieren (⇧⌘C), Standardwerte mit Widerrufen (⌘Z), Schriftgröße per ⌘+ / ⌘−, Dunkelmodus & „Kontrast erhöhen“ |

### Web-App auf dem iPhone installieren

In Safari öffnen → Teilen → „Zum Home-Bildschirm“.

### Mac-App installieren

1. `TeigRechner-macOS.zip` aus dem [neuesten Release](https://github.com/krushpak/pizza-teig-rechner/releases/latest) laden und entpacken.
2. „Teig Rechner“ in den Ordner „Programme“ ziehen.
3. Die App ist nicht mit einem kostenpflichtigen Apple-Entwicklerzertifikat signiert, daher blockiert macOS sie beim ersten Öffnen. Einmal freigeben: Doppelklick, Warnung schließen, dann **Systemeinstellungen → Datenschutz & Sicherheit → „Dennoch öffnen“** und mit Passwort/Touch ID bestätigen.
4. Ab dann startet sie normal. Eine ältere „Pizza Teig Rechner.app“ (v1) kann gelöscht werden.

### Versionsgeschichte

| Version | Web | Mac |
| --- | --- | --- |
| [v2.1.0](https://github.com/krushpak/pizza-teig-rechner/releases/tag/v2.1.0) | unverändert | **Neue native Mac-App** mit allen drei Rezepten |
| [v2.0.0](https://github.com/krushpak/pizza-teig-rechner/releases/tag/v2.0.0) | drei Rezepte, neuer Name & Icon | – (Mac-App noch auf v1-Stand) |
| [v1.0.0](https://github.com/krushpak/pizza-teig-rechner/releases/tag/v1.0.0) | Pizza-Rechner | „Pizza Teig Rechner“, nur Pizza |

## Rezepte

- **🍕 Pizza** – Biga-Pizzateig (50 % Vorteig, reduzierter Trieb). Hydration wird aus dem Mehl-Protein-Gehalt geschätzt, lässt sich aber manuell übersteuern. Zusätzliche Pizzen ohne Vorteig lassen sich nachträglich in den Hauptteig einrechnen.
- **🍞 Weizenbrot** – Helles Sauerteigbrot mit Vorteig, optionalem Semola- und Kartoffel-Anteil.
- **🌾 Roggenbrot** – Engelmann'scher Flachlaib (EFL#1): Sauerteig + Brühstück aus Roggenschrot, mit Pizzamehl zum Flachlaib verknetet, gebacken im Dampf-Backofen mit gestufter Feuchtigkeit.

## Funktionen

- Ausklappbare Schritt-für-Schritt-Anleitung für jeden Zubereitungsschritt
- Mengen immer frei nach Stückzahl & Stückgewicht skalierbar
- Läuft komplett offline – keine Daten verlassen das Gerät, Einstellungen werden nur lokal gespeichert

## Entwicklung

### Web-App aktualisieren

```bash
./publish.sh
```

### Mac-App bauen

Voraussetzung: Xcode 27 (wird automatisch verwendet, auch wenn `xcode-select` auf die Command Line Tools zeigt).

```bash
cd macos
./build.sh                 # erzeugt "Teig Rechner.app" (Universal)
swift test                 # Tests der Rechenlogik
```

Aufbau von [`macos/Sources/PizzaTeigRechner/`](macos/Sources/PizzaTeigRechner/):

- `Calculators/` – Rechenlogik, 1:1 aus der Web-Version portiert und per Tests an den Original-Rezepten kalibriert
- `Recipes/` – Ansichten der drei Rezepte, je ein View pro Zubereitungsschritt
- `Components/`, `Design/` – gemeinsame Bausteine, Farben (aus der Web-Version) und Formate
- `Navigation/`, `App/` – Seitenleiste, Menübefehle, App-Einstieg

Ändert sich ein Rezept, müssen Web- (`index.html`) und Mac-Version (`Calculators/`, `Recipes/`) gemeinsam angepasst werden.

## KI-Hinweis

Dieses Projekt – Rechenlogik, Design und Rezept-Formulierung – wurde größtenteils mit Unterstützung von [Claude](https://claude.com) (Anthropic) entwickelt.
