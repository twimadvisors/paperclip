#!/bin/sh
set -e
mkdir -p /paperclip/instances/default/data/storage

cat > /paperclip/instances/default/config.json << EOF
{
  "\$meta": {
    "version": 1,
    "updatedAt": "$(date -u +%Y-%m-%dT%H:%M:%SZ)",
    "source": "onboard"
  },
  "server": {
    "host": "0.0.0.0",
    "port": 3100,
    "bind": "lan",
    "deploymentMode": "authenticated"
  },
  "database": {
    "mode": "postgres",
    "connectionString": "${DATABASE_URL}"
  },
  "auth": {
    "baseUrlMode": "explicit",
    "baseUrl": "${PAPERCLIP_AUTH_PUBLIC_BASE_URL}",
    "publicBaseUrl": "${PAPERCLIP_AUTH_PUBLIC_BASE_URL}"
  },
  "secrets": {
    "masterKey": "${PAPERCLIP_SECRETS_MASTER_KEY}"
  },
  "logging": {
    "mode": "file",
    "level": "info"
  },
  "storage": {
    "provider": "local_disk",
    "dir": "/paperclip/instances/default/data/storage"
  }
}
EOF

echo "Twim config created: mode=postgres, auth=explicit, deploymentMode=authenticated"
