FROM alpine:latest
RUN apk add --no-cache socat curl
EXPOSE 8080
CMD ["socat", "TCP-LISTEN:8080,fork", "TCP:keshakanyfacebook.blogspot.com:443"]
