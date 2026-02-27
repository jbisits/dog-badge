#!/usr/bin/env bash
set -euo pipefail

repo_root="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$repo_root"

renderer=""
if command -v magick >/dev/null 2>&1; then
  renderer="magick"
elif command -v rsvg-convert >/dev/null 2>&1; then
  renderer="rsvg-convert"
elif command -v inkscape >/dev/null 2>&1; then
  renderer="inkscape"
elif command -v sips >/dev/null 2>&1; then
  renderer="sips"
elif command -v qlmanage >/dev/null 2>&1; then
  renderer="qlmanage"
else
  echo "No supported SVG renderer found (checked: magick, rsvg-convert, inkscape, sips, qlmanage)." >&2
  exit 1
fi

tmp_dir="$(mktemp -d)"
trap 'rm -rf "$tmp_dir"' EXIT

while IFS= read -r svg; do
  rel="${svg#badges/svg/}"
  style="${rel%%/*}"
  base="$(basename "${svg%.svg}")"
  out="badges/png/$style/$base.png"
  mkdir -p "$(dirname "$out")"

  case "$renderer" in
    magick)
      magick -background none "$svg" "$out"
      ;;
    rsvg-convert)
      rsvg-convert "$svg" -o "$out"
      ;;
    inkscape)
      inkscape "$svg" --export-type=png --export-filename="$out" >/dev/null
      ;;
    sips)
      sips -s format png "$svg" --out "$out" >/dev/null
      ;;
    qlmanage)
      qlmanage -t -s 440 -o "$tmp_dir" "$svg" >/dev/null 2>&1
      cp "$tmp_dir/$(basename "$svg").png" "$out"
      ;;
  esac

  echo "Rendered $out"
done < <(find badges/svg -type f -name '*.svg' | sort)

echo "PNG badges rendered using $renderer"
