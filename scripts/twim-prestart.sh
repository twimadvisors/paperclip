#!/bin/sh
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
  "database.backup": {
    "enabled": false
  }
}
CONF
chown -R node:node /paperclip
echo "Twim config created: mode=postgres"
