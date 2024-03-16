FROM node:20.11.1-alpine@sha256:842159a809c86c28a799b235f95e6010aa64d967d98eee0db4db5979d33dd43e AS development
WORKDIR /usr/src/app
COPY --chown=node:node package*.json ./
RUN npm ci
COPY --chown=node:node . .
USER node

FROM node:20.11.1-alpine@sha256:842159a809c86c28a799b235f95e6010aa64d967d98eee0db4db5979d33dd43e AS build
WORKDIR /usr/src/app
COPY --chown=node:node package*.json ./
COPY --chown=node:node --from=development /usr/src/app/node_modules ./node_modules
COPY --chown=node:node . .
ARG BACKEND_HOST
RUN npm run build --omit=dev
USER node

FROM nginxinc/nginx-unprivileged:1.25.4-alpine-slim@sha256:e726b2a8bfc09e579e717573582632a917a1236a37d73dffb4bcffcf3bf7f112 AS production
COPY --from=build /usr/src/app/dist/labrute-angular /usr/share/nginx/html
