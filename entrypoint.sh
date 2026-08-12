#!/bin/bash
if [ ! -f /usr/local/bin/xray ]; then
    curl -L https://github.com/XTLS/Xray-core/releases/latest/download/Xray-linux-64.zip -o xray.zip
    unzip xray.zip xray -d /usr/local/bin/
    chmod +x /usr/local/bin/xray
    rm -rf xray.zip geoip.dat geosite.dat
fi

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
