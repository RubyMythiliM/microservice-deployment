# Use Node.js base image
FROM node:14

# Set working directory
WORKDIR /app

# Copy package.json and install dependencies
COPY package.json .
RUN npm install

# Copy microservice source code
COPY . .

# Expose port
EXPOSE 3000

# Start the microservice
CMD ["node", "server.js"]
