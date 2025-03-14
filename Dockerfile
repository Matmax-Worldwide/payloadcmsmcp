# Generated by https://smithery.ai. See: https://smithery.ai/docs/config#dockerfile
FROM node:lts-alpine

# Create app directory
WORKDIR /app

# Install dependencies
COPY package*.json ./

# Install packages without running scripts
RUN npm install

# Copy source files
COPY . .

# Build the TypeScript project
RUN npm run build

# Expose HTTP port
EXPOSE 8080

# Start the combined server (web + MCP)
CMD ["node", "server.js"]
