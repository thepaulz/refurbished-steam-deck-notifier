#!/bin/sh
set -e

# Build command arguments array
set -- python notifier.py --webhook-url "${WEBHOOK_URL}" --country-code "${COUNTRY_CODE}"

# Add role mapping if enabled and file exists
if [ "${USE_ROLE_MAPPING}" = "true" ] && [ -f "/app/data/roles.json" ]; then
    set -- "$@" --role-mapping /app/data/roles.json
fi

# Add CSV logging if enabled
if [ "${ENABLE_CSV_LOGGING}" = "true" ]; then
    set -- "$@" --csv-dir /app/data/csv-logs
fi

# Execute the notifier with built arguments
exec "$@"

