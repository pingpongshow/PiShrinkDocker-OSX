FROM alpine:latest

# Install dependencies required by PiShrink
RUN apk add --no-cache \
    bash \
    coreutils \
    e2fsprogs \
    e2fsprogs-extra \
    parted \
    util-linux \
    gzip \
    xz \
    pigz \
    wget \
    file

# Download and install PiShrink
RUN wget -O /usr/local/bin/pishrink.sh \
    https://raw.githubusercontent.com/Drewsif/PiShrink/master/pishrink.sh && \
    chmod +x /usr/local/bin/pishrink.sh

# Create working directory for images
WORKDIR /images

# Default entrypoint
ENTRYPOINT ["/usr/local/bin/pishrink.sh"]

# Default to showing help
CMD ["--help"]
