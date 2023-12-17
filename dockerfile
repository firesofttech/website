FROM nginx:latest

# Remove the default NGINX website
RUN rm -rf /usr/share/nginx/html/*

# Copy your HTML file and assets to the NGINX default web root
COPY . /usr/share/nginx/html

# Expose the port used by NGINX (default is 80)
EXPOSE 80

# NGINX is automatically started by the base image, so no need for CMD
