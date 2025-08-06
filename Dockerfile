# ======= 构建阶段 =======
FROM node:18-alpine AS build
WORKDIR /app
COPY . .
RUN npm ci && npm run build

# ======= 生产阶段 =======
FROM nginx:stable-alpine
LABEL maintainer="MengYX"
COPY --from=build /app/dist /usr/share/nginx/html
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
