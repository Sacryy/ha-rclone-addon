# 1️⃣ Základní image pro arm64
ARG BUILD_FROM=arm64v8/debian:bullseye-slim
FROM $BUILD_FROM

# 2️⃣ Metadata pro HA addon (nepovinné, ale někdy se používá)
LABEL maintainer="Sacryy"

# 3️⃣ Instalace potřebných nástrojů a Rclone
RUN apt-get update && \
    apt-get install -y curl unzip ca-certificates && \
    curl -O https://downloads.rclone.org/rclone-current-linux-arm64.zip && \
    unzip rclone-current-linux-arm64.zip && \
    cp rclone-*-linux-arm64/rclone /usr/bin/ && \
    chmod 755 /usr/bin/rclone && \
    rm -rf rclone-*-linux-arm64* && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

# 4️⃣ CMD – spustí Rclone při testu
CMD ["rclone", "--version"]
