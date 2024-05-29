FROM node:20.14.0-alpine@sha256:da1fb4e470cbe065c849c47c1187a592f7505c1a679f5b3f845ea88b30f763a6 AS development
WORKDIR /usr/src/app
COPY --chown=node:node package*.json ./
RUN npm ci
COPY --chown=node:node . .
USER node

FROM node:20.14.0-alpine@sha256:da1fb4e470cbe065c849c47c1187a592f7505c1a679f5b3f845ea88b30f763a6 AS build
WORKDIR /usr/src/app
COPY --chown=node:node package*.json ./
COPY --chown=node:node --from=development /usr/src/app/node_modules ./node_modules
COPY --chown=node:node . .
ARG BACKEND_HOST
RUN npm run build --omit=dev
USER node

FROM nginxinc/nginx-unprivileged:1.26.0-alpine-slim@sha256:9d742a6544a066f7a7f66e937a62e63974af477a58fa923dae96564c776e8180 AS production
COPY --from=build /usr/src/app/dist/labrute-angular /usr/share/nginx/html
