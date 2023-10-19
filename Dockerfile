FROM node:18.18.2-alpine AS build
WORKDIR /usr/src/app
COPY package*.json ./
RUN npm ci
COPY . .
RUN npm run build --omit=dev

FROM nginxinc/nginx-unprivileged:1.25.2-alpine-slim AS production
COPY --from=build /usr/src/app/dist/labrute-angular /usr/share/nginx/html
