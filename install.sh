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
echo "pm-skills-gemini 설치를 시작합니다."
echo "설치 위치: ${GEMINI_HOME}"
echo ""

mkdir -p "${SKILLS_DIR}" "${COMMANDS_DIR}" "${EXTRACT_DIR}"

echo "1) upstream pm-skills 다운로드 중..."
if command -v curl >/dev/null 2>&1; then
  curl -L "${ARCHIVE_URL}" -o "${ARCHIVE_PATH}"
elif command -v wget >/dev/null 2>&1; then
  wget -O "${ARCHIVE_PATH}" "${ARCHIVE_URL}"
else
  echo "오류: curl 또는 wget 이 필요합니다." >&2
  exit 1
fi

echo "2) 압축 해제 및 skill 추출 중..."
tar -xzf "${ARCHIVE_PATH}" -C "${EXTRACT_DIR}"
UPSTREAM_ROOT="$(find "${EXTRACT_DIR}" -maxdepth 1 -type d -name 'pm-skills-*' | head -n 1)"
if [[ -z "${UPSTREAM_ROOT}" ]]; then
  echo "오류: upstream 저장소를 찾지 못했습니다." >&2
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

echo "3) 프로젝트 로컬 Gemini commands 동기화 중..."
find "${PACKAGE_ROOT}/commands" -type f -name '*.toml' -print0 | while IFS= read -r -d '' cmd_file; do
  cp "${cmd_file}" "${COMMANDS_DIR}/$(basename "${cmd_file}")"
done

command_count="$(find "${PACKAGE_ROOT}/commands" -type f -name '*.toml' | wc -l | tr -d ' ')"

echo ""
echo "설치 완료"
echo "- Skills:   ${installed_skills}개 → ${SKILLS_DIR}"
echo "- Commands: ${command_count}개 → ${COMMANDS_DIR}"
echo ""
echo "다음 단계"
echo "1. 이 프로젝트 폴더에서 Gemini CLI를 실행하세요."
echo "2. /discover, /strategy, /write-prd 같은 명령을 사용해 보세요."
echo "3. upstream skill을 최신으로 다시 받으려면 ./scripts/sync-upstream.sh 를 실행하세요."
echo ""
echo "예시"
echo "  /discover AI 회의 요약 도구"
echo "  /strategy B2B 문서 협업 SaaS"
echo "  /write-prd 알림 피로도를 줄이는 스마트 알림 기능"
