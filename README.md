# MOHA Templates — Ministry of Home Affairs, Sri Lanka

Static HTML template set for the **Ministry of Home Affairs, Public Administration & Disaster Management — Sri Lanka**. Includes 52 regular content pages plus 11 WordPress template hierarchy pages.

## Project Structure

```
moha-templates/
├── *.html                    # 52 regular content pages
├── archive.html              # WordPress template hierarchy pages (11)
├── front-page.html
├── home.html
├── single.html
├── page.html
├── category.html
├── tag.html
├── search.html
├── 404.html
├── singular.html
├── attachment.html
├── scss/                     # SCSS source files
│   ├── style.scss            #   Main entry (imports all partials)
│   ├── _variables.scss       #   Colors, fonts, breakpoints
│   ├── _loader.scss          #   Page loader
│   ├── _topbar.scss          #   Top bar
│   ├── _ticker.scss          #   News ticker
│   ├── _hero.scss            #   Hero slider
│   ├── _banner.scss          #   Page banners
│   ├── _components.scss      #   Buttons, cards, nav, footer, etc.
│   ├── _lightbox.scss        #   GLightbox overrides
│   └── _responsive.scss      #   Media queries
├── css/
│   └── style.css             # Compiled CSS (compressed, no sourcemap)
├── js/
│   └── main.js               # jQuery-based: page loader, ticker,
│                             #   mobile menu, hero slider, accordion,
│                             #   counter, secondary menu, lightbox
├── docs/
│   └── index.html            # Template documentation & component library
├── generate-wp-pages.ps1     # PowerShell generator for WP hierarchy pages
├── secondary-menu.html       # Floating secondary menu markup
├── package.json              # npm scripts for Sass compilation
└── README.md
```

## Getting Started

Open any `.html` file in a browser. All pages are self-contained static HTML with CDN-hosted dependencies (Tailwind, Font Awesome, jQuery, GLightbox).

### CSS Compilation (if editing SCSS)

```bash
npm install
npm run build:css     # Production build (compressed)
npm run dev:css       # Development build (expanded + sourcemap)
npm run watch:css     # Watch mode
```

## Dependencies

- **Tailwind CSS** (CDN) — utility-first CSS framework
- **Font Awesome 6** (CDN) — icon library
- **jQuery 3.7** (CDN) — DOM manipulation
- **GLightbox** (CDN) — lightbox gallery
- **Sass** (dev) — CSS preprocessor

## Page Features

| Feature | Description |
|---|---|
| **Page Loader** | Navy full-screen loader with green spinner, auto-hides after 3.5s via CSS fallback |
| **Top Bar** | Contact info, language switcher, special notices |
| **Header Nav** | Dropdown menus: About, Divisions, Institutions, Services, Procurement |
| **Mobile Nav** | Accordion-based off-canvas menu with same structure |
| **Secondary Menu** | Floating "More" panel (mobile/tablet) for quick links |
| **Hero Slider** | Full-width rotating banner on index page |
| **News Ticker** | Continuous horizontal scroll via `requestAnimationFrame` |
| **Page Banner** | Gradient overlay with breadcrumbs per page |
| **Footer** | 4-column: branding, links, inquiry form, map + open hours |
| **Back to Top** | Fixed green button, appears on scroll |
| **Lightbox** | GLightbox for image/video gallery |
| **Scroll Animations** | Fade-in on scroll via IntersectionObserver |
| **Counter Animation** | Incrementing stat numbers on scroll |

## WordPress Integration

The 11 WordPress template hierarchy pages are generated from `generate-wp-pages.ps1`. They include the full MOHA structure plus a secondary floating menu for mobile/tablet.

```powershell
# Regenerate all WP template pages
.\generate-wp-pages.ps1
```

After regeneration, the secondary menu is inserted automatically. Regenerate and rebuild if you modify the base template structure.

## Key Notes

- `style.css` is a **compiled artifact** — always edit `.scss` files, never `style.css` directly
- Logo uses the live URL `https://moha.gov.lk/.../logo.png` — excluded from placeholder replacement
- Placeholder images use `https://placehold.co/`
- All HTML files share a consistent component structure for easy WordPress theming
- Browser `file://` protocol is supported — the CSS page loader animation auto-hides after 3.5 seconds without JavaScript

## Page List

### Main Content Pages (52)
index, about, who-we-are, the-ministry, governance, divisions, division-administration, division-home-affairs, division-finance, division-planning, division-development, division-engineering, division-regional-admin-reforms, division-internal-audit, division-investigation, institutions, district-secretariats, divisional-secretariats, grama-niladhari, registrar-general, services, e-services, circuit-bungalow, other-services, news, media, contact, circulars, publications, government-calendar, vacancies, downloads, rti, annual-reports, procurement, procurement-notices, bid-documents, special-notices, administrative-services, transfer-procedures, exam-results, scholarships, information-center, related-links, privacy-policy, terms-of-use, accessibility, sitemap, reports, search, template, components

### WordPress Hierarchy Pages (11)
front-page, home, single, page, archive, category, tag, search, 404, singular, attachment

## Developer

Built with HTML, SCSS, jQuery, and Tailwind CSS. Designed for conversion to WordPress by matching the standard template hierarchy.
