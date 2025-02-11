FROM php:5.6-alpine

WORKDIR /app

# 复制项目文件
COPY ./app /app

# 安装时区和 cron 工具
RUN apk add --no-cache tzdata && \
    cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime && \
    echo "Asia/Shanghai" > /etc/timezone && \
    apk del tzdata

# 复制启动脚本并设置权限
COPY start.sh /start.sh
RUN chmod +x /start.sh

# 设置启动命令
CMD ["/start.sh"]
