<?php
return [
    'Accounts' => [
        [
            'accountName' => 'xxxx',
            'AccessKeyId' => '***',
            'AccessKeySecret' => '***',
            'regionId' => 'cn-hongkong',
            'instanceId' => 'i-***',
            'maxTraffic' => 180
        ]
    ],
    'Notification' => [
        'title' => 'CDT流量统计',
        'enableEmail' => false,
        'email' => 'your-notification-email@example.com',
        'host' => 'smtp.example.com',
        'username' => 'your-email-username',
        'password' => 'your-email-password',
        'port' => 587,
        'secure' => 'tls',
        'enableBark' => false,
        'barkUrl' => 'https://api.day.app/XXXXXXXX',
        'enableWebhook' => true,
        'webhookId' => '1',
        'webhookUrl' => 'https://mr.xxxx/api/plugins/notifyapi/send_notify?&access_key=xxxxxxx',
        'enableQywx' => false,
        'touser' => '@all',
        'corpid' => 'xxx',
        'corpsecret' => 'xxx',
        'agentid' => '1000002',
        'picUrl' => 'https://raw.githubusercontent.com/Alano-i/aliyun-cdt-check/refs/heads/main/aliyuncdt.png',
        'baseApiUrl' => 'https://qyapi.weixin.qq.com',
        'enableTG' => false,
        'tgBotToken' => 'your-telegram-bot-token',
        'tgChatId' => 'your-telegram-chat-id'
    ],
    'Cron' => [
        'aliyun_cdt_check_schedule' => 20, // 每 20 分钟执行一次
        'dailyjob_schedule' => '8:01',     // 每天 8:01 执行
    ]
];
