# ======= 生产阶段 =======
FROM --platform=$TARGETPLATFORM nginx:stable-alpine

LABEL org.opencontainers.image.title="Unlock Music"
LABEL org.opencontainers.image.description="Unlock encrypted music file in browser"
LABEL org.opencontainers.image.authors="MengYX"
LABEL org.opencontainers.image.source="https://git.unlock-music.dev/um/web"
LABEL org.opencontainers.image.licenses="MIT"
LABEL maintainer="MengYX"

# 直接复制上游 dist（已构建好的前端静态文件）
COPY ./dist /usr/share/nginx/html

# 暴露端口
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
