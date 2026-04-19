#!/bin/sh
set -e
# Create Paperclip config for external PostgreSQL
mkdir -p /paperclip/instances/default

cat > /paperclip/instances/default/config.json << CONF
{
  "server": {
    "host": "0.0.0.0",
    "port": 3100
  },
  "database": {
    "mode": "postgres",
    "connectionString": "${DATABASE_URL}"
  },
  "secrets": {
    "masterKey": "${PAPERCLIP_SECRETS_MASTER_KEY}"
  },
  "storage": {
    "provider": "local",
    "dir": "/paperclip/instances/default/data/storage"
  }
}
CONF

mkdir -p /paperclip/instances/default/data/storage
echo "Twim config created: mode=postgres, exposure=public"
