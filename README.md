# VVZ'49 — Flyers & posters

Archief en werkplek voor posters/flyers van voetbalvereniging VVZ'49: een herbruikbaar
HTML/CSS-template in de huisstijl van de club, plus alle daadwerkelijk gemaakte flyers.

## Inhoud

```
archief/                       Bestaande/historische flyers (referentiemateriaal, geen bron-html)
docs/huisstijl-flyers.md       Richtlijnen: opbouw, kleuren, typografie, logogebruik, formaat
templates/poster-template.html Het herbruikbare flyer-template (1080x1350px)
assets/logos/                  VVZ'49-logo (png + wit svg)
assets/fonts/                  Archivo Black + Archivo (woff2, SIL Open Font License)
scripts/render-flyer.sh        Rendert een flyer-HTML-bestand naar PNG (via headless chromium)
flyers/                        Kant-en-klare flyers: per flyer een .html (bron) en .png (export)
.claude/skills/vvz49-flyer-maken/ Claude Code-skill die het maken van een nieuwe flyer begeleidt
```

## Snel een nieuwe flyer maken

Zie [`docs/huisstijl-flyers.md`](docs/huisstijl-flyers.md) voor de volledige richtlijnen, of
gebruik de Claude Code-skill `vvz49-flyer-maken` (werkt automatisch in deze repo). Kort samengevat:

1. Kopieer `templates/poster-template.html` naar `flyers/<naam>.html`.
2. Pas de kicker, de grote kop, de infobox-tekst en de achtergrondfoto aan.
3. `scripts/render-flyer.sh flyers/<naam>.html flyers/<naam>.png`
4. Commit `.html` + `.png` samen.

## Huisstijl

Kleuren en het VVZ'49-logo komen uit de bredere SWV Soest-huisstijl
([`thewally/swvsoest-huisstijl`](https://github.com/thewally/swvsoest-huisstijl)) — deze repo
voegt daar specifiek de flyer/poster-opmaak aan toe. Zie
[`docs/huisstijl-flyers.md`](docs/huisstijl-flyers.md).

## Documentatie

Dit project is ook gedocumenteerd in Arjen's Obsidian-vault onder `Projecten/VVZ'49/`.
