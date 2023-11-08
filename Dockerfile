 FROM node:latest as build
 WORKDIR /app
 COPY ./ ./
 RUN npm install --force
 RUN npm run build

FROM nginx:1.23.2

COPY build /usr/share/nginx/html
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
