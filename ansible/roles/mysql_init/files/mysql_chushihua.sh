#!/bin/bash
##这是批量备份华为交换机的脚本
backup_time=`date +%Y%m%d`
#ip=`nmcli c s ens160|grep IP4.ADDRESS|awk -F '/' '{print$1}'|awk '{print$2}'`
ip=192.168.174.157
user=root

echo "开始$ip"

/usr/bin/expect << EOF

set time 20
spawn ssh $user@$ip
expect "*\#"
send "mysql\r"
expect "*\>"
send "create database zabbix character set utf8 collate utf8_bin;\r"
expect "*\>"
send "grant all on zabbix.* to zabbix@'localhost' identified by '123456';\r"
expect "*\>"
send "flush privileges;\r"
expect "*\>"
send "quit\r"

#interact
expect eof
EOF
