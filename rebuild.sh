#!/usr/bin/env bash
# Rebuild the CV and website, then (after confirmation) commit and push to deploy.
# Usage: ./rebuild.sh   (works from any directory)
set -euo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
cd "$ROOT"

confirm() {
    local reply
    read -r -p "$1 [y/N] " reply
    [[ "$reply" =~ ^[Yy]$ ]]
}

echo "==> Rebuilding CV (pubman --regenerate)"
if ! pubman --regenerate; then
    echo "CV build failed or was skipped; stopping before website build." >&2
    exit 1
fi

echo
echo "==> Building website"
(cd ajbarrows.github.io && npm run build)

echo
echo "==> Git"
branch="$(git rev-parse --abbrev-ref HEAD)"
if [[ "$branch" != "main" ]]; then
    echo "On branch '$branch', not main; pushing will not deploy."
fi

if [[ -n "$(git status --porcelain)" ]]; then
    git status --short
    echo
    if confirm "Commit all of the above?"; then
        read -r -p "Commit message [rebuild CV and website]: " msg
        git add -A
        git commit -m "${msg:-rebuild CV and website}"
    else
        echo "Leaving changes uncommitted."
    fi
else
    echo "Working tree clean."
fi

if ! git rev-parse --abbrev-ref '@{u}' >/dev/null 2>&1; then
    echo "No upstream branch configured; not pushing."
    exit 0
fi

ahead="$(git rev-list --count '@{u}..HEAD')"
if [[ "$ahead" -eq 0 ]]; then
    echo "Nothing to push."
    exit 0
fi

echo
echo "Commits to push to $(git rev-parse --abbrev-ref '@{u}'):"
git log --oneline '@{u}..HEAD'
echo
if confirm "Push and deploy?"; then
    git push
    echo "Pushed. GitHub Actions will deploy the site."
else
    echo "Not pushed."
fi
