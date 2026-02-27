#!/usr/bin/env bash
set -euo pipefail

repo_root="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
classic_dir="$repo_root/badges/svg/classic"
illustrated_dir="$repo_root/badges/svg/illustrated"

mkdir -p "$classic_dir" "$illustrated_dir"

write_classic() {
  local key="$1"
  local label="$2"
  local color="$3"

  cat > "$classic_dir/${key}.svg" <<SVG
<svg xmlns="http://www.w3.org/2000/svg" width="320" height="28" role="img" aria-label="Academic level: ${label}">
  <title>Academic level: ${label}</title>
  <rect width="320" height="28" fill="#2f343d" rx="4"/>
  <rect x="138" width="182" height="28" fill="${color}" rx="4"/>
  <rect x="138" width="1" height="28" fill="#000" fill-opacity="0.25"/>
  <text x="69" y="19" fill="#ffffff" font-family="Verdana, DejaVu Sans, sans-serif" font-size="12" text-anchor="middle">academic level</text>
  <text x="229" y="19" fill="#ffffff" font-family="Verdana, DejaVu Sans, sans-serif" font-size="12" font-weight="700" text-anchor="middle">${label}</text>
</svg>
SVG
}

write_illustrated() {
  local key="$1"
  local label="$2"
  local bg1="$3"
  local bg2="$4"
  local accent="$5"
  local ink="$6"
  local icon

  case "$key" in
    earth-worm)
      icon=$(cat <<'ICON'
<g transform="translate(82 82)">
  <path d="M-38 14 C-31 -14, -11 -27, 3 -15 C15 -4, 14 12, 27 14 C44 17, 44 37, 28 39 C14 41, 5 31, -7 32 C-23 33, -43 31, -44 22 C-44 19, -41 16, -38 14 Z" fill="#8b5a2b"/>
  <path d="M-36 21 C-21 26, -4 20, 8 25 C19 29, 32 29, 36 24" fill="none" stroke="#6b3d1f" stroke-width="3" stroke-linecap="round"/>
  <circle cx="-18" cy="6" r="3.2" fill="#ffffff"/>
  <circle cx="-18" cy="6" r="1.4" fill="#111827"/>
</g>
ICON
)
      ;;
    small-dog)
      icon=$(cat <<'ICON'
<g transform="translate(82 83)">
  <ellipse cx="-3" cy="18" rx="33" ry="20" fill="#f7c38f"/>
  <circle cx="27" cy="6" r="14" fill="#f7c38f"/>
  <path d="M19 -2 L10 -16 L28 -9 Z" fill="#e5a56b"/>
  <circle cx="31" cy="4" r="2" fill="#111827"/>
  <circle cx="36" cy="9" r="1.8" fill="#111827"/>
  <rect x="-28" y="33" width="7" height="17" rx="3" fill="#e5a56b"/>
  <rect x="-3" y="34" width="7" height="16" rx="3" fill="#e5a56b"/>
  <path d="M-34 16 C-47 10, -53 -2, -44 -8" fill="none" stroke="#e5a56b" stroke-width="5" stroke-linecap="round"/>
</g>
ICON
)
      ;;
    medium-dog)
      icon=$(cat <<'ICON'
<g transform="translate(82 82)">
  <ellipse cx="0" cy="18" rx="38" ry="23" fill="#d8a46f"/>
  <circle cx="31" cy="4" r="16" fill="#d8a46f"/>
  <path d="M21 -6 L8 -22 L29 -13 Z" fill="#bc7f4e"/>
  <circle cx="36" cy="2" r="2.2" fill="#111827"/>
  <circle cx="42" cy="9" r="2" fill="#111827"/>
  <rect x="-30" y="36" width="8" height="20" rx="3" fill="#bc7f4e"/>
  <rect x="-8" y="36" width="8" height="20" rx="3" fill="#bc7f4e"/>
  <rect x="16" y="36" width="8" height="20" rx="3" fill="#bc7f4e"/>
  <path d="M-40 18 C-57 13, -61 -2, -50 -11" fill="none" stroke="#bc7f4e" stroke-width="6" stroke-linecap="round"/>
  <rect x="7" y="23" width="16" height="6" rx="2" fill="#1f2937"/>
</g>
ICON
)
      ;;
    big-dog)
      icon=$(cat <<'ICON'
<g transform="translate(82 80)">
  <ellipse cx="3" cy="20" rx="42" ry="26" fill="#b9773f"/>
  <circle cx="35" cy="2" r="18" fill="#b9773f"/>
  <path d="M23 -9 L7 -27 L31 -15 Z" fill="#8f582d"/>
  <circle cx="41" cy="0" r="2.4" fill="#111827"/>
  <circle cx="48" cy="10" r="2.2" fill="#111827"/>
  <rect x="-31" y="40" width="9" height="23" rx="3" fill="#8f582d"/>
  <rect x="-9" y="40" width="9" height="23" rx="3" fill="#8f582d"/>
  <rect x="15" y="40" width="9" height="23" rx="3" fill="#8f582d"/>
  <path d="M-44 20 C-61 13, -67 -4, -53 -15" fill="none" stroke="#8f582d" stroke-width="7" stroke-linecap="round"/>
  <path d="M4 -26 L11 -16 L22 -19 L16 -9 L23 1 L11 -4 L0 1 L6 -10 Z" fill="#f59e0b"/>
</g>
ICON
)
      ;;
    t-rex)
      icon=$(cat <<'ICON'
<g transform="translate(84 86)">
  <path d="M-48 20 C-38 -8, -6 -20, 25 -13 C45 -9, 57 2, 53 15 C50 26, 35 27, 22 22 L8 26 L-10 25 L-24 34 L-44 34 Z" fill="#5f9a56"/>
  <path d="M25 -12 C34 -21, 49 -21, 58 -12 C64 -5, 65 8, 56 14 C50 18, 39 18, 32 13" fill="#5f9a56"/>
  <circle cx="47" cy="-5" r="2.8" fill="#111827"/>
  <path d="M54 2 L60 6 L52 8" fill="#ffffff"/>
  <path d="M7 14 L16 8" stroke="#3f6e39" stroke-width="4" stroke-linecap="round"/>
  <path d="M15 18 L24 12" stroke="#3f6e39" stroke-width="4" stroke-linecap="round"/>
  <rect x="-22" y="33" width="9" height="24" rx="3" fill="#3f6e39"/>
  <rect x="0" y="33" width="9" height="24" rx="3" fill="#3f6e39"/>
  <path d="M-50 20 C-67 25, -73 40, -57 47" fill="none" stroke="#3f6e39" stroke-width="8" stroke-linecap="round"/>
</g>
ICON
)
      ;;
    *)
      echo "Unsupported key: $key" >&2
      exit 1
      ;;
  esac

  cat > "$illustrated_dir/${key}.svg" <<SVG
