FROM node:20.10.0-alpine@sha256:9e38d3d4117da74a643f67041c83914480b335c3bd44d37ccf5b5ad86cd715d1 AS development
WORKDIR /usr/src/app
COPY --chown=node:node package*.json ./
RUN npm ci
COPY --chown=node:node . .
USER node

FROM node:20.10.0-alpine@sha256:9e38d3d4117da74a643f67041c83914480b335c3bd44d37ccf5b5ad86cd715d1 AS build
WORKDIR /usr/src/app
COPY --chown=node:node package*.json ./
COPY --chown=node:node --from=development /usr/src/app/node_modules ./node_modules
COPY --chown=node:node . .
ARG BACKEND_HOST
RUN npm run build --omit=dev
USER node

FROM nginxinc/nginx-unprivileged:1.25.3-alpine-slim@sha256:d2c2dcde43914e07e231a21b5767abcdc99ade5c84f637dd2dfd7217c57af5e1 AS production
COPY --from=build /usr/src/app/dist/labrute-angular /usr/share/nginx/html
