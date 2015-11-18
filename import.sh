#!/bin/bash

data_dir=/humhub-data
mysql_user=humhub
mysql_passwd=HuMhUb
humhub_path=/var/www/humhub

certificate_file=certificate.crt
certificate_key_file=certificate.key
certificate_chain_file=chain.crt
ssl_conf_file=/etc/apache2/sites-available/humhub-ssl.conf

# import sql data
if [ -f $data_dir/humhub.sql ]
then
  echo "Migrating SQL data..."
  /usr/bin/mysqld_safe &
  sleep 5s
  mysql -u $mysql_user -p$mysql_passwd humhub < $data_dir/humhub.sql
  killall mysqld
fi

# migrate file data
if [ -f $data_dir/uploads.tgz ]
then
  echo "Migrating file data..."
  tar -xzf $data_dir/uploads.tgz -C $humhub_path/
fi

if [ -f $data_dir/protected.tgz ]
then
  echo "Migrating protected data..."
  tar -xzf $data_dir/protected.tgz -C $humhub_path/
fi

if [ -f $data_dir/themes.tgz ]
then
  echo "Migrating themes..."
  tar -xzf $data_dir/themes.tgz -C $humhub_path/
fi


# Certificate and certificate key
if [[ -f $data_dir/$certificate_file && -f $data_dir/$certificate_key_file ]]
then
  echo "Installing SSL certificate and key file..."
  sed -i "s|SSLCertificateFile.*$|SSLCertificateFile $data_dir/$certificate_file|" $ssl_conf_file
  sed -i "s|SSLCertificateKeyFile.*$|SSLCertificateKeyFile $data_dir/$certificate_key_file|" $ssl_conf_file
  chmod 0600 $data_dir/$certificate_key_file
fi

# Certificate chain, if exists
if [[ -f $data_dir/$certificate_chain_file ]]
then
  echo "Installing SSL certificate chain file..."
  sed -i "s|#SSLCertificateChainFile.*$|SSLCertificateChainFile $data_dir/$certificate_chain_file|" $ssl_conf_file
fi

echo "Done importing data ..."
