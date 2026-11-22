#!/usr/bin/env bash
# Obsidian 볼트의 CV를 Quartz content/ 로 복사하고 GitHub에 올린다.
# 쓰는 법:  ./sync-cv.sh
set -euo pipefail

VAULT_CV="/Users/rlaal/Obsidian/PARA/5_Personal/CV"
REPO="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

if [ ! -f "$VAULT_CV/index.md" ]; then
  echo "볼트에서 CV를 찾지 못했습니다: $VAULT_CV/index.md" >&2
  exit 1
fi

rsync -a --delete --exclude '.obsidian' --exclude '.DS_Store' "$VAULT_CV/" "$REPO/content/"

cd "$REPO"
git add -A
if git diff --cached --quiet; then
  echo "바뀐 것이 없습니다."
  exit 0
fi
git commit -m "docs: update CV ($(date +%Y-%m-%d))"
git push origin main
echo
echo "올렸습니다. 1~2분 뒤 https://rlaalswhd199.github.io/ 에 반영됩니다."
echo "빌드 상태: https://github.com/rlaalswhd199/rlaalswhd199.github.io/actions"
