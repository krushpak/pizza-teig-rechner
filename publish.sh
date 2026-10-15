#!/bin/bash
set -e
cd "$(dirname "$0")"

git add index.html
git commit -m "Update Pizza Teig Rechner"
git push

echo "Veröffentlicht: https://krushpak.github.io/pizza-teig-rechner/"
echo "(GitHub braucht meist 30-60 Sekunden, bis die Änderung live ist)"
