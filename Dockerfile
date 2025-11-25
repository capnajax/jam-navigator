FROM nginx:alpine

# Copy nginx config will be provided via ConfigMap at runtime
# Copy htdocs (static content)
COPY htdocs /usr/share/nginx/html

# Copy rest-proxy.js and config for ConfigMap creation
COPY rest-proxy.js /app/rest-proxy.js
COPY config /app/config

# Create directories for runtime mounts
RUN mkdir -p /var/cache/nginx /var/run && \
    chown -R nginx:nginx /var/cache/nginx /var/run /usr/share/nginx/html

# Expose port (will be overridden by deployment)
EXPOSE 8088

# nginx will be started with config from ConfigMap mount
CMD ["nginx", "-g", "daemon off;"]
