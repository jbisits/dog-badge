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
<g transform="translate(84 84)">
  <path d="M-44 18 C-35 -17, 3 -24, 21 -8 C32 2, 31 18, 43 20 C55 22, 58 40, 44 46 C31 51, 18 43, 7 43 C-5 43, -20 49, -34 44 C-49 39, -51 25, -44 18 Z" fill="#8b5a2b"/>
  <path d="M-37 24 C-24 30, -10 24, 1 29 C11 34, 26 34, 34 28" fill="none" stroke="#6b3d1f" stroke-width="3" stroke-linecap="round"/>
  <path d="M-20 30 C-7 35, 7 30, 16 35 C23 39, 33 39, 38 35" fill="none" stroke="#6b3d1f" stroke-width="3" stroke-linecap="round"/>
  <circle cx="-15" cy="8" r="3.3" fill="#ffffff"/>
  <circle cx="-15" cy="8" r="1.5" fill="#111827"/>
</g>
ICON
)
      ;;
    small-dog)
      icon=$(cat <<'ICON'
<g transform="translate(84 82)">
  <ellipse cx="-4" cy="22" rx="38" ry="22" fill="#f7c38f"/>
  <circle cx="34" cy="11" r="15" fill="#f7c38f"/>
  <ellipse cx="47" cy="16" rx="11" ry="8" fill="#fbe0c4"/>
  <path d="M25 -1 C17 -8, 14 3, 22 11 C29 15, 35 8, 33 1 Z" fill="#e5a56b"/>
  <circle cx="39" cy="9" r="2.1" fill="#111827"/>
  <circle cx="52" cy="16" r="2.2" fill="#111827"/>
  <path d="M50 20 C47 23, 44 23, 41 20" fill="none" stroke="#111827" stroke-width="1.6" stroke-linecap="round"/>
  <rect x="-25" y="38" width="8" height="19" rx="3" fill="#e5a56b"/>
  <rect x="-2" y="38" width="8" height="19" rx="3" fill="#e5a56b"/>
  <path d="M-41 23 C-56 16, -58 1, -46 -9" fill="none" stroke="#e5a56b" stroke-width="6" stroke-linecap="round"/>
  <rect x="18" y="22" width="14" height="6" rx="3" fill="#3b82c4"/>
</g>
ICON
)
      ;;
    medium-dog)
      icon=$(cat <<'ICON'
<g transform="translate(84 81)">
  <ellipse cx="0" cy="24" rx="43" ry="25" fill="#d8a46f"/>
  <circle cx="38" cy="10" r="18" fill="#d8a46f"/>
  <ellipse cx="53" cy="16" rx="13" ry="9" fill="#e8c199"/>
  <path d="M28 -2 C18 -12, 13 1, 21 13 C29 19, 38 11, 36 2 Z" fill="#bc7f4e"/>
  <path d="M40 -5 C48 -14, 54 -4, 49 5" fill="none" stroke="#bc7f4e" stroke-width="5" stroke-linecap="round"/>
  <circle cx="43" cy="8" r="2.3" fill="#111827"/>
  <circle cx="59" cy="16" r="2.4" fill="#111827"/>
  <path d="M56 21 C52 24, 48 24, 45 21" fill="none" stroke="#111827" stroke-width="1.8" stroke-linecap="round"/>
  <rect x="-29" y="41" width="9" height="21" rx="3" fill="#bc7f4e"/>
  <rect x="-6" y="41" width="9" height="21" rx="3" fill="#bc7f4e"/>
  <rect x="17" y="41" width="9" height="21" rx="3" fill="#bc7f4e"/>
  <path d="M-46 24 C-64 16, -65 -2, -52 -14" fill="none" stroke="#bc7f4e" stroke-width="7" stroke-linecap="round"/>
  <rect x="21" y="25" width="17" height="7" rx="3" fill="#2f855a"/>
</g>
ICON
)
      ;;
    big-dog)
      icon=$(cat <<'ICON'
<g transform="translate(84 80)">
  <ellipse cx="4" cy="27" rx="48" ry="28" fill="#b9773f"/>
  <circle cx="42" cy="12" r="20" fill="#b9773f"/>
  <ellipse cx="58" cy="19" rx="15" ry="11" fill="#d09a6a"/>
  <path d="M30 -2 C18 -13, 13 1, 22 15 C30 23, 40 14, 38 3 Z" fill="#8f582d"/>
  <path d="M45 -4 C55 -14, 61 -1, 54 8" fill="none" stroke="#8f582d" stroke-width="6" stroke-linecap="round"/>
  <circle cx="47" cy="9" r="2.4" fill="#111827"/>
  <circle cx="64" cy="20" r="2.7" fill="#111827"/>
  <path d="M61 25 C56 29, 51 29, 47 25" fill="none" stroke="#111827" stroke-width="2.1" stroke-linecap="round"/>
  <ellipse cx="20" cy="30" rx="11" ry="8" fill="#d09a6a"/>
  <rect x="-32" y="45" width="10" height="24" rx="3" fill="#8f582d"/>
  <rect x="-8" y="45" width="10" height="24" rx="3" fill="#8f582d"/>
  <rect x="17" y="45" width="10" height="24" rx="3" fill="#8f582d"/>
  <path d="M-49 27 C-68 18, -70 -2, -55 -16" fill="none" stroke="#8f582d" stroke-width="8" stroke-linecap="round"/>
  <rect x="24" y="30" width="19" height="8" rx="3" fill="#c05621"/>
</g>
ICON
)
      ;;
    t-rex)
      icon=$(cat <<'ICON'
<g transform="translate(86 85)">
  <path d="M-52 24 C-40 -4, -8 -20, 26 -14 C47 -10, 62 2, 60 17 C58 31, 41 34, 24 30 L7 34 L-13 34 L-30 42 L-52 40 Z" fill="#5f9a56"/>
  <path d="M24 -13 C35 -24, 55 -24, 66 -12 C73 -5, 73 10, 62 17 C54 22, 42 22, 32 15" fill="#5f9a56"/>
  <circle cx="53" cy="-5" r="3" fill="#111827"/>
  <path d="M58 3 L67 7 L56 10 Z" fill="#ffffff"/>
  <path d="M8 20 L19 12" stroke="#3f6e39" stroke-width="5" stroke-linecap="round"/>
  <path d="M19 23 L29 16" stroke="#3f6e39" stroke-width="5" stroke-linecap="round"/>
  <rect x="-22" y="40" width="10" height="24" rx="3" fill="#3f6e39"/>
  <rect x="2" y="40" width="10" height="24" rx="3" fill="#3f6e39"/>
  <path d="M-53 26 C-73 34, -80 50, -62 60" fill="none" stroke="#3f6e39" stroke-width="9" stroke-linecap="round"/>
  <path d="M-6 -5 L1 -13 L8 -5 L15 -13 L22 -5" fill="none" stroke="#3f6e39" stroke-width="3" stroke-linecap="round"/>
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
  <text x="170" y="86" font-family="Trebuchet MS, Verdana, sans-serif" font-size="34" font-weight="800" fill="${ink}">${label}</text>
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
