#!/usr/bin/env bash
# build-plugin.sh — pack the plugin source into an installable .plugin file.
# plugin/ is the single source of truth; the .plugin at repo root is a build
# artifact, regenerated here. No drift.
set -euo pipefail

NAME="ai-chief-of-staff"
SRC="plugin"
OUT="${NAME}.plugin"

cd "$(dirname "$0")"

if [ ! -f "${SRC}/.claude-plugin/plugin.json" ]; then
  echo "error: ${SRC}/.claude-plugin/plugin.json not found" >&2
  exit 1
fi

# Validate the manifest parses before packing.
python3 -m json.tool "${SRC}/.claude-plugin/plugin.json" >/dev/null

rm -f "${OUT}"
# Zip the CONTENTS of the source dir (so paths start at .claude-plugin/, not plugin/).
( cd "${SRC}" && zip -rq -X "../${OUT}" . -x '.DS_Store' -x '*/.DS_Store' )

echo "built ${OUT} from ${SRC}/"
echo "skills packed:"
unzip -l "${OUT}" | grep -oE 'skills/[a-z-]+/SKILL.md' | sort -u
