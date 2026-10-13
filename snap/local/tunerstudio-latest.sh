#!/bin/sh
# Print "<version> <tarball-url>" for the newest TunerStudio MS Linux release
# listed on the EFI Analytics download page.
#
# Shared by snapcraft.yaml (override-pull) and the GitHub workflows so the
# scraping logic lives in exactly one place.
set -eu

BASE_URL="${TUNERSTUDIO_DOWNLOAD_URL:-https://www.efianalytics.com/TunerStudio/download/}"

PAGE=$(curl -fsSL --retry 5 --retry-delay 5 "$BASE_URL")

# Match the Linux tarball by name rather than relying on its position on the
# page, and pick the highest version if more than one is listed.
TARBALL=$(printf '%s\n' "$PAGE" \
  | grep -oE 'TunerStudioMS_v[0-9]+(\.[0-9]+)+\.tar\.gz' \
  | sort -uV \
  | tail -n1)

if [ -z "$TARBALL" ]; then
  echo "error: no TunerStudioMS_v*.tar.gz link found on $BASE_URL" >&2
  exit 1
fi

VERSION=$(printf '%s\n' "$TARBALL" | sed -E 's/^TunerStudioMS_v(.+)\.tar\.gz$/\1/')

printf '%s %s%s\n' "$VERSION" "$BASE_URL" "$TARBALL"
