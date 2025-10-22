FROM nginx:alpine

# Remove default Nginx page
RUN rm -rf /usr/share/nginx/html/*

# Copy static files
COPY . /usr/share/nginx/html

# Copy custom Nginx config that uses $PORT
COPY nginx.conf /etc/nginx/conf.d/default.conf

# Expose Cloud Run port
EXPOSE 8080

# Set PORT env variable
ENV PORT=8080

CMD ["nginx", "-g", "daemon off;"]

