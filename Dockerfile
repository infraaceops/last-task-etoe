FROM node:18 AS builder

WORKDIR /app
COPY package.json ./
# COPY package-lock.json . 2>/dev/null || true

RUN npm install
COPY . .

RUN npm run build

FROM nginx:alpine
COPY build /usr/share/nginx/html
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
