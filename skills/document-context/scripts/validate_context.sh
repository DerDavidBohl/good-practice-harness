#!/usr/bin/env bash
set -euo pipefail

context_dir="${1:-context}"
errors=0

error() {
  printf 'ERROR: %s\n' "$1"
  errors=$((errors + 1))
}

id_prefix_pattern='REQ|ADR|COD|QUA|SEC|UX|CLR'

for custom_prefix in "${@:2}"; do
  if [[ ! "$custom_prefix" =~ ^[A-Z][A-Z0-9]*$ ]]; then
    printf 'ERROR: invalid additional ID prefix: %s\n' "$custom_prefix"
    exit 1
  fi
  if [[ "|$id_prefix_pattern|" != *"|$custom_prefix|"* ]]; then
    id_prefix_pattern+="|$custom_prefix"
  fi
done

record_ids() {
  local file="$1"
  local include_tables="${2:-true}"
  grep -Eo "\\*\\*ID:[[:space:]]*(${id_prefix_pattern})-[0-9]{3}\\*\\*" "$file" \
    | sed -E 's/^\*\*ID:[[:space:]]*([^*]+)\*\*$/\1/' || true
  [[ "$include_tables" == "true" ]] || return 0
  awk -v prefixes="$id_prefix_pattern" '
    function trim(value) {
      gsub(/^[[:space:]`]+|[[:space:]`]+$/, "", value)
      return value
    }
    /^\|/ {
      count = split($0, cells, "|")
      if (header_column == 0) {
        for (i = 1; i <= count; i++) {
          if (trim(cells[i]) == "ID") {
            header_column = i
            break
          }
        }
      } else {
        id = trim(cells[header_column])
        if (id ~ "^(" prefixes ")-[0-9][0-9][0-9]$") print id
      }
    }
    !/^\|/ { header_column = 0 }
  ' "$file"
}

if [[ ! -d "$context_dir" ]]; then
  error "missing context directory: $context_dir"
  exit 1
fi

[[ -f "$context_dir/README.md" ]] || error "missing context README: $context_dir/README.md"

while IFS= read -r -d '' readme; do
  if [[ -n "$(record_ids "$readme" false)" ]]; then
    error "README contains a context record ID: $readme"
  fi
done < <(find "$context_dir" -type f -name 'README.md' -print0)

while IFS= read -r -d '' directory; do
  [[ -f "$directory/README.md" ]] || error "missing context README: $directory/README.md"
  [[ -f "$directory/TEMPLATE.md" ]] || error "missing context template: $directory/TEMPLATE.md"
done < <(find "$context_dir" -mindepth 1 -maxdepth 1 -type d -print0)

declare -A ids
while IFS= read -r -d '' file; do
  [[ "$(basename "$file")" == "README.md" || "$(basename "$file")" == "TEMPLATE.md" ]] && continue
  file_ids="$(record_ids "$file")"
  if [[ -z "$file_ids" ]]; then
    error "record file has no context record ID: $file"
    continue
  fi
  while IFS= read -r record_id; do
    [[ -n "$record_id" ]] || continue
    if [[ -n "${ids[$record_id]:-}" && "${ids[$record_id]}" != "$file" ]]; then
      error "duplicate record ID $record_id: ${ids[$record_id]} and $file"
    else
      ids[$record_id]="$file"
    fi
  done < <(printf '%s\n' "$file_ids" | sort -u)
done < <(find "$context_dir" -type f -name '*.md' -print0)

if (( errors > 0 )); then
  exit 1
fi

printf 'Context structure validation passed: %s\n' "$context_dir"
