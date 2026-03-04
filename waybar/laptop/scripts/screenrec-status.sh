#!/usr/bin/env bash
if pgrep -x wf-recorder >/dev/null 2>&1; then
  echo "REC ●"
else
  echo ""
fi
