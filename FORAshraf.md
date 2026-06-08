# FORAshraf — The Mazaj Link Hub

## The One-Sentence Version

You built a digital business card that lives on the internet — one URL, one QR code, infinite links you can change anytime without reprinting anything.

---

## Why This Exists

Picture a restaurant menu with one QR code on the table. You do not print a separate QR for appetizers, mains, and dessert. You print **one** code that opens a page where people choose where to go.

That is exactly what this project is — except instead of food, it is your website, GitHub, LinkedIn, WhatsApp, Calendly, and whatever else you want people to find.

The genius move: **the QR code never changes**. Only the page behind it does. Update a link on Tuesday, push to GitHub, and every printed card in the wild still works.

---

## Technical Architecture

There is no backend. No database. No build step. No framework. Just files sitting on GitHub's CDN, served to anyone who visits your URL.

```
Someone scans QR
      ↓
Opens https://username.github.io/QR/
      ↓
GitHub Pages serves index.html + style.css
      ↓
User taps a link → leaves your page → lands on GitHub/LinkedIn/WhatsApp/etc.
```

Think of GitHub Pages as a free, globally distributed filing cabinet. You put HTML in the drawer. The world opens the drawer. That is the entire system.

### Why static beats dynamic (for this use case)

| Approach | What happens | Trade-off |
|----------|--------------|-----------|
| **Static page (this project)** | QR → your page → user picks a link | You edit HTML to change links. Free forever. |
| **Dynamic QR service** | QR → their redirect server → your page | Can change destination without reprinting. Often paid for analytics. |
| **Multiple QRs** | One QR per destination | Works, but ugly on a business card and painful to reprint. |

For a developer who can `git push`, static wins. You get "dynamic" behavior (editable links) without paying a QR vendor.

---

## Codebase Structure

```
QR/
├── index.html       ← The whole app. Profile + link cards.
├── style.css        ← Theme variables + layout. Edit colors here.
├── assets/
│   └── favicon.svg  ← Tiny icon in the browser tab.
├── generate-qr.sh   ← Optional: make an SVG QR from the terminal.
├── README.md        ← Deployment checklist.
└── FORAshraf.md     ← You are here.
```

### How the pieces connect

- `index.html` loads `style.css` and `assets/favicon.svg`
- Each link is a plain `<a>` tag with `target="_blank"` and `rel="noopener noreferrer"`
- CSS variables in `:root` control the entire color scheme — change three values, whole site rebrands
- One tiny `<script>` sets the copyright year. That is the only JavaScript.

No bundler. No `node_modules`. No "it works on my machine" deploy drama.

---

## Technologies Used

| Tech | Why |
|------|-----|
| **HTML5** | Universal, accessible, zero dependencies |
| **CSS3** | Custom properties for theming, flexbox for layout |
| **GitHub Pages** | Free HTTPS hosting on a stable `*.github.io` URL |
| **DM Sans** (Google Fonts) | Clean, readable, loads fast |
| **qrencode** (optional) | Generate print-ready SVG QR codes locally |

We deliberately avoided React, Next.js, or any build pipeline. A link page does not need a framework — it needs to load in under a second on a 4G phone someone scanned from a coffee shop.

---

## Technical Decisions (and the arguments against them)

### Decision 1: GitHub Pages over Linktree

**For:** Full control, no branding, no platform lock-in, custom domain support, you own the HTML.

**Against:** You maintain it yourself. Linktree is faster if you literally never want to touch code.

**Verdict:** You are a developer. Own your hub.

### Decision 2: Static QR, not dynamic QR

**For:** Free forever. No vendor dependency. The "dynamic" part is your page, not the QR redirect.

**Against:** If you change the *page URL* (rename repo, switch domains), old QRs break.

**Mitigation:** Pick your repo name and URL once. Never rename it. If you need a redirect layer later, point a custom domain (`go.yourdomain.com`) at GitHub Pages and change DNS targets instead of reprinting.

### Decision 3: Dark theme default

**For:** Looks premium on phones, high contrast for accessibility, matches developer aesthetic.

**Against:** Some brands need light backgrounds for print-adjacent consistency.

**Mitigation:** Flip `--bg` and `--text` in `style.css`. Two lines.

---

## Lessons Learned (and pitfalls to dodge)

### Pitfall 1: Wrong WhatsApp URL format

`https://wa.me/+201234567890` — **broken**.

`https://wa.me/201234567890` — **works**.

Country code, no plus sign, no spaces. WhatsApp is picky.

### Pitfall 2: Renaming the GitHub repo

Your live URL is `https://username.github.io/REPO_NAME/`. Rename the repo → URL changes → every printed QR dies. Choose the name before printing anything.

### Pitfall 3: Forgetting `rel="noopener noreferrer"`

Every external link opens in a new tab. Without `noopener`, the opened page can access `window.opener` — a minor security hole. We included it on every link. Do not remove it.

### Pitfall 4: Low-contrast QR codes

Fancy gradient QRs look cool and scan terribly. For print: dark modules on white background, test on two phones before ordering 500 business cards.

### Pitfall 5: Over-engineering

The temptation to add React, a CMS, analytics middleware, and a contact form API is real. Resist it. This page has one job: get people to the right link in two taps. Ship the simple version first.

---

## How Good Engineers Think About This

1. **Stable interface, mutable implementation** — The QR URL is the API contract. Everything behind it can change.
2. **Optimize for the scanning context** — Thumb-sized screen, spotty Wi-Fi, three seconds of attention. Big tap targets (48px min), clear labels, no clutter.
3. **Own your dependencies** — GitHub Pages and plain HTML have survived every JS framework hype cycle since 2010.
4. **Test the real flow** — Do not just open the page in Chrome. Scan the actual QR with your phone. Tap every link. That is QA.

---

## Best Practices Baked In

- Semantic HTML (`<main>`, `<nav>`, `<header>`, `<footer>`)
- `aria-label` on navigation for screen readers
- `prefers-reduced-motion` respected
- Open Graph meta tags for link previews
- CSS variables for one-place theming
- Mobile-first layout (max-width 420px, thumb-friendly cards)

---

## What To Do Next

1. Edit `index.html` — your name, links, tagline
2. Tweak `style.css` — your brand colors
3. Push to GitHub, enable Pages
4. Generate QR for your live URL
5. Scan it from your phone. Fix anything that feels wrong.
6. Print.

That is the whole playbook. No subscription required.
