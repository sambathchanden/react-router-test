#FROM node:16.18.1 as build
#WORKDIR /app
#COPY ./ ./
#RUN npm install --force
#RUN npm run build

FROM nginx:1.23.2
#COPY default.conf /etc/nginx/conf.d/default.conf
# COPY --from=build /app/build /usr/share/nginx/html
COPY build /usr/share/nginx/html
#RUN chown -R nginx:nginx /usr/share/nginx/html
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
