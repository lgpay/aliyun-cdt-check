FROM php:5.6-alpine

WORKDIR /app

COPY ./app /app

# 安装时区和 cron 工具
RUN apk add --no-cache tzdata && \
    cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime && \
    echo "Asia/Shanghai" > /etc/timezone && \
    apk del tzdata

# 读取配置文件中的时间配置并生成 crontab 文件
RUN echo "<?php \
    \$config = include '/app/config.php'; \
    file_put_contents('/etc/crontabs/root', \
        \$config['Cron']['aliyun_cdt_check_schedule'] . ' php /app/aliyun-cdt-check.php > /dev/null 2>&1\n' . \
        \$config['Cron']['dailyjob_schedule'] . ' php /app/dailyjob.php > /dev/null 2>&1\n' \
    ); \
?>" | php

CMD ["crond", "-f"]
