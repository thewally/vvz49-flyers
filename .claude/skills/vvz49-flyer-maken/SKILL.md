---
name: vvz49-flyer-maken
description: Maakt een nieuwe poster/flyer voor VVZ'49 (repo thewally/vvz49-flyers, lokaal /home/arjen/Projects/vvz49-flyers) op basis van het huisstijl-template. Gebruik deze skill zodra de gebruiker een flyer, poster of aankondiging wil maken voor een clubactiviteit — ook als hij het niet expliciet "skill" noemt. Zinnen als "maak een flyer voor", "ik heb een poster nodig voor", "zet een aankondiging op voor het toernooi", "maak reclame voor deze activiteit", of het geven van event-details (datum, tijd, locatie) met de bedoeling daar een flyer van te maken activeren deze skill.
---

# Skill: vvz49-flyer-maken

## Doel
Een nieuwe flyer/poster maken voor VVZ'49 door het huisstijl-template te kopiëren en te vullen
met de tekst en achtergrondfoto van de betreffende activiteit, en die te renderen naar een
kant-en-klare PNG.

## Repo
`/home/arjen/Projects/vvz49-flyers` (GitHub: `thewally/vvz49-flyers`)

## Benodigde informatie

Vraag naar wat ontbreekt — alleen `titel`/kop en een achtergrondfoto zijn echt nodig, de rest
heeft een redelijke default of mag leeg blijven:

| Veld | Verplicht | Uitleg |
|---|---|---|
| Kicker (1-2 regels) | nee | Korte aankondiging linksboven, bv. "DARTTOERNOOI OP DE VOETBALCLUB!" |
| Grote kop (2-4 regels) | ja | De hoofdtitel, in hoofdletters. Vraag welk woord/welke regel het accentwoord is (komt in het VVZ-groen te staan) |
| Datum en tijd | ja | Regel voor de infobox, bv. "ZATERDAG 21 FEBRUARI — 14:00 UUR" |
| Locatie | aanbevolen | Regel voor de infobox, bv. "KANTINE VVZ'49" |
| Oproep tot actie | aanbevolen | Korte call-to-action, bv. "KOM LANGS, GEEF JE OP EN GOOI MEE!" |
| Achtergrondfoto | ja | Een sfeer-/actiefoto die bij de activiteit past. Vraag de gebruiker om een bestandspad als er geen foto is meegegeven |

Zie `docs/huisstijl-flyers.md` voor de volledige richtlijnen (kleuren, typografie, logogebruik,
wat een goede achtergrondfoto maakt).

## Werkwijze

1. **Lees de richtlijnen** in `docs/huisstijl-flyers.md` en het template
   `templates/poster-template.html` door, zodat je weet welke placeholders er zijn:
   `.kicker`, `.logo-badge img`, `.headline` (met een `<span class="accent">` voor het
   groene woord), `.infobox` (`<p>`, `<p class="locatie">`, `<p class="cta">`), en de
   `background-image: ... url("...")`-regel in `.flyer`.
2. **Bepaal de bestandsnaam** — een korte, beschrijvende slug, bv. `flyers/darttoernooi-2027.html`
   (voeg een jaartal toe als dat helpt onderscheid te maken bij jaarlijks terugkerende activiteiten).
   Check dat dit bestand nog niet bestaat.
3. **Kopieer het template**: `cp templates/poster-template.html flyers/<naam>.html`.
4. **Zorg voor de achtergrondfoto**: als de gebruiker een foto heeft aangeleverd, kopieer die naar
   `flyers/<naam>-achtergrond.jpg` (of `.png`); verwijs in de `background-image`-regel van het
   gekopieerde HTML-bestand naar dat relatieve pad (bv. `<naam>-achtergrond.jpg`, want het
   HTML-bestand staat in dezelfde map). Gebruik **nooit** een gefabriceerde/verzonnen foto-URL —
   vraag de gebruiker om een echte foto als die nog ontbreekt.
5. **Vul de tekst in** in het gekopieerde HTML-bestand: kicker, grote kop (met het juiste woord in
   `<span class="accent">`), en de infobox-regels. Verwijder ongebruikte `<p>`-regels in de
   infobox in plaats van ze leeg te laten staan.
6. **Render** de flyer: `scripts/render-flyer.sh flyers/<naam>.html flyers/<naam>.png`.
7. **Toon het resultaat** — lees de gegenereerde PNG en laat die aan de gebruiker zien (of
   beschrijf duidelijk wat erop staat) vóór je commit, zodat tekstfouten of een verkeerd geknipte
   foto nog gecorrigeerd kunnen worden. Pas zo nodig de HTML aan en render opnieuw.
8. **Commit** met `git add flyers/<naam>.html flyers/<naam>.png [flyers/<naam>-achtergrond.jpg] &&
   git commit -m "Flyer: <titel activiteit>"`.
9. **Vraag expliciet om bevestiging voordat je pusht** naar `main` (zelfde patroon als de
   swvsoest-website-skills — geen automatische push zonder akkoord).
10. **Bevestig** aan de gebruiker dat de flyer klaarstaat en waar het PNG-bestand staat.

## Aandachtspunten

- Blijf bij de in `docs/huisstijl-flyers.md` vastgelegde kleuren (VVZ-groen `#35A044`, navy
  `#0B2A52`, wit) en het lettertype Archivo Black — geen nieuwe kleuren of fonts introduceren.
- Het logo (`assets/logos/vvz49.png`) staat altijd op een wit rond vlak, nooit los op de foto.
- Canvas is 1080×1350px (4:5) — geschikt voor zowel social media als eenvoudig printen. Alleen op
  expliciet verzoek van de gebruiker een ander formaat gebruiken (pas dan `width`/`height` en de
  font-sizes in het gekopieerde HTML-bestand naar verhouding aan).
- `scripts/render-flyer.sh` gebruikt headless Chromium (`chromium --headless --screenshot`) — dit
  moet lokaal beschikbaar zijn; als het commando faalt, meld dat expliciet in plaats van een lege
  of kapotte PNG te committen.
