FROM nginx:alpine

# Remove default Nginx page
RUN rm -rf /usr/share/nginx/html/*

# Copy static files
COPY . /usr/share/nginx/html

# Copy template and entrypoint
COPY nginx.template /etc/nginx/templates/default.conf.template

# Expose Cloud Run port
EXPOSE 8080

# Set default port
ENV PORT=8080

# Use Nginx's built-in envsubst support
CMD ["sh", "-c", "envsubst < /etc/nginx/templates/default.conf.template > /etc/nginx/conf.d/default.conf && exec nginx -g 'daemon off;'"]

