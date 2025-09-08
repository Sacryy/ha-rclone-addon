ARG BUILD_FROM=arm64v8/debian:bullseye-slim
FROM $BUILD_FROM

RUN apt-get update && apt-get install -y curl unzip && rm -rf /var/lib/apt/lists/*

RUN curl -O https://downloads.rclone.org/rclone-current-linux-arm64.zip && \
    unzip rclone-current-linux-arm64.zip && \
    cp rclone-*-linux-arm64/rclone /usr/bin/rclone && \
    chmod 755 /usr/bin/rclone && \
    rm -rf rclone-current-linux-arm64* 

VOLUME /config

CMD ["rclone", "--version"]
