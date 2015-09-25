#!/bin/bash

/usr/bin/mysqld_safe &
sleep 5s

mysqladmin -u root password HuMhUb
mysqladmin -u root -pHuMhUb reload
mysqladmin -u root -pHuMhUb create humhub

echo "GRANT ALL ON humhub.* TO humhub@localhost IDENTIFIED BY 'HuMhUb'; flush privileges; " | mysql -u root -pHuMhUb

killall mysqld
sleep 5s
