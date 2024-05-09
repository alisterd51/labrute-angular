FROM node:20.13.1-alpine@sha256:291e84d956f1aff38454bbd3da38941461ad569a185c20aa289f71f37ea08e23 AS development
WORKDIR /usr/src/app
COPY --chown=node:node package*.json ./
RUN npm ci
COPY --chown=node:node . .
USER node

FROM node:20.13.1-alpine@sha256:291e84d956f1aff38454bbd3da38941461ad569a185c20aa289f71f37ea08e23 AS build
WORKDIR /usr/src/app
COPY --chown=node:node package*.json ./
COPY --chown=node:node --from=development /usr/src/app/node_modules ./node_modules
COPY --chown=node:node . .
ARG BACKEND_HOST
RUN npm run build --omit=dev
USER node

FROM nginxinc/nginx-unprivileged:1.26.0-alpine-slim@sha256:7f62297d72551a9d3baac731435a5a4c36c73bdc711a9deecd0c7aff43eb7849 AS production
COPY --from=build /usr/src/app/dist/labrute-angular /usr/share/nginx/html
