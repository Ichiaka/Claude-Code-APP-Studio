#!/usr/bin/env bash
# Audit trail de subagentes invocados.
set -uo pipefail

mkdir -p production/session-state
DATE=$(date +"%Y-%m-%d %H:%M:%S")
AGENT="${CLAUDE_SUBAGENT_NAME:-unknown}"
echo "$DATE  $AGENT" >> production/session-state/agent-log.txt

exit 0
