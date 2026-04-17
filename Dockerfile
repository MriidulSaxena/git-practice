# Stage 1: Build the React app
FROM node:16.17.0-alpine AS build

WORKDIR /app

# Copy dependency files
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy remaining code
COPY . .

# Build app
RUN npm run build

# Stage 2: Production image
FROM nginx:alpine

# Copy build output
COPY . /usr/share/nginx/html

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]