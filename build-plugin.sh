#!/usr/bin/env bash
# build-plugin.sh — pack the tracked plugin source into an installable .plugin.
# The unpacked source under plugins/<name>/ is the single source of truth;
# the .plugin at repo root is a build artifact, regenerated here. No drift.
set -euo pipefail

NAME="${1:-solo-project-manager}"
SRC="plugins/${NAME}"
OUT="${NAME}.plugin"

cd "$(dirname "$0")"

if [ ! -f "${SRC}/.claude-plugin/plugin.json" ]; then
  echo "error: ${SRC}/.claude-plugin/plugin.json not found — is '${NAME}' a valid plugin source?" >&2
  exit 1
fi

# Validate the manifest parses before packing.
python3 -m json.tool "${SRC}/.claude-plugin/plugin.json" >/dev/null

rm -f "${OUT}"
# Zip the CONTENTS of the source dir (so paths start at .claude-plugin/, not plugins/<name>/).
( cd "${SRC}" && zip -rq -X "../../${OUT}" . -x '.DS_Store' -x '*/.DS_Store' )

echo "built ${OUT} from ${SRC}"
unzip -l "${OUT}" | tail -n +2 | head -1
echo "skills packed:"
unzip -l "${OUT}" | grep -oE 'skills/[a-z-]+/SKILL.md' | sort -u
