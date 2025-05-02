# Use official Node.js LTS image as base
FROM node:20-slim

# Set working directory
WORKDIR /app

# Copy package.json and package-lock.json
COPY package*.json ./

# Install dependencies
RUN npm ci

# Copy the rest of the application code
COPY . .

# Build the app (if needed)
RUN npm run build --if-present


# Expose the port expected by Cloud Run
EXPOSE 8080

# Start the app
CMD ["npm", "start"]
