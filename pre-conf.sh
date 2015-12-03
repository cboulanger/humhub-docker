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

# Install cron jobs for user www-data
(crontab -u www-data -l ; echo "30 * * * * /var/www/humhub/protected/yii cron/hourly >/dev/null 2>&1") | crontab -u www-data -
(crontab -u www-data -l ; echo "00 18 * * * /var/www/humhub/protected/yii cron/daily >/dev/null 2>&1") | crontab -u www-data -
echo "Installed cron jobs ..." 

