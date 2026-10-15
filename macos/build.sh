#!/bin/bash
# Baut "Teig Rechner.app" als Universal-App (Apple Silicon + Intel, ab macOS 14).
set -e
cd "$(dirname "$0")"

# Xcode-Toolchain verwenden, auch wenn xcode-select auf die Command Line Tools zeigt
if [ -d /Applications/Xcode.app ]; then
  export DEVELOPER_DIR=/Applications/Xcode.app/Contents/Developer
fi

ARCHS="--arch arm64 --arch x86_64"
swift build -c release $ARCHS
BIN="$(swift build -c release $ARCHS --show-bin-path)/PizzaTeigRechner"

APP="Teig Rechner.app"
rm -rf "$APP"
mkdir -p "$APP/Contents/MacOS" "$APP/Contents/Resources/de.lproj"
cp "$BIN" "$APP/Contents/MacOS/PizzaTeigRechner"
cp Info.plist "$APP/Contents/Info.plist"
cp Icon/AppIcon.icns "$APP/Contents/Resources/AppIcon.icns"
codesign --force --deep -s - "$APP"

echo "Fertig: $APP"
echo "Zum Installieren: cp -R \"$APP\" /Applications/"
