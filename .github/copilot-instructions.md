# AGENTS.md — MOHA Template Repository

## Project Context

- **Project**: Ministry of Home Affairs, Public Administration & Disaster Management — Sri Lanka
- **Type**: Static HTML template set, convertible to WordPress theme
- **Repository**: `HTML/moha-templates/`
- **GitHub**: `https://github.com/SilentDeveloper123/moha-templates.git` (branch: `dev`)
- **Root**: `C:\Users\Himal\Downloads\Home Affairs Division Web`
- **Color Scheme**: Gold (`#EFBF04`), Navy (`#0A1931`), Steel (`#2D5F8A`), Maroon (`#801200`)
- **No green** (#43c000 or any green hex) anywhere in code, CSS, or documentation.

## Tech Stack Boundaries

### Allowed (locked)
| Technology | Version | Usage |
|---|---|---|
| HTML5 | — | All markup |
| CSS3 | — | Compiled output only |
| SCSS (dart-sass) | ^1.77.8 | All custom styles; compile via `npm run build:css` |
| Tailwind CSS | 3.4.17 (CDN) | Utility classes only; config via inline `tailwind.config` |
| Font Awesome 6 | 6.5.1 (CDN) | Icons; use `fas` prefix |
| jQuery | 3.7.1 (CDN) | DOM manipulation, sliders, accordion, ticker |
| GLightbox | 3.3.0 (CDN) | Lightbox galleries; use `https://cdn.jsdelivr.net/npm/glightbox@3.3.0/dist/` |
| Vanilla JS | ES6+ | IntersectionObserver, requestAnimationFrame |

### Forbidden
- No PHP in template files
- No Node.js build tools other than dart-sass
- No CSS frameworks other than Tailwind (CDN)
- No JavaScript frameworks (React, Vue, Alpine, etc.)
- No npm runtime dependencies (sass is dev-only)
- No CSS preprocessors other than SCSS
- No hardcoded green colors (`#43c000`, `green`, `-green-` in Tailwind)
- No `cdn.jsdelivr.net/gh/mcstudios/glightbox` URLs — use npm versioned URL only

## CSS / SCSS / Tailwind Rules

### SCSS Architecture
All custom styles live in `scss/` partials and are compiled into `css/style.css`.

**Partial file structure (in `scss/`):**
```
scss/
  _variables.scss     # Color vars ($navy, $gold, $steel, $maroon, etc.)
  _base.scss          # body, html, scroll-behavior, fonts
  _loader.scss        # Page loader, spinner, keyframes
  _topbar.scss        # Top bar, contact info, language switcher
  _dropdowns.scss     # Dropdown menus, dropdown-group
  _hero.scss          # Hero slider, slide-bg (opacity transition), heroFade keyframes
  _ticker.scss        # News ticker, ticker-track, ticker-item
  _banner.scss        # Page banners, breadcrumb overlays
  _components.scss    # Cards, buttons, stats, forms, pagination, scrollbar, utilities
  _lightbox.scss      # GLightbox overrides (gclose, gnext, gprev, etc.)
  _responsive.scss    # Media queries (max 639px, 640-1023px, min 1024px)
style.scss            # @import all partials (no additional CSS)
```

### Build Commands
```bash
npm run build:css     # sass scss/style.scss css/style.css --style compressed --no-source-map
npm run watch:css     # sass --watch scss/style.scss css/style.css --style compressed --no-source-map
```

### Critical CSS Rules
1. **Never edit `css/style.css` directly** — it is a compiled artifact.
2. After every SCSS change, run `npm run build:css`.
3. `style.css` must be minified (compressed output).
4. No source maps in production.

### Slide-bg Opacity (not display)
Hero slider background images must use opacity transitions, NOT display toggles:
```scss
.slide-bg {
  opacity: 0;
  transition: opacity 0.8s ease;
  &.active { opacity: 1; }
}
```
Never revert to `display: none/block` for slide backgrounds.

### Page Loader Hidden State
The `.page-loader.hidden` class must use `!important` to override the CSS animation fallback:
```scss
.page-loader.hidden {
  opacity: 0 !important;
  visibility: hidden !important;
  pointer-events: none !important;
}
```

### Tailwind Config
Added inline in `<head>` before the Tailwind CDN script:
```html
<script>
tailwind.config = {
  theme: {
    extend: {
      colors: {
        navy: '#0A1931',
        gold: '#EFBF04',
        steel: '#2D5F8A',
        maroon: '#801200'
      }
    }
  }
}
</script>
```

### Color Utilities (in SCSS)
Tailwind does not generate utilities for custom colors at build time (CDN mode), so SCSS provides fallback classes:
- `.text-gold`, `.bg-gold`, `.border-gold`
- `.hover\:text-gold:hover`, `.hover\:bg-gold-dark:hover`, `.hover\:border-gold:hover`
- `.text-navy`, `.bg-navy`, `.border-navy`
- `.hover\:text-navy:hover`, `.hover\:bg-navy:hover`, `.hover\:border-navy:hover`
- `.gold-gradient { background: linear-gradient(135deg, #EFBF04, #BA9503); }`

### Font Family
```scss
body { font-family: 'Inter', 'Segoe UI', system-ui, sans-serif; }
```
Inter font must be loaded via Google Fonts:
```html
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700;800;900&display=swap" rel="stylesheet">
```

## JS / jQuery Guidelines

### main.js Structure
- Wrap in `jQuery(function ($) { ... });` (WordPress noConflict compatible).
- Always use `$` inside the callback (it is passed as parameter).
- Do NOT use `$(document).ready()` — use `jQuery(function ($) { })` instead.
- Do NOT use `defer` on the script tag — place `<script src="js/main.js"></script>` at the end of `<body>`.

### Script Load Order (in `<head>`)
1. Tailwind CSS (CDN)
2. Tailwind config inline
3. Font Awesome CSS (CDN)
4. GLightbox CSS (CDN)
5. `css/style.css`
6. jQuery (CDN)
7. GLightbox JS (CDN)
8. `</head>`
9. ... body content ...
10. `<script src="js/main.js"></script>` (end of body, no defer)

### Tab Class Reference
When toggling tab active states, use `border-gold` and `text-gold` (NOT `*-green-custom` or `*-gold-custom`):
```js
$tabs.removeClass('active').removeClass('border-gold text-gold').addClass('border-transparent text-gray-400');
$(this).addClass('active').removeClass('border-transparent text-gray-400').addClass('border-gold text-gold');
```

### GLightbox Init
```js
if (typeof GLightbox !== 'undefined') {
  GLightbox({ selector: '.glightbox', touchNavigation: true, loop: true, zoomable: true, draggable: true });
}
```

### Page Loader
```js
$(window).on('load', function () { $('#pageLoader').addClass('hidden'); });
setTimeout(function () { $('#pageLoader').addClass('hidden'); }, 3000);
```

### Hero Slider
- Uses `$('.hero-slide')` selectors.
- Auto-advances every 5500ms via `setInterval`.
- Clicking prev/next or dots resets the timer.
- Call pattern: `goTo(n)`, `next()`, `prev()`, `start()`.

### News Ticker
- Continuous scroll via `requestAnimationFrame` at 0.35px/frame (~21px/s at 60fps).
- Clones original items for seamless loop.
- Prev/next buttons snap one item width via `snap(dir)`.

### Back to Top
- Created dynamically via jQuery (`$('<button class="back-to-top">...')`) and appended to `<body>`.
- Shows when scroll > 500px.

### Counter Animation
- `animateCounters()` runs on IntersectionObserver trigger at 0.5 threshold.
- Steps through target number in ~40 iterations at 40ms intervals.

### Accordion
```js
$('.accordion-toggle').on('click', function () {
  var $item = $(this).closest('.accordion-item');
  $item.find('.accordion-content').slideToggle(200);
  $item.toggleClass('open');
});
```

## Asset / Plugin Management

### CDN URLs (pinned versions — do not change without approval)
| Asset | URL |
|---|---|
| Tailwind CSS | `https://cdn.tailwindcss.com` |
| Font Awesome | `https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css` |
| GLightbox CSS | `https://cdn.jsdelivr.net/npm/glightbox@3.3.0/dist/css/glightbox.min.css` |
| GLightbox JS | `https://cdn.jsdelivr.net/npm/glightbox@3.3.0/dist/js/glightbox.min.js` |
| jQuery | `https://code.jquery.com/jquery-3.7.1.min.js` |

### Placeholder Images
- Use `https://placehold.co/{width}x{height}/{bg_hex}/{text_hex}` format.
- Example: `https://placehold.co/1600x900/1a3a6a/ffffff.png`
- Always include appropriate `alt` text.
- Logo is the ONLY exception — use `https://moha.gov.lk/web/templates/temp-moha/images/new/logo.png` as-is.

### GLightbox CDN — Important
**Never use** the GitHub raw URL pattern:
```
cdn.jsdelivr.net/gh/mcstudios/glightbox/dist/js/glightbox.min.js  ❌
```
**Always use** the npm versioned URL:
```
cdn.jsdelivr.net/npm/glightbox@3.3.0/dist/js/glightbox.min.js     ✅
```

## Unicode & Code Quality

### Encoding Rules (CRITICAL)
1. **All HTML files** must be saved as **UTF-8 without BOM**.
2. **Every HTML file** MUST include `<meta charset="UTF-8">` in the `<head>` as the first meta tag.
3. **NEVER convert native Unicode characters** (Sinhala `ශ්රී ලංකා`, Tamil `இலங்கை`, em dashes `—`, bullets `·`, ellipsis `…`) into HTML entities or JS escape sequences.
   - ✅ Correct: `<p>ශ්රී ලංකා ප්‍රජාතාන්ත්‍රික — 75+ වසර</p>`
   - ❌ Wrong: `<p>&#3521;&#3524;&#3538;&#3439; &#3221;&#3206;&#3405;&#3256; — 75+ &#3626;&#3256;&#3634;</p>`
4. **When reading/writing files programmatically**, always use `[System.IO.File]::ReadAllText($path, [System.Text.Encoding]::UTF8)` and `[System.IO.File]::WriteAllText($path, $content, [System.Text.Encoding]::UTF8)` in PowerShell.
5. **Never use PowerShell `-replace`** with literal `\n` in replacement strings — use actual newlines or backtick-escaped `` `n ``.
6. **Never use `Out-File` or `Set-Content`** — they can corrupt UTF-8 encoding on PowerShell 5.1.
7. **Verify after any batch operation** by spot-checking a few files for garbled characters (e.g., `â€“` instead of `—`).

### HTML Structure Rules
```html
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  ...
</head>
<body>
  ...
</body>
</html>
```
- All tags must be properly closed.
- No unclosed `<div>`, `<li>`, `<span>`, or `<a>` tags.
- Every page must be self-contained and work when opened directly from `file://` protocol.

### Font & Unicode Support
- Font stack: `'Inter', 'Segoe UI', system-ui, sans-serif`
- Inter from Google Fonts supports extended Latin, Cyrillic, Greek, and Vietnamese.
- For full Sinhala/Tamil support, `system-ui` falls back to OS fonts (Iskoola Pota, Nirmala UI, etc.).
- No custom `@font-face` declarations — rely on Google Fonts and system fallbacks.
- `lang="en"` on `<html>` is acceptable since the template is primarily English with occasional native language text.

### Naming Conventions
- **SCSS partials**: `_component-name.scss` (snake-case)
- **CSS classes**: kebab-case (Tailwind standard)
- **JS functions/vars**: camelCase
- **HTML files**: kebab-case.html
- **WP template files**: `front-page.php`, `page.php`, `single.php` (WordPress standard)
- **IDs**: camelCase (e.g., `pageLoader`, `tickerTrack`)

### File Edit Workflow
1. **NEVER use PowerShell** `[IO.File]::WriteAllText` or batch `-replace` loops — these corrupt Unicode content.
2. Use the `edit` tool for targeted string replacements on individual files.
3. Use `git restore .` to revert all local changes and recover original UTF-8 content from the committed state if corruption occurs.
4. Verify using `git diff` after any batch operation before committing.

### Batch Operations (when unavoidable)
If a cross-file change is absolutely necessary:
1. First create a backup via `git stash` or `git commit`.
2. Test the regex/replacement on a SINGLE file first.
3. Verify the output manually.
4. Only then apply to the full set.
5. Immediately verify 3-5 files for encoding corruption.

## Definition of Done

A task is complete when:

### For Individual Page Changes
- [ ] All font classes match the template convention (`text-xs`, `font-bold`, etc.)
- [ ] All icon classes use the `fas` prefix
- [ ] Unicode content is verified — no garbled characters, no HTML-entity-ified Sinhala/Tamil text
- [ ] The page opens without errors in Chrome from `file://` protocol
- [ ] No console errors (JS, missing resources, CORS)
- [ ] GLightbox links use npm versioned URL (`@3.3.0`)

### For SCSS/CSS Changes
- [ ] Edit made to the correct `scss/_partial.scss` file, NOT `css/style.css`
- [ ] `npm run build:css` runs without errors
- [ ] `css/style.css` is updated and minified
- [ ] No green hex values (`#43c000`, `-green-` Tailwind classes) introduced
- [ ] Slide-bg uses opacity transition, not display toggle

### For JS Changes
- [ ] uses `jQuery(function ($) { ... })` wrapper (not `$(document).ready`)
- [ ] No `defer` attribute on `main.js` script tag
- [ ] Tab toggles use `border-gold`/`text-gold` classes
- [ ] All `$` usage is inside the jQuery callback

### For Batch/Cross-File Changes
- [ ] Tested on one file first
- [ ] No encoding corruption (spot-check 3-5 files)
- [ ] `git diff` reviewed before commit
- [ ] README.md and docs/index.html updated if applicable

## Workflow Commands Reference

```bash
# Build CSS from SCSS
npm run build:css

# Watch SCSS for changes
npm run watch:css

# Check git status
git status

# Discard local changes (recover from git)
git restore .

# Pull latest from remote
git pull origin dev

# Push changes
git add .; git commit -m "message"; git push origin dev
```

---

## Project State / Anchored Summary

> This section records the current build state so a fresh agent session knows what has been done and what is pending — no need to re-read every file.

### Goal
Deliver a complete static HTML template foundation for the Ministry of Home Affairs website, convertible to a WordPress theme. Gold color scheme enforced across all files.

### What Has Been Built

**HTML Templates (52 content pages + 11 WP hierarchy pages):**
- Complete page set: about, who-we-are, the-ministry, governance, divisions (9 division sub-pages), institutions (district-secretariats, divisional-secretariats, grama-niladhari, registrar-general), services (e-services, circuit-bungalow, other-services), news, media, contact, information-center, reports, annual-reports, circulars, publications, government-calendar, vacancies, downloads, rti, procurement, procurement-notices, bid-documents, special-notices, administrative-services, transfer-procedures, exam-results, scholarships, related-links, privacy-policy, terms-of-use, accessibility, sitemap, index, template, components→docs
- 11 WP hierarchy: front-page, home, single, page, archive, category, tag, search, 404, singular, attachment
- docs/index.html — interactive component library with 23 previews, SCSS/JS docs, customization guide

### Key Decisions Made
- Ticker uses `requestAnimationFrame` continuous scroll (not CSS marquee)
- Hero slider `slide-bg` uses `opacity` crossfade (not `display: none/block`)
- Page loader uses CSS animation fallback + JS override with `!important`
- GLightbox from npm versioned CDN (`@3.3.0`), not GitHub raw
- All gold CSS classes: `text-gold`, `bg-gold`, `border-gold` (no `-custom` suffix)
- Tab JS uses `border-gold`/`text-gold` (not `*-green-custom`)
- main.js wrapped in `jQuery(function ($) { })` for WP noConflict
- `[IO.File]::WriteAllText` with UTF-8 encoding for PowerShell scripts

### Color Scheme
- `$gold: #EFBF04`, `$navy: #0A1931`, `$steel: #2D5F8A`, `$maroon: #801200`
- Zero green (`#43c000` or `-green-` Tailwind classes) anywhere in the codebase

### File Locations
| Path | Contents |
|---|---|
| `HTML/moha-templates/` | All HTML templates, SCSS, JS, CSS, docs, generator script |
| `HTML/moha-templates/scss/` | 11 SCSS partials |
| `HTML/moha-templates/js/main.js` | All JavaScript (jQuery + vanilla) |
| `HTML/moha-templates/css/style.css` | Compiled minified CSS |
| `HTML/moha-templates/docs/index.html` | Documentation & component library |
| `HTML/moha-templates/generate-wp-pages.ps1` | WP page generator script |

### Current Git State
- Branch: `dev`
- Remote: `origin` → `https://github.com/SilentDeveloper123/moha-templates.git`
- Last commit: gold color scheme applied, GLightbox CDN updated, hero slider opacity fix, page loader !important fix, main.js jQuery wrapper

### Known Pending Items
- Commit `AGENTS.md` and `.github/copilot-instructions.md` to the repo so they survive fresh pulls
- Test all pages in browser for console errors
- Push latest changes to GitHub
