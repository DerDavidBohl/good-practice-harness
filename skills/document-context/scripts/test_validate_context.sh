#!/usr/bin/env bash
set -euo pipefail

script_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
validator="$script_dir/validate_context.sh"
temporary_dir="$(mktemp -d)"
context_dir="$temporary_dir/context"
output_file="$temporary_dir/output"
trap 'rm -rf "$temporary_dir"' EXIT

reset_context() {
  rm -rf "$context_dir"
  mkdir -p "$context_dir/requirements"
  printf '%s\n' '# Context' '[Requirements](requirements/README.md)' > "$context_dir/README.md"
  printf '%s\n' '# Requirements' '[Record](records.md#sample-record)' > "$context_dir/requirements/README.md"
  printf '%s\n' '# Template' > "$context_dir/requirements/TEMPLATE.md"
  printf '%s\n' '### Sample record' '**ID: REQ-001**' > "$context_dir/requirements/records.md"
}

expect_pass() {
  if ! bash "$validator" "$context_dir" > "$output_file" 2>&1; then
    cat "$output_file"
    printf 'FAIL: expected context validation to pass\n' >&2
    return 1
  fi
}

expect_fail() {
  local expected="$1"

  if bash "$validator" "$context_dir" > "$output_file" 2>&1; then
    printf 'FAIL: expected context validation to fail\n' >&2
    return 1
  fi
  if ! grep -Fq "$expected" "$output_file"; then
    cat "$output_file"
    printf 'FAIL: expected error containing: %s\n' "$expected" >&2
    return 1
  fi
}

reset_context
expect_pass

reset_context
printf '%s\n' '[Missing](missing.md)' >> "$context_dir/README.md"
expect_fail 'missing context link target'

reset_context
printf '%s\n' '[Missing anchor](records.md#missing-anchor)' >> "$context_dir/requirements/README.md"
expect_fail 'missing context link anchor'

reset_context
printf '\n%s\n%s\n' '### Duplicate record' '**ID: REQ-001**' >> "$context_dir/requirements/records.md"
expect_fail 'duplicate record ID REQ-001'

reset_context
printf '%s\n' '### Another record' '**ID: REQ-001**' > "$context_dir/requirements/another-record.md"
expect_fail 'duplicate record ID REQ-001'

reset_context
printf '%s\n' '**ID: REQ-002**' >> "$context_dir/README.md"
expect_fail 'README contains a context record ID'

printf '%s\n' 'Context validator tests passed.'