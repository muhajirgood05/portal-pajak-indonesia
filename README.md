# portal-pajak-indonesia

This template should help get you started developing with Vue 3 in Vite.

## Recommended IDE Setup

[VSCode](https://code.visualstudio.com/) + [Volar](https://marketplace.visualstudio.com/items?itemName=Vue.volar) (and disable Vetur).

## Type Support for `.vue` Imports in TS

TypeScript cannot handle type information for `.vue` imports by default, so we replace the `tsc` CLI with `vue-tsc` for type checking. In editors, we need [Volar](https://marketplace.visualstudio.com/items?itemName=Vue.volar) to make the TypeScript language service aware of `.vue` types.

## Customize configuration

See [Vite Configuration Reference](https://vite.dev/config/).

## Project Setup

```sh
npm install
```

### Compile and Hot-Reload for Development

```sh
npm run dev
```

### Type-Check, Compile and Minify for Production

```sh
npm run build
```

### Lint with [ESLint](https://eslint.org/)

```sh
npm run lint
```

## Deploy (GitHub Actions)

This repository contains a GitHub Actions workflow that builds the site and rsyncs `dist/` to your server when commits are pushed to `main` or when the workflow is manually dispatched.

Required repository secrets:
- `DEPLOY_KEY` — SSH private key (PEM format) for the deploy user (keep this secret).
- `DEPLOY_HOST` — server IP or hostname (e.g. `146.190.90.12`).
- `DEPLOY_USER` — SSH user (e.g. `root` or a deploy user).
- `DEPLOY_PATH` — destination path on the server (e.g. `/var/www/portal-pajak/html`).

You can add these secrets with the GitHub CLI (`gh`) or use the included `github-set-secrets.sh` script.

Using gh (recommended):

```sh
gh auth login
gh secret set DEPLOY_KEY --body-file ~/.ssh/portal_pajak_deploy --repo muhajirgood05/portal-pajak-indonesia
gh secret set DEPLOY_HOST --body "146.190.90.12" --repo muhajirgood05/portal-pajak-indonesia
gh secret set DEPLOY_USER --body "root" --repo muhajirgood05/portal-pajak-indonesia
gh secret set DEPLOY_PATH --body "/var/www/portal-pajak/html" --repo muhajirgood05/portal-pajak-indonesia
```

Using the helper script:

1. Create a PAT with `repo` scope and export it:

```sh
export GITHUB_TOKEN="ghp_xxx..."
chmod +x github-set-secrets.sh
./github-set-secrets.sh
```

The script will encrypt and upload the secrets to your repo.

Once secrets exist, push to `main` or run the workflow manually from the Actions tab to deploy.
