#!/bin/bash
# start-polkit.sh
# Wrapper script to start polkit authentication agent
# Tries multiple common paths for portability across distributions

POLKIT_PATHS=(
    "/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1"
    "/usr/libexec/polkit-gnome-authentication-agent-1"
    "/usr/lib/polkit-1/polkit-agent-helper-1"
)

for path in "${POLKIT_PATHS[@]}"; do
    if [ -x "$path" ]; then
        exec "$path"
    fi
done

# If we get here, no polkit agent was found
echo "Warning: No polkit authentication agent found in common paths" >&2
exit 1

