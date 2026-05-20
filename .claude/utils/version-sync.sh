#!/usr/bin/env bash
# Comprueba que la versión está sincronizada entre manifests.
set -uo pipefail

VERSIONS=()

# package.json
if [ -f "package.json" ] && command -v python3 >/dev/null 2>&1; then
  V=$(python3 -c "import json; print(json.load(open('package.json'))['version'])" 2>/dev/null || echo "")
  [ -n "$V" ] && VERSIONS+=("package.json=$V")
fi

# tauri.conf.json
if [ -f "src-tauri/tauri.conf.json" ] && command -v python3 >/dev/null 2>&1; then
  V=$(python3 -c "import json; d=json.load(open('src-tauri/tauri.conf.json')); print(d.get('version') or d.get('package',{}).get('version',''))" 2>/dev/null || echo "")
  [ -n "$V" ] && VERSIONS+=("tauri.conf.json=$V")
fi

# capacitor.config.ts/json — versión vive en package.json, así que skip

# android build.gradle
if [ -f "android/app/build.gradle" ]; then
  V=$(grep -E 'versionName' android/app/build.gradle | head -1 | grep -oE '"[^"]+"' | tr -d '"' || echo "")
  [ -n "$V" ] && VERSIONS+=("android=$V")
fi

# iOS Info.plist
if [ -f "ios/App/App/Info.plist" ]; then
  V=$(grep -A1 'CFBundleShortVersionString' ios/App/App/Info.plist | grep string | sed 's/.*<string>\(.*\)<\/string>.*/\1/' | head -1 || echo "")
  [ -n "$V" ] && VERSIONS+=("ios=$V")
fi

echo "Versiones detectadas:"
printf '  %s\n' "${VERSIONS[@]}"

# Si hay más de una versión distinta, avisar
UNIQUE=$(printf '%s\n' "${VERSIONS[@]}" | sed 's/.*=//' | sort -u | wc -l)
if [ "$UNIQUE" -gt 1 ]; then
  echo "⚠  Versiones desincronizadas entre plataformas. Sincroniza antes de release."
  exit 1
fi

exit 0
