# Use official Nginx image
FROM nginx:alpine

# Remove default Nginx page
RUN rm -rf /usr/share/nginx/html/*

# Copy your static files
COPY . /usr/share/nginx/html

# Expose port
EXPOSE 8080

# Use $PORT for Cloud Run compatibility
ENV PORT=8080
CMD ["nginx", "-g", "daemon off;"]
