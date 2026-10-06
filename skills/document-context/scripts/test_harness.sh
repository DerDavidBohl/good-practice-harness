#!/usr/bin/env bash
set -euo pipefail

repository_root="$(cd "$(dirname "${BASH_SOURCE[0]}")/../../.." && pwd)"
cd "$repository_root"

command -v jq >/dev/null || {
  printf '%s\n' 'ERROR: jq is required to validate plugin.json.' >&2
  exit 1
}

jq -e '.name and .version and .description' plugin.json >/dev/null

skill_directories="$(while IFS= read -r -d '' skill_file; do basename "$(dirname "$skill_file")"; done < <(find skills -mindepth 2 -maxdepth 2 -type f -name SKILL.md -print0) | sort)"
documented_skills="$(awk -F'|' '/^\| `[^`]+` \|/ { gsub(/[ `]/, "", $2); print $2 }' README.md | sort)"
if [[ "$skill_directories" != "$documented_skills" ]]; then
  printf '%s\n' 'ERROR: README skill inventory does not match skills/*/SKILL.md.' >&2
  diff -u <(printf '%s\n' "$skill_directories") <(printf '%s\n' "$documented_skills") || true
  exit 1
fi

while IFS= read -r skill_file; do
  directory_name="$(basename "$(dirname "$skill_file")")"
  declared_name="$(sed -nE 's/^name:[[:space:]]*([^[:space:]]+)[[:space:]]*$/\1/p' "$skill_file" | head -n 1)"
  declared_description="$(sed -nE 's/^description:[[:space:]]*(.*)$/\1/p' "$skill_file" | head -n 1)"
  if [[ "$declared_name" != "$directory_name" || -z "$declared_description" ]]; then
    printf 'ERROR: invalid skill metadata in %s\n' "$skill_file" >&2
    exit 1
  fi
done < <(find skills -mindepth 2 -maxdepth 2 -type f -name SKILL.md -print | sort)

bash skills/document-context/scripts/validate_context.sh context
bash skills/document-context/scripts/test_validate_context.sh
printf '%s\n' 'Harness checks passed.'