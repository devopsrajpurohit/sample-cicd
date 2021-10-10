FROM nginx:latest
ARG ENV=$env
RUN  sed -i -e "s/env/${ENV}/g" index.html
COPY ./index.html /usr/share/nginx/html/index.html 