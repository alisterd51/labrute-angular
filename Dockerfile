FROM node:20.10.0-alpine@sha256:32427bc0620132b2d9e79e405a1b27944d992501a20417a7f407427cc4c2b672 AS development
WORKDIR /usr/src/app
COPY --chown=node:node package*.json ./
RUN npm ci
COPY --chown=node:node . .
USER node

FROM node:20.10.0-alpine@sha256:32427bc0620132b2d9e79e405a1b27944d992501a20417a7f407427cc4c2b672 AS build
WORKDIR /usr/src/app
COPY --chown=node:node package*.json ./
COPY --chown=node:node --from=development /usr/src/app/node_modules ./node_modules
COPY --chown=node:node . .
ARG BACKEND_HOST
RUN npm run build --omit=dev
USER node

FROM nginxinc/nginx-unprivileged:1.25.3-alpine-slim@sha256:9968c39020dc958d57e49c4465e5026adf1d5db810b6ad659c3046531fe42638 AS production
COPY --from=build /usr/src/app/dist/labrute-angular /usr/share/nginx/html
