#!/bin/sh

# Export environment variables for envsubst
export HOST=${HOST}
export REMOTE_ADDR=${REMOTE_ADDR}
export PROXY_ADD_X_FORWARDED_FOR=${PROXY_ADD_X_FORWARDED_FOR}
export SCHEME=${SCHEME}
export SERVER_PORT=${SERVER_PORT}

# Print environment variables for debugging
echo "HOST: $HOST"
echo "REMOTE_ADDR: $REMOTE_ADDR"
echo "PROXY_ADD_X_FORWARDED_FOR: $PROXY_ADD_X_FORWARDED_FOR"
echo "SCHEME: $SCHEME"
echo "SERVER_PORT: $SERVER_PORT"

# Substitute environment variables in the template file using different delimiters to avoid conflicts
envsubst '\$HOST \$REMOTE_ADDR \$PROXY_ADD_X_FORWARDED_FOR \$SCHEME \$SERVER_PORT' < /etc/nginx/conf.d/robectron.template.conf > /etc/nginx/conf.d/robectron.conf

# Print the generated configuration for debugging
echo "Generated Nginx Configuration:"
cat /etc/nginx/conf.d/robectron.conf

# Start Nginx
nginx -g 'daemon off;'
