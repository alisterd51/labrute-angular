FROM node:20.11.0-alpine@sha256:a2bb114e1f87c3411ca78de61c2100685eba176481355e32899210c7f51f98d4 AS development
WORKDIR /usr/src/app
COPY --chown=node:node package*.json ./
RUN npm ci
COPY --chown=node:node . .
USER node

FROM node:20.11.0-alpine@sha256:a2bb114e1f87c3411ca78de61c2100685eba176481355e32899210c7f51f98d4 AS build
WORKDIR /usr/src/app
COPY --chown=node:node package*.json ./
COPY --chown=node:node --from=development /usr/src/app/node_modules ./node_modules
COPY --chown=node:node . .
ARG BACKEND_HOST
RUN npm run build --omit=dev
USER node

FROM nginxinc/nginx-unprivileged:1.25.3-alpine-slim@sha256:57a630cf4a357007959cac5b8a6d91ff381a55699b31545792fa9b88b26c5f5c AS production
COPY --from=build /usr/src/app/dist/labrute-angular /usr/share/nginx/html
