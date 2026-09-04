#!/bin/sh
# Regenerate v2/index.html from the root index.html so the two can never drift.
# Run after ANY edit to index.html:   sh build-v2.sh
set -e
cd "$(dirname "$0")"
sed -e 's|href="testas/|href="../testas/|g' \
    -e 's|href="metodika/|href="../metodika/|g' \
    -e 's|href="darzelis/|href="../darzelis/|g' \
    -e 's|href="programa/|href="../programa/|g' \
    -e 's|href="v1/|href="../v1/|g' \
    -e "s|fetch('data/|fetch('../data/|g" \
    -e 's|data-artifact="vaiko-zemelapis"|data-artifact="vaiko-zemelapis-v2"|' \
    -e 's|<title>Viskas, ko išmoksta Lietuvos vaikas · LT mokymosi žemėlapis</title>|<title>Viskas, ko išmoksta Lietuvos vaikas · v2 (testinė)</title>|' \
    -e 's|content="https://krisvas333.github.io/vaiko-zemelapis/"|content="https://krisvas333.github.io/vaiko-zemelapis/v2/"|' \
    index.html > v2/index.html
echo "v2/index.html regenerated · '../' hits in root index.html: $(grep -c '\.\./' index.html)"
