#!/bin/bash
# ============================================================================
# POWER & GLOW — Déploiement site v2.0
# ============================================================================
# Usage : bash deploy-site-v2.sh
# Lance ce script depuis n'importe où — il utilise des chemins absolus.
# ============================================================================

set -e

PROJECT="/Users/laurentduval/Desktop/01-Projects/INES-COACH"
SITE="$PROJECT/04_SITE-WEB/site"
BACKUP="$PROJECT/04_SITE-WEB/site-v1-backup-$(date +%Y%m%d-%H%M%S)"

# Trouver les nouveaux fichiers v2 (à côté de ce script)
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
SOURCE="$SCRIPT_DIR"

echo "═══════════════════════════════════════════════════════"
echo "  🍋 POWER & GLOW — Déploiement site v2.0"
echo "═══════════════════════════════════════════════════════"
echo ""

# === 1. Backup de la v1 ===
if [ -d "$SITE" ]; then
  echo "📦 Backup de la v1 actuelle…"
  mv "$SITE" "$BACKUP"
  echo "   → $BACKUP"
else
  echo "ℹ️  Pas de v1 à sauvegarder."
fi

# === 2. Création de la nouvelle structure ===
echo ""
echo "📁 Création de la structure v2…"
mkdir -p "$SITE/assets/visuals"
mkdir -p "$SITE/assets/photos"
mkdir -p "$SITE/assets/icons"
mkdir -p "$SITE/assets/fonts"
mkdir -p "$SITE/assets/css"
mkdir -p "$SITE/assets/js"

# === 3. Copie des nouveaux fichiers v2 ===
echo ""
echo "📝 Copie des fichiers v2…"
cp "$SOURCE/index.html"           "$SITE/index.html"
cp "$SOURCE/README.md"            "$SITE/README.md"
cp "$SOURCE/assets/css/styles.css" "$SITE/assets/css/styles.css"
cp "$SOURCE/assets/js/main.js"     "$SITE/assets/js/main.js"
echo "   ✓ index.html ($(wc -l < $SOURCE/index.html) lignes)"
echo "   ✓ styles.css ($(wc -l < $SOURCE/assets/css/styles.css) lignes)"
echo "   ✓ main.js ($(wc -l < $SOURCE/assets/js/main.js) lignes)"
echo "   ✓ README.md"

# === 4. Réinjection des assets depuis le projet ===
echo ""
echo "🎨 Copie des assets (visuels + photos + icônes + fontes)…"
cp "$PROJECT/04_SITE-WEB/assets-prompts-test/v1.2/finals/"IG_S*_W*_*.png \
   "$SITE/assets/visuals/" 2>/dev/null
echo "   ✓ $(ls $SITE/assets/visuals/*.png 2>/dev/null | wc -l | tr -d ' ') visuels"

cp "$PROJECT/03_IDENTITE-MARQUE/photos-environnement/"*.jpg \
   "$SITE/assets/photos/" 2>/dev/null
echo "   ✓ $(ls $SITE/assets/photos/*.jpg 2>/dev/null | wc -l | tr -d ' ') photos"

cp "$PROJECT/03_IDENTITE-MARQUE/icons-brand/citron-tranches-jaunes.png" \
   "$SITE/assets/icons/" 2>/dev/null
echo "   ✓ icône citron"

cp "$PROJECT/04_SITE-WEB/assets-prompts-test/v1.2/fonts/"*.ttf \
   "$SITE/assets/fonts/" 2>/dev/null
echo "   ✓ $(ls $SITE/assets/fonts/*.ttf 2>/dev/null | wc -l | tr -d ' ') fontes"

# === 5. Récapitulatif ===
echo ""
echo "═══════════════════════════════════════════════════════"
echo "  ✅ Déploiement v2.0 terminé"
echo "═══════════════════════════════════════════════════════"
echo ""
echo "📂 Site v2 : $SITE"
du -sh "$SITE" | awk '{print "   Taille totale : " $1}'
[ -d "$BACKUP" ] && echo "💾 Backup v1 : $BACKUP"
echo ""
echo "🌐 Ouverture du site dans le navigateur…"
sleep 1
open "$SITE/index.html"
echo ""
echo "💡 Tip : pour servir le site via un serveur local (recommandé) :"
echo "   cd $SITE && python3 -m http.server 8000"
echo "   puis ouvrir http://localhost:8000"
