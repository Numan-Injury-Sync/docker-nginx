#!/bin/bash

# Substitute environment variables in the Nginx config template
envsubst '$BACKEND_URL $DOMAIN' < /etc/nginx/nginx.conf.template > /etc/nginx/nginx.conf

nginx -g 'daemon off;'
# Start Nginx
#nginx

# # Obtain the SSL certificate (for the first time)
# if [ ! -f "/etc/letsencrypt/live/${DOMAIN}/fullchain.pem" ]; then
#   certbot --nginx --non-interactive --agree-tos --email numanuet311@gmail.com -d ${DOMAIN}
# fi

# # Run Certbot to renew certificates periodically
# while :; do certbot renew; sleep 12h; done &

# Keep the container running
tail -f /dev/null
