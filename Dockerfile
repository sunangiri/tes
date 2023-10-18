# Use Node.js version 14 as the base image
FROM node:14

# Set the working directory for the container
WORKDIR /app

# Copy all source code to the working directory in the container
COPY . .

# Ensure the application runs in production mode and uses "item-db" as the database host
ENV NODE_ENV=production DB_HOST=item-db

# Install production dependencies and build the application
RUN npm install --production --unsafe-perm && npm run build

# Expose port 8080 used by the application
EXPOSE 8080

# When the container is launched, execute the command "npm start"
CMD ["npm", "start"]