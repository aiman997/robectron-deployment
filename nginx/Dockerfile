FROM nginx:latest

# Copy the entrypoint script and make it executable
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

# Install ping and curl
RUN apt-get update && apt-get install -y iputils-ping curl

# Copy the Nginx configuration template
# COPY conf.d/robectron.template.conf /etc/nginx/conf.d/robectron.template.conf
COPY conf.d/robectron.conf /etc/nginx/conf.d/robectron.conf
# Set the entrypoint to the script
ENTRYPOINT ["/entrypoint.sh"]
