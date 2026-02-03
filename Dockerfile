FROM node:20-slim

WORKDIR /app

# Copy package files
COPY package*.json ./

# Install ALL dependencies
RUN npm ci

# Copy source
COPY . .

# Build CSS explicitly after copy (so source files exist)
RUN npm run build:css

# Copy start script
COPY start.sh /start.sh
RUN chmod +x /start.sh

# Expose port
EXPOSE 8080

# Start with wrapper script
CMD ["/start.sh"]
