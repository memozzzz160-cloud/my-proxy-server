#!/bin/sh
cat <<EOF > /etc/xray/config.json
{
  "inbounds": [{
    "port": 8080,
    "protocol": "vless",
    "settings": {
      "clients": [{ "id": "${UUID}", "flow": "xtls-rprx-vision" }],
      "decryption": "none"
    },
    "streamSettings": {
      "network": "ws",
      "wsSettings": { "path": "${PATH}" }
    }
  }],
  "outbounds": [{ "protocol": "freedom" }]
}
EOF
xray -config /etc/xray/config.json
