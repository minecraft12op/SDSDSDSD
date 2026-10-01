FROM ubuntu:22.04

ENV DEBIAN_FRONTEND=noninteractive

# Docker, Node.js v20 aur system tools install karein
RUN apt-get update && apt-get install -y \
    curl \
    git \
    iptables \
    ca-certificates \
    docker.io \
    socat \
    net-tools \
    procps && \
    curl -fsSL https://deb.nodesource.com/setup_20.x | bash - && \
    apt-get install -y nodejs && \
    npm install -g pm2 && \
    rm -rf /var/lib/apt/lists/*

WORKDIR /app

# Code copy aur dependencies install
COPY . .
RUN npm install

# Execution permission
RUN chmod +x start.sh

ENTRYPOINT ["./start.sh"]
