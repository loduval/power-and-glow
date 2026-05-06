# 🍋 POWER & GLOW — Site web v2.0

Site vitrine officiel pour **POWER & GLOW** — coaching premium par Inès Benabbas.

> *Ton corps est ton plus beau rituel.*

---

## 🆕 Nouveautés v2.0 vs v1.0

| Élément | v1.0 | v2.0 |
|---------|------|------|
| Sections | 9 | **13** |
| Lignes index.html | 332 | **~750** |
| Lignes styles.css | 556 | **~1100** |
| Lignes main.js | 100 | **~120** |
| Anti-claims | 1 phrase | **4 anti-claims développés** |
| Manifesto | titre + 1 ligne | **titre + body + détail** |
| À propos d'Inès | ❌ | ✅ Section dédiée |
| Glossaire | ❌ | ✅ 6 termes définis |
| Process | ❌ | ✅ 4 étapes |
| Séries éditoriales | ❌ | ✅ 5 cards thématiques |
| Devise latine | ❌ | ✅ Section avec photo forêt |
| Témoignages | ❌ | ✅ 3 quotes |
| FAQ | ❌ | ✅ 7 questions accordéon |
| Citations géantes | ❌ | ✅ 2 entre-sections |
| Galerie | basique | **+ titres au hover** |
| Footer | minimal | **3 colonnes + nav** |

---

## 📦 Déploiement chez Laurent

Le site v1 actuel est dans `04_SITE-WEB/site/`. Pour passer à la v2 :

```bash
# 1. Sauvegarde de la v1 (au cas où)
cd /Users/laurentduval/Desktop/01-Projects/INES-COACH/04_SITE-WEB
mv site site-v1-backup

# 2. Téléchargement et extraction des fichiers v2 (depuis Claude)
# (Claude te fournira les fichiers via present_files)
mkdir -p site/assets/{visuals,photos,icons,fonts,css,js}

# 3. Copier les nouveaux index.html, styles.css, main.js, README.md
#    (depuis les fichiers fournis par Claude)

# 4. Réinjecter les assets (qui n'ont pas changé entre v1 et v2)
cp 04_SITE-WEB/assets-prompts-test/v1.2/finals/IG_*.png \
   04_SITE-WEB/site/assets/visuals/
cp 03_IDENTITE-MARQUE/photos-environnement/*.jpg \
   04_SITE-WEB/site/assets/photos/
cp 03_IDENTITE-MARQUE/icons-brand/citron-tranches-jaunes.png \
   04_SITE-WEB/site/assets/icons/
cp 04_SITE-WEB/assets-prompts-test/v1.2/fonts/*.ttf \
   04_SITE-WEB/site/assets/fonts/

# 5. Ouvrir le site
open 04_SITE-WEB/site/index.html
```

---

## 📑 Sections du site v2

1. **Navigation** sticky (scrolled state) avec menu burger mobile
2. **Hero** photo femme + titre baseline + CTA + 3 trust signals
3. **L'anti-promesse** (statement principal + 4 anti-claims développés)
4. **Citation géante 1** : *« Ton corps n'est pas un champ de bataille. C'est un foyer. »*
5. **Le manifesto** : 4 principes complets (titre + body court + détail long)
6. **L'étoile polaire** : PLUMP & GLOW avec descriptifs
7. **La méthode** : 3 piliers (Soin/Plaisir/Rituel) avec tagline + body
8. **Le glossaire** : 6 termes du vocabulaire de marque (Plump, Glow, Rituel, Anti-claim, Force tranquille, Replump)
9. **À propos d'Inès** : section dédiée avec photo + parcours + quote
10. **Citation géante 2** : *« Strong, glowy & busy. »*
11. **Comment ça marche** : 4 étapes (appel découverte → bilan → séances → glow check)
12. **Les 5 séries** éditoriales expliquées
13. **La galerie** : 20 visuels Instagram filtrables avec titres au hover
14. **La devise latine** : "Fortes fortuna adjuvat" sur photo forêt
15. **Témoignages** : 3 quotes (placeholders cohérents)
16. **FAQ** : 7 questions accordéon
17. **Newsletter** : inscription
18. **Footer** : 3 colonnes (brand + naviguer + découvrir) + mentions

---

## ✨ Fonctionnalités

- ✅ Navigation sticky avec état "scrolled" (background plus opaque + box-shadow)
- ✅ Smooth scroll natif via `scroll-behavior: smooth`
- ✅ Galerie filtrable par série (5 filtres + "Tous")
- ✅ Lightbox (clic + Échap pour fermer)
- ✅ Animations fade-in au scroll (IntersectionObserver, threshold 12%)
- ✅ Float animation sur le citron du hero
- ✅ Hover rotation sur le visuel hero
- ✅ FAQ accordéon (un seul ouvert à la fois)
- ✅ Citations géantes avec guillemet décoratif
- ✅ Newsletter form avec UX validation (mock)
- ✅ 100% responsive (breakpoints 480 / 768 / 968 px)
- ✅ Lazy loading des 20 visuels
- ✅ Sémantique HTML5 + accessibilité (alt, aria-labels, navigation clavier)
- ✅ Open Graph tags pour partage social

---

## 🎨 Design System v1.3

**Couleurs (mode 100% solaire)** :
- `--rose-neon` `#EC1558` → slogans, CTA, accents
- `--orange-solaire` `#FF8C42` → gradient secondaire
- `--jaune-zest` `#FACC15` → glossaire, accents
- `--cream` `#FFFBF5` → background dominant
- `--dark` `#1E293B` → corps de texte

**Polices** :
- *Playfair Display Italic* → slogans poétiques (h1, h2, principes)
- **Comfortaa Bold** → mots-clés ronds, baselines, taglines
- Montserrat → corps de texte, étiquettes, navigation

---

## 🛡️ Garde-fous projet respectés

- ❌ Pas de promesses chiffrées (-N kg, -N cm)
- ❌ Pas de représentation portrait d'Inès (photos d'environnement uniquement)
- ❌ Pas de mention SAP 50%
- ❌ Pas de référence au TDAH
- ❌ Pas de "Pink Glow Coaching" → **POWER & GLOW** uniquement
- ✅ Mode 100% solaire (pas de dual mode noir)
- ✅ Filtre vocabulaire santé/nutrition strict (mots polémiques uniquement en négation : "Je ne suis pas ta coach minceur", "0 % culpabilité")

---

## 📦 Dépendances externes

- Google Fonts CDN (Playfair Display, Comfortaa, Montserrat)
- Aucun framework JS (vanilla uniquement)
- Aucun framework CSS (custom CSS avec variables)

Le site fonctionne sans aucune installation. Ouvrir `index.html` dans un navigateur suffit.

---

_Auteur : Laurent Duval × Claude — Mai 2026_
_Version 2.0 — Sections étendues (13) + glossaire + à propos + FAQ + témoignages_
