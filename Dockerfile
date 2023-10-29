FROM node:18.18.2-alpine@sha256:435dcad253bb5b7f347ebc69c8cc52de7c912eb7241098b920f2fc2d7843183d AS development
WORKDIR /usr/src/app
COPY --chown=node:node package*.json ./
RUN npm ci
COPY --chown=node:node . .
USER node

FROM node:18.18.2-alpine@sha256:435dcad253bb5b7f347ebc69c8cc52de7c912eb7241098b920f2fc2d7843183d AS build
WORKDIR /usr/src/app
COPY --chown=node:node package*.json ./
COPY --chown=node:node --from=development /usr/src/app/node_modules ./node_modules
COPY --chown=node:node . .
ARG BACKEND_HOST
RUN npm run build --omit=dev
USER node

FROM nginxinc/nginx-unprivileged:1.25.2-alpine-slim@sha256:dead1bc92b1d97d17924a96a779715370435a179056da2c58e4245f8425dcff3 AS production
COPY --from=build /usr/src/app/dist/labrute-angular /usr/share/nginx/html
