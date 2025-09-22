#!/usr/bin/env bash
# sync-agents.sh — copy the canonical AGENTS.md into user-defined destinations.
# This script is safe to publish; users provide their own target list.

set -euo pipefail

usage() {
  cat <<'HELP'
Usage: scripts/sync-agents.sh [options]

Options:
  --apply                Perform the copy (default: dry run).
  --src PATH             Source AGENTS.md to distribute (default: repo root AGENTS.md).
  --target PATH          Append a single target path; may be repeated.
  --targets-file PATH    Read newline-separated targets ("#" starts a comment).
  --help                 Show this help text.

Examples:
  scripts/sync-agents.sh --targets-file targets.txt
  scripts/sync-agents.sh --apply --target "$HOME/project/AGENTS.md"
HELP
}

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
REPO_ROOT="$(cd "$SCRIPT_DIR/.." && pwd)"
SRC="$REPO_ROOT/AGENTS.md"
APPLY=0
TARGETS=()

# parse arguments
while [[ $# -gt 0 ]]; do
  case "$1" in
    --apply)
      APPLY=1
      shift
      ;;
    --src)
      [[ $# -lt 2 ]] && { echo "ERROR: --src requires a path" >&2; exit 1; }
      SRC="$2"
      shift 2
      ;;
    --target)
      [[ $# -lt 2 ]] && { echo "ERROR: --target requires a path" >&2; exit 1; }
      TARGETS+=("$2")
      shift 2
      ;;
    --targets-file)
      [[ $# -lt 2 ]] && { echo "ERROR: --targets-file requires a path" >&2; exit 1; }
      FILE="$2"
      if [[ ! -f "$FILE" ]]; then
        echo "ERROR: targets file not found: $FILE" >&2
        exit 1
      fi
      while IFS= read -r line || [[ -n "$line" ]]; do
        trimmed="$(printf '%s' "$line" | sed 's/^[[:space:]]*//; s/[[:space:]]*$//')"
        [[ -z "$trimmed" || "$trimmed" == \#* ]] && continue
        TARGETS+=("$trimmed")
      done < "$FILE"
      shift 2
      ;;
    --help)
      usage
      exit 0
      ;;
    *)
      echo "ERROR: Unknown option: $1" >&2
      usage
      exit 1
      ;;
  esac
done

if [[ ! -f "$SRC" ]]; then
  echo "ERROR: Source not found: $SRC" >&2
  exit 1
fi

if [[ ${#TARGETS[@]} -eq 0 ]]; then
  echo "ERROR: No targets provided. Use --target or --targets-file." >&2
  exit 1
fi

# deduplicate targets while preserving order
declare -A seen
uniq_targets=()
for target in "${TARGETS[@]}"; do
  if [[ -z "${seen[$target]:-}" ]]; then
    uniq_targets+=("$target")
    seen[$target]=1
  fi
done
TARGETS=("${uniq_targets[@]}")

TIMESTAMP=$(date +%Y%m%d-%H%M%S)
UPDATED=0
SKIPPED=0
MISSING=0
FAILED=0

for TARGET in "${TARGETS[@]}"; do
  if [[ ! -e "$TARGET" ]]; then
    echo "MISSING: $TARGET"
    ((MISSING++))
    continue
  fi

  if cmp -s "$SRC" "$TARGET" 2>/dev/null; then
    echo "SKIP (identical): $TARGET"
    ((SKIPPED++))
    continue
  fi

  if [[ $APPLY -eq 1 ]]; then
    BACKUP="${TARGET}.bak.${TIMESTAMP}"
    if ! cp -p "$TARGET" "$BACKUP" 2>/dev/null; then
      echo "Backup failed: $TARGET (check permissions)" >&2
      ((FAILED++))
      continue
    fi
    if cp "$SRC" "$TARGET"; then
      echo "UPDATED -> $TARGET (backup: $BACKUP)"
      ((UPDATED++))
    else
      echo "Update failed: $TARGET" >&2
      ((FAILED++))
    fi
  else
    echo "DRY RUN would update: $TARGET"
  fi

done

if [[ $APPLY -eq 1 ]]; then
  echo "Done. Updated: $UPDATED, Skipped: $SKIPPED, Missing: $MISSING, Failed: $FAILED."
else
  echo "Dry run complete. Differences: $(( ${#TARGETS[@]} - SKIPPED - MISSING ))."
fi
