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
    if [[ -n "${ids[$record_id]:-}" ]]; then
      error "duplicate record ID $record_id: ${ids[$record_id]} and $file"
    else
      ids[$record_id]="$file"
    fi
  done < <(printf '%s\n' "$file_ids" | sort)
done < <(find "$context_dir" -type f -name '*.md' -print0)

while IFS= read -r -d '' source_file; do
  while IFS= read -r markdown_link; do
    target="${markdown_link##*](}"
    target="${target%)}"
    target="${target%%[[:space:]]*}"
    target="${target#<}"
    target="${target%>}"
    [[ -n "$target" || "$markdown_link" == *"](#"* ]] || continue
    [[ "$target" == http://* || "$target" == https://* || "$target" == mailto:* ]] && continue

    fragment=""
    if [[ "$target" == *#* ]]; then
      fragment="${target#*#}"
      target="${target%%#*}"
    fi

    if [[ -n "$target" ]]; then
      target_file="$(dirname "$source_file")/$target"
      if [[ ! -f "$target_file" ]]; then
        error "missing context link target in $source_file: $target"
        continue
      fi
    else
      target_file="$source_file"
    fi

    if [[ -n "$fragment" ]]; then
      fragment_found=false
      while IFS= read -r heading; do
        slug="$(printf '%s' "$heading" | sed -E 's/^#+[[:space:]]*//; s/`//g' | tr '[:upper:]' '[:lower:]' | sed -E 's/[^a-z0-9_ -]//g; s/[[:space:]]+/-/g; s/-+/-/g; s/^-|-$//g')"
        if [[ "$slug" == "$fragment" ]]; then
          fragment_found=true
          break
        fi
      done < <(grep -E '^#{1,6}[[:space:]]+' "$target_file" || true)
      if [[ "$fragment_found" != true ]]; then
        error "missing context link anchor in $source_file: $target#$fragment"
      fi
    fi
  done < <(grep -oE '\[[^]]*\]\([^)]*\)' "$source_file" || true)
done < <(find "$context_dir" -type f -name '*.md' -print0)

if (( errors > 0 )); then
  exit 1
fi

printf 'Context structure validation passed: %s\n' "$context_dir"
