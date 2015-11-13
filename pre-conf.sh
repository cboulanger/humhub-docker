#!/bin/bash

# Initiatize mysql database
/usr/bin/mysqld_safe &
sleep 5s

mysqladmin -u root password HuMhUb
mysqladmin -u root -pHuMhUb reload
mysqladmin -u root -pHuMhUb create humhub

echo "GRANT ALL ON humhub.* TO humhub@localhost IDENTIFIED BY 'HuMhUb'; flush privileges; " | mysql -u root -pHuMhUb

killall mysqld
echo "Database initialized ..."
sleep 5s

# Install cron jobs
(crontab -l ; echo "*/5 * * * * su -c \"/var/www/humhub/protected/yii  cron/hourly\" www-data    >/dev/null 2>&1") | crontab -
(crontab -l ; echo "0 18 * * * su -c \"/var/www/humhub/protected/yii  cron/daily\" www-data >/dev/null 2>&1") | crontab -
echo "Installed cron jobs ..." 

