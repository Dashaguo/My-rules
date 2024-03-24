#!/bin/bash

# 获取新的SSH端口号
read -p "请输入新的SSH端口号： " new_port

# 验证输入是否为数字
if ! [[ "$new_port" =~ ^[0-9]+$ ]]; then
    echo "错误：端口号必须是一个数字。"
    exit 1
fi

# 修改SSH配置文件
sed -i "s/^#Port .*/Port $new_port/" /etc/ssh/sshd_config

# 重启SSH服务
service sshd restart

echo "SSH端口号已修改为$new_port。"
