FROM teddysun/xray
ENV UUID=c9bf9e57-1685-4c89-bafb-ff5af830be1a
ENV PATH=/ws-tunnel-v2
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
