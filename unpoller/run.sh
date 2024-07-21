#!/usr/bin/env bash
set -e

CONFIG_PATH=/data/options.json

INFLUXDB_URL=$(jq --raw-output '.influxdb_url' $CONFIG_PATH)
INFLUXDB_TOKEN=$(jq --raw-output '.influxdb_token' $CONFIG_PATH)
INFLUXDB_ORG=$(jq --raw-output '.influxdb_org' $CONFIG_PATH)
INFLUXDB_BUCKET=$(jq --raw-output '.influxdb_bucket' $CONFIG_PATH)
LOG_LEVEL=$(jq --raw-output '.log_level' $CONFIG_PATH)

# Create Unpoller config file
cat <<EOF > /etc/unpoller/up.conf
[unifi.defaults]
delay = "5m"
save_dpi = true
save_sites = true

[influxdb]
server = "$INFLUXDB_URL"
auth_token = "$INFLUXDB_TOKEN"
organization = "$INFLUXDB_ORG"
bucket = "$INFLUXDB_BUCKET"
log_level = "$LOG_LEVEL"
EOF

# Run Unpoller
unpoller -c /etc/unpoller/up.conf
