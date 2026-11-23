FROM nginx:alpine
COPY index.html favicon.ico /usr/share/nginx/html/
EXPOSE 80
