#!/bin/sh
set -e

# If ACCOUNTS_JSON env var is set, decode it and write to config file
if [ ! -z "$ACCOUNTS_JSON" ]; then
    echo "Initializing accounts from environment variable..."
    mkdir -p /root/.config/antigravity-proxy
    echo "$ACCOUNTS_JSON" > /root/.config/antigravity-proxy/accounts.json
    echo "Accounts configuration created."
fi

# Start the application
exec npm start
