FROM node:20.13.1-alpine@sha256:a7b980c958bfe4d84ee9263badd95a40c8bb50ad5afdb87902c187fefaef0e24 AS development
WORKDIR /usr/src/app
COPY --chown=node:node package*.json ./
RUN npm ci
COPY --chown=node:node . .
USER node

FROM node:20.13.1-alpine@sha256:a7b980c958bfe4d84ee9263badd95a40c8bb50ad5afdb87902c187fefaef0e24 AS build
WORKDIR /usr/src/app
COPY --chown=node:node package*.json ./
COPY --chown=node:node --from=development /usr/src/app/node_modules ./node_modules
COPY --chown=node:node . .
ARG BACKEND_HOST
RUN npm run build --omit=dev
USER node

FROM nginxinc/nginx-unprivileged:1.26.0-alpine-slim@sha256:ca6c2c3bed6cba473d2bcc8e5583b562ee335d043b9c72dc0eab983f6dd3a49c AS production
COPY --from=build /usr/src/app/dist/labrute-angular /usr/share/nginx/html
