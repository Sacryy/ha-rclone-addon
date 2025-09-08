# Používáme základní image Debian pro arm64
ARG BUILD_FROM=arm64v8/debian:bullseye-slim
FROM $BUILD_FROM

# Základní příkaz pro test
CMD ["echo", "Hello from Rclone GDrive addon"]
