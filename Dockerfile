FROM node:20.11.0-alpine@sha256:8e6a472eb9742f4f486ca9ef13321b7fc2e54f2f60814f339eeda2aff3037573 AS development
WORKDIR /usr/src/app
COPY --chown=node:node package*.json ./
RUN npm ci
COPY --chown=node:node . .
USER node

FROM node:20.11.0-alpine@sha256:8e6a472eb9742f4f486ca9ef13321b7fc2e54f2f60814f339eeda2aff3037573 AS build
WORKDIR /usr/src/app
COPY --chown=node:node package*.json ./
COPY --chown=node:node --from=development /usr/src/app/node_modules ./node_modules
COPY --chown=node:node . .
ARG BACKEND_HOST
RUN npm run build --omit=dev
USER node

FROM nginxinc/nginx-unprivileged:1.25.3-alpine-slim@sha256:57ea79bc1217d8345ef15f7f65153460f5d81c4d28b2e2d63df142dc73fd89f0 AS production
COPY --from=build /usr/src/app/dist/labrute-angular /usr/share/nginx/html
