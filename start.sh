#!/bin/sh

# 读取配置文件中的时间配置
CONFIG_FILE="/app/config.php"
CRON_FILE="/etc/crontabs/root"

# 解析 PHP 配置文件并生成 crontab 文件
php -r "
    \$config = include '$CONFIG_FILE';
    \$aliyunCron = '*/' . \$config['Cron']['aliyun_cdt_check_schedule'] . ' * * * *';
    \$dailyCron = explode(':', \$config['Cron']['dailyjob_schedule']);
    \$dailyCron = \$dailyCron[1] . ' ' . \$dailyCron[0] . ' * * *';
    file_put_contents('$CRON_FILE', 
        \$aliyunCron . \" php /app/aliyun-cdt-check.php > /dev/null 2>&1\n\" . 
        \$dailyCron . \" php /app/dailyjob.php > /dev/null 2>&1\n\"
    );
"

# 启动 cron 服务
crond -f
