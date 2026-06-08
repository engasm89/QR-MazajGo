# Mazaj Link Hub

A minimal, mobile-first "link in bio" page for GitHub Pages. One stable URL, one QR code, all your links.

## Preview locally

Open `index.html` in your browser, or run a quick server:

```bash
# Python 3
python3 -m http.server 8080
# Then visit http://localhost:8080
```

## Customize before deploying

1. **`index.html`** — Update name, tagline, all `href` values, and Open Graph meta tags
2. **`style.css`** — Tweak CSS variables at the top (`--accent`, `--bg`, etc.)
3. **Avatar** — Replace the inline SVG with `<img src="assets/avatar.jpg" alt="Your Name">` in the `.avatar` div
4. **WhatsApp** — Use `https://wa.me/COUNTRYCODEPHONENUMBER` (no `+`, spaces, or dashes)

## Deploy to GitHub Pages

### 1. Create the repository

1. Go to [github.com/new](https://github.com/new)
2. Name it `QR` (or any name — your URL will be `https://USERNAME.github.io/REPO_NAME/`)
3. Set visibility to **Public**
4. Do **not** add a README (you already have one)
5. Click **Create repository**

### 2. Push this folder

```bash
cd "/path/to/QR"
git init
git add .
git commit -m "Add link hub page for GitHub Pages"
git branch -M main
git remote add origin https://github.com/YOUR_USERNAME/QR.git
git push -u origin main
```

### 3. Enable GitHub Pages

1. Repo → **Settings** → **Pages**
2. **Source:** Deploy from a branch
3. **Branch:** `main` → folder `/ (root)` → **Save**
4. Wait 1–3 minutes

Your live URL:

```
https://YOUR_USERNAME.github.io/QR/
```

### 4. (Optional) Custom domain

1. **Settings → Pages → Custom domain** → enter `links.yourdomain.com`
2. At your DNS provider, add a **CNAME** record pointing to `YOUR_USERNAME.github.io`
3. Enable **Enforce HTTPS** once available

## Generate your QR code
Print-ready QR files live in `assets/qr-code.svg` and `assets/qr-code.png`.


Your QR code should point to your **final, stable** GitHub Pages URL.

### Option A — Online (fastest)

- [Canva QR Generator](https://www.canva.com/qr-code-generator/)
- [Hovercode](https://hovercode.com)

Paste `https://YOUR_USERNAME.github.io/QR/` and download PNG or SVG.

### Option B — Script (local)

```bash
./generate-qr.sh "https://YOUR_USERNAME.github.io/QR/"
```

Requires `qrencode` (`brew install qrencode` on macOS).

### Printing tips

- Dark code on light background (or high-contrast inverse)
- Minimum ~2×2 cm when printed small
- Test on iPhone and Android before printing

## File structure

```
QR/
├── index.html          # Main page
├── style.css           # Styles & theme variables
├── assets/
│   └── favicon.svg     # Browser tab icon
├── generate-qr.sh      # Optional QR generator
├── README.md           # This file
└── FORAshraf.md        # Project walkthrough
```

## Updating links later

Edit `index.html`, commit, and push. The QR code stays the same — only the page content changes. That is the whole point of this setup.
