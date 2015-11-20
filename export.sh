#!/bin/bash

data_dir="/tmp/humhub-data"
mysql_user="humhub"
mysql_passwd="HuMhUb"
humhub_path=/var/www/humhub

mkdir -p $data_dir

# export sql data
echo "Exporting SQL data..."
mysqldump -u $mysql_user -p$mysql_passwd humhub > $data_dir/humhub.sql

# export file
echo "Exporting file data..."
cd $humhub_path
tar -czf $data_dir/uploads.tgz uploads
tar -czf $data_dir/protected.tgz protected/runtime protected/config protected/modules
tar -czf $data_dir/themes.tgz themes

echo "Done exporting data ..."
