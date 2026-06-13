# MOHA Templates — Ministry of Home Affairs, Sri Lanka

Static HTML template set for the **Ministry of Home Affairs, Public Administration & Disaster Management — Sri Lanka**. Includes 52 regular content pages and 11 WordPress template hierarchy pages:

```
front-page.html  →  WordPress front page
home.html        →  Blog/index posts page
single.html      →  Single post
page.html        →  Static page
category.html    →  Category archive
tag.html         →  Tag archive
archive.html     →  Date/other archive
search.html      →  Search results
404.html         →  404 error
singular.html    →  Fallback for single content
attachment.html  →  Media attachment
```

## Project Structure

```
moha-templates/
├── *.html                    # 52 regular content pages
├── front-page.html           # WordPress hierarchy (11)
├── home.html
├── single.html
├── page.html
├── category.html
├── tag.html
├── archive.html
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

## How to Use These Templates

### For Static Hosting (basic)

1. Open any `.html` file directly in a browser — all pages are self-contained
2. All assets are loaded from CDN (Tailwind, Font Awesome, jQuery, GLightbox)
3. No build step required for static use
4. Placeholder images from `https://placehold.co/` — replace with real images before deployment
5. Google Maps embed in the footer — update coordinates as needed

### As WordPress Theme Conversion

1. Each `.html` file maps to a WordPress template hierarchy file
2. **Convert `index.html`** → `header.php`, `footer.php`, `sidebar.php` — extract the common layout shell
3. **Content pages** (about, services, etc.) → `page-{slug}.php`
4. **`front-page.html`** → `front-page.php`
5. **`home.html`** → `home.php`
6. **`single.html`** → `single.php`
7. **`page.html`** → `page.php`
8. **`archive.html`** → `archive.php` (fallback)
9. **`category.html`** → `category.php`
10. **`tag.html`** → `tag.php`
11. **`search.html`** → `search.php`
12. **`404.html`** → `404.php`
13. Replace static content with WordPress loop + ACF/WP Query
14. Replace `css/style.css` with WordPress `style.css` (add theme header comment)

### Regenerating the WP Hierarchy Pages

If you modify the base template (nav, footer, etc.), regenerate all 11 WP files:

```powershell
.\generate-wp-pages.ps1
```

This creates fresh copies. The secondary floating menu is inserted automatically after generation.

## Getting Started (Development)

```bash
npm install
npm run build:css     # Production CSS build (compressed)
npm run dev:css       # Development CSS build (expanded + sourcemap)
npm run watch:css     # Watch SCSS files for changes
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

## Customization Checklist

Before deploying, update:

- [ ] **Logo** — replace with official logo URL
- [ ] **Placeholder images** — replace `https://placehold.co/...` with real images
- [ ] **Google Maps embed** — update coordinates in the footer iframe
- [ ] **Contact info** — phone, email, address throughout all pages
- [ ] **Social media links** — update href attributes in the footer
- [ ] **Meta descriptions** — update `<meta name="description">` per page
- [ ] **Open hours** — update in the footer if different
- [ ] **Copyright year** — update in the footer

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
