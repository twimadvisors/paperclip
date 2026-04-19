#!/bin/sh
set -e
mkdir -p /paperclip/instances/default/data/storage

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
  "auth": {
    "baseUrlMode": "explicit",
    "baseUrl": "https://twim-paperclip-feaf746d.ondigitalocean.app"
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

echo "Twim config created: mode=postgres, auth=explicit"
