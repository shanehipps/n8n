FROM n8nio/n8n:latest

# Install dependencies and Chromium for Puppeteer using apk (Alpine Linux package manager)
USER root
RUN apk update && apk add --no-cache \
    fontconfig \
    ttf-freefont \
    alsa-lib \
    at-spi2-atk \
    atk \
    cairo \
    cups-libs \
    libdrm \
    mesa-gbm \
    nspr \
    nss \
    libxcomposite \
    libxdamage \
    libxrandr \
    xdg-utils \
    chromium

# Tell Puppeteer to use the system-installed Chromium
ENV PUPPETEER_SKIP_CHROMIUM_DOWNLOAD=true
ENV PUPPETEER_EXECUTABLE_PATH=/usr/bin/chromium

# Install n8n-nodes-puppeteer
USER node
RUN npm install n8n-nodes-puppeteer
