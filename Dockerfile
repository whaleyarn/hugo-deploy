FROM node:24.12.0-slim

ARG app_version

SHELL ["/bin/bash", "-c"]

RUN apt-get update && apt-get install -y --no-install-recommends \
    curl \
    git \
    unzip \
    bash \
    ca-certificates \
 && curl -sSL -o /tmp/hugo.tar.gz https://github.com/gohugoio/hugo/releases/download/v${app_version}/hugo_extended_${app_version}_linux-amd64.tar.gz \
 && tar -xzf /tmp/hugo.tar.gz -C /tmp \
 && mv /tmp/hugo /usr/local/bin/hugo \
 && chmod +x /usr/local/bin/hugo \
 && rm -rf /var/lib/apt/lists/* /tmp/*

RUN npm install -g wrangler

WORKDIR /app

