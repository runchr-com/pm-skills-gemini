#!/usr/bin/env bash
set -euo pipefail

PACKAGE_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
GEMINI_HOME="${HOME}/.gemini"
SKILLS_DIR="${GEMINI_HOME}/skills"
COMMANDS_DIR="${GEMINI_HOME}/commands"

echo ""
echo "Removing pm-skills-gemini from global Gemini directory..."
echo ""

# Remove commands shipped by this repo
if [[ -d "${PACKAGE_ROOT}/commands" ]]; then
  find "${PACKAGE_ROOT}/commands" -type f -name '*.toml' -print0 | while IFS= read -r -d '' cmd_file; do
    target="${COMMANDS_DIR}/$(basename "${cmd_file}")"
    if [[ -f "${target}" ]]; then
      rm -f "${target}"
      echo "Removed command: ${target}"
    fi
  done
fi

# Remove skills listed in manifest if present
if [[ -f "${PACKAGE_ROOT}/pm-skills-manifest.json" ]]; then
  if command -v python3 >/dev/null 2>&1; then
    python3 - <<'PY' "${PACKAGE_ROOT}/pm-skills-manifest.json" "${SKILLS_DIR}"
import json, sys, os, shutil
manifest_path = sys.argv[1]
skills_dir = sys.argv[2]

with open(manifest_path, "r", encoding="utf-8") as f:
    data = json.load(f)

for item in data.get("skills", []):
    name = item.get("name")
    if not name:
        continue
    path = os.path.join(skills_dir, name)
    if os.path.isdir(path):
        shutil.rmtree(path)
        print(f"Removed skill: {path}")
PY
  else
    echo "python3 not found; skipping manifest-based skill removal."
  fi
fi

echo ""
echo "Uninstall complete."
