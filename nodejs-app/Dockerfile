# Use official Node.js image from Docker Hub
FROM node:16

# Set working directory
WORKDIR /usr/src/app

# Copy package.json and install dependencies
COPY package.json ./
RUN npm install

# Copy the rest of the application code
COPY ./src ./src

# Expose the port the app will run on
EXPOSE 3000

# Start the app
CMD ["npm", "start"]
