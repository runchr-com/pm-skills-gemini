#!/usr/bin/env bash
set -euo pipefail

REPO_URL="https://github.com/phuryn/pm-skills"
ARCHIVE_URL="https://codeload.github.com/phuryn/pm-skills/tar.gz/refs/heads/main"
PACKAGE_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
GEMINI_HOME="${PACKAGE_ROOT}/.gemini"
SKILLS_DIR="${GEMINI_HOME}/skills"
COMMANDS_DIR="${GEMINI_HOME}/commands"
TMP_DIR="$(mktemp -d)"
ARCHIVE_PATH="${TMP_DIR}/pm-skills-main.tar.gz"
EXTRACT_DIR="${TMP_DIR}/extract"

cleanup() {
  rm -rf "${TMP_DIR}"
}
trap cleanup EXIT

echo ""
echo "Starting pm-skills-gemini installation"
echo "Installation directory: ${GEMINI_HOME}"
echo ""

mkdir -p "${SKILLS_DIR}" "${COMMANDS_DIR}" "${EXTRACT_DIR}"

echo "1) Downloading upstream pm-skills..."
if command -v curl >/dev/null 2>&1; then
  curl -L "${ARCHIVE_URL}" -o "${ARCHIVE_PATH}"
elif command -v wget >/dev/null 2>&1; then
  wget -O "${ARCHIVE_PATH}" "${ARCHIVE_URL}"
else
  echo "Error: curl or wget is required." >&2
  exit 1
fi

echo "2) Extracting skills from archive..."
tar -xzf "${ARCHIVE_PATH}" -C "${EXTRACT_DIR}"
UPSTREAM_ROOT="$(find "${EXTRACT_DIR}" -maxdepth 1 -type d -name 'pm-skills-*' | head -n 1)"
if [[ -z "${UPSTREAM_ROOT}" ]]; then
  echo "Error: Could not locate upstream repository." >&2
  exit 1
fi

installed_skills=0
for plugin_dir in "${UPSTREAM_ROOT}"/pm-*; do
  if [[ -d "${plugin_dir}/skills" ]]; then
    while IFS= read -r -d '' skill_dir; do
      skill_name="$(basename "${skill_dir}")"
      rm -rf "${SKILLS_DIR}/${skill_name}"
      cp -R "${skill_dir}" "${SKILLS_DIR}/${skill_name}"
      installed_skills=$((installed_skills + 1))
    done < <(find "${plugin_dir}/skills" -mindepth 1 -maxdepth 1 -type d -print0)
  fi
done

echo "3) Syncing project-local Gemini commands..."
find "${PACKAGE_ROOT}/commands" -type f -name '*.toml' -print0 | while IFS= read -r -d '' cmd_file; do
  cp "${cmd_file}" "${COMMANDS_DIR}/$(basename "${cmd_file}")"
done

command_count="$(find "${PACKAGE_ROOT}/commands" -type f -name '*.toml' | wc -l | tr -d ' ')"

echo ""
echo "Installation complete"
echo "- Skills installed:   ${installed_skills} → ${SKILLS_DIR}"
echo "- Commands installed: ${command_count} → ${COMMANDS_DIR}"
echo ""

echo "Next steps"
echo "1. Run Gemini CLI inside this project directory."
echo "2. Try commands like /discover, /strategy, or /write-prd."
echo "3. To update skills from upstream, run ./scripts/sync-upstream.sh."
echo ""

echo "Examples"
echo "  /discover AI meeting summarizer"
echo "  /strategy B2B document collaboration SaaS"
echo "  /write-prd Smart notification system to reduce alert fatigue"
