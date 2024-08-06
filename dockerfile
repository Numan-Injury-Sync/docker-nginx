# # Use Ubuntu as the base image
# FROM ubuntu:latest

# # Install Nginx
# RUN apt-get update \
#     && apt-get install -y nginx \
#     && apt-get clean \
#     && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# #RUN rm /etc/nginx/conf.d/*
# # Copy custom Nginx configuration file from host to container
# COPY nginx.conf /etc/nginx/nginx.conf

# COPY dist /usr/share/nginx/html

# # Environment variables
# ENV BACKEND_URL=${BACKEND_URL}

# # Expose ports
# EXPOSE 80
# EXPOSE 443

# # Start Nginx when the container launches
# CMD ["nginx", "-g", "daemon off;"]

FROM ubuntu:latest

RUN apt-get update \
    && apt-get install -y nginx gettext \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

COPY nginx.conf /etc/nginx/nginx.conf.template
# COPY start.sh /start.sh

# # COPY dist /usr/share/nginx/html

# RUN chmod +x /start.sh

# EXPOSE 80
# EXPOSE 443

# ENTRYPOINT ["/start.sh"]

# #Run environment variable substitution and start Nginx
# CMD envsubst '$BACKEND_URL' < /etc/nginx/nginx.conf.template > /etc/nginx/nginx.conf \
#     && nginx -g 'daemon off;'


COPY start.sh /start.sh

RUN chmod +x /start.sh

EXPOSE 80
EXPOSE 443

ENTRYPOINT ["/start.sh"]


