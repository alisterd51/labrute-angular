FROM node:20.10.0-alpine@sha256:b1789b7be6aa16afd642eaaaccdeeeb33bd8f08e69b3d27d931aa9665b731f01 AS development
WORKDIR /usr/src/app
COPY --chown=node:node package*.json ./
RUN npm ci
COPY --chown=node:node . .
USER node

FROM node:20.10.0-alpine@sha256:b1789b7be6aa16afd642eaaaccdeeeb33bd8f08e69b3d27d931aa9665b731f01 AS build
WORKDIR /usr/src/app
COPY --chown=node:node package*.json ./
COPY --chown=node:node --from=development /usr/src/app/node_modules ./node_modules
COPY --chown=node:node . .
ARG BACKEND_HOST
RUN npm run build --omit=dev
USER node

FROM nginxinc/nginx-unprivileged:1.25.3-alpine-slim@sha256:814b97900dbf3c724e1718789c2bfe4c7caa1c9eddc1caa7806dea0dfdad89c2 AS production
COPY --from=build /usr/src/app/dist/labrute-angular /usr/share/nginx/html