<svg xmlns="http://www.w3.org/2000/svg" width="440" height="140" viewBox="0 0 440 140" role="img" aria-label="Academic level: ${label}">
  <title>Academic level: ${label}</title>
  <defs>
    <linearGradient id="bg-${key}" x1="0" y1="0" x2="1" y2="1">
      <stop offset="0%" stop-color="${bg1}"/>
      <stop offset="100%" stop-color="${bg2}"/>
    </linearGradient>
  </defs>
  <rect x="2" y="2" width="436" height="136" rx="22" fill="url(#bg-${key})" stroke="${accent}" stroke-width="3"/>
  <circle cx="390" cy="22" r="5" fill="${accent}" fill-opacity="0.35"/>
  <circle cx="406" cy="36" r="3" fill="${accent}" fill-opacity="0.35"/>
  <circle cx="372" cy="38" r="2.5" fill="${accent}" fill-opacity="0.35"/>
  <text x="154" y="45" font-family="Trebuchet MS, Verdana, sans-serif" font-size="17" font-weight="700" fill="${ink}">Academic Canine Ladder</text>
  <text x="154" y="84" font-family="Trebuchet MS, Verdana, sans-serif" font-size="29" font-weight="800" fill="${ink}">${label}</text>
  <text x="154" y="111" font-family="Trebuchet MS, Verdana, sans-serif" font-size="14" fill="${ink}">comedic status badge for researchers</text>
  ${icon}
</svg>
SVG
}

write_classic "earth-worm" "earth worm" "#8b5a2b"
write_classic "small-dog" "small dog" "#3b82c4"
write_classic "medium-dog" "medium dog" "#2f855a"
write_classic "big-dog" "big dog" "#c05621"
write_classic "t-rex" "t-rex" "#7f1d1d"

write_illustrated "earth-worm" "earth worm" "#f8ebd7" "#e7cc9f" "#8b5a2b" "#3b2f1f"
write_illustrated "small-dog" "small dog" "#dff1ff" "#afd9ff" "#3b82c4" "#1f3a56"
write_illustrated "medium-dog" "medium dog" "#def7e8" "#aae3c4" "#2f855a" "#1f4f37"
write_illustrated "big-dog" "big dog" "#ffe9d6" "#ffc591" "#c05621" "#66341c"
write_illustrated "t-rex" "t-rex" "#ffe1e1" "#ffabab" "#7f1d1d" "#4a1212"

echo "SVG badges generated in $repo_root/badges/svg"
