#!/usr/bin/env bash
set -euo pipefail

SITE_DIR="_site"
EXIT_CODE=0

# ── 1. Jekyll build ──────────────────────────────────────────────
echo "==> Running Jekyll build..."
if build_output=$(bundle exec jekyll build 2>&1); then
  echo "    Build succeeded."
else
  echo "    BUILD FAILED (exit $?)"
  echo "$build_output"
  exit 1
fi

# Report any warnings from build output
warnings=$(echo "$build_output" | grep -i "warn" || true)
if [ -n "$warnings" ]; then
  echo ""
  echo "==> Build warnings:"
  echo "$warnings"
fi

# ── 2. Check for broken local image references ──────────────────
echo ""
echo "==> Scanning for broken local image references in $SITE_DIR..."

broken=0
while IFS= read -r html_file; do
  # Extract src= and href= values pointing to local images
  grep -oE '(src|href)="(/[^"]*\.(png|jpg|jpeg|gif|webp|svg))"' "$html_file" 2>/dev/null | \
    sed -E 's/(src|href)="([^"]*)"/\2/' | while IFS= read -r img_path; do
      local_path="${SITE_DIR}${img_path}"
      if [ ! -f "$local_path" ]; then
        echo "    BROKEN: $img_path"
        echo "      in: ${html_file#$SITE_DIR/}"
        broken=1
        EXIT_CODE=1
      fi
    done
done < <(find "$SITE_DIR" -name "*.html" -type f)

if [ "$broken" -eq 0 ]; then
  echo "    No broken local image references found."
fi

# ── 3. Summary ───────────────────────────────────────────────────
echo ""
if [ "$EXIT_CODE" -eq 0 ]; then
  echo "==> All checks passed."
else
  echo "==> Issues found (see above)."
fi

exit $EXIT_CODE
