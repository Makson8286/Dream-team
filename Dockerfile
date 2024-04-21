FROM nginx:latest

COPY site.html /usr/share/nginx/html

EXPOSE 80
