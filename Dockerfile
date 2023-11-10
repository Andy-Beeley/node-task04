ARG NODE_VERSION=latest

FROM node:${NODE_VERSION}

# Use production node environment by default.
ENV NODE_ENV production


WORKDIR /app

# Download dependencies as a separate step to take advantage of Docker's caching.
# Leverage a cache mount to /root/.npm to speed up subsequent builds.
# Leverage a bind mounts to package.json and package-lock.json to avoid having to copy them into
# into this layer.
RUN npm install node

# Copy the rest of the source files into the image.
COPY . .

# Expose the port that the application listens on.
EXPOSE 5000

# Run the application.
ENTRYPOINT [ "node", "node index.js"]