#!/bin/bash

x=$(echo "${rds_endpt}" | cut -d':' -f1)
sudo mysql -u "${rds_user}" -p"${rds_pwd}" -P 3306 -h "$x" -e "CREATE DATABASE drupal1; CREATE USER 'drupal'@'%' IDENTIFIED BY 'drupal_password'; GRANT ALL PRIVILEGES ON drupal1.* TO 'drupal'@'%'; FLUSH PRIVILEGES;"
                                                           
