# Build Phase
FROM node:alpine as builder
WORKDIR '/app'
COPY package.json .
RUN npm install --verbose
COPY . .
RUN npm run build

# Serve Phase
FROM nginx
COPY --from=builder /app/build /usr/share/nginx/html
