FROM nginx:alpine

# Remove default nginx static content
RUN rm -rf /usr/share/nginx/html/*

# Copy site files into nginx html directory
COPY . /usr/share/nginx/html

# Add a reverse proxy config so the browser can reach the queue API
COPY nginx/default.conf /etc/nginx/conf.d/default.conf

# Expose default HTTP port
EXPOSE 80

# Start nginx in the foreground
CMD ["nginx", "-g", "daemon off;"]
