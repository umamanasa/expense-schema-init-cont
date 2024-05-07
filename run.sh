#!/bin/bash

git clone https://github.com/umamanasa/$COMPONENT
cd $COMPONENT/schema

get_parameter() {
  aws ssm get-parameter  --name $1 --with-decryption | jq .Parameter.Value | sed -e 's/"//g'
}

if [ "$DB_TYPE" == "mysql" ]; then

  mysql -h$(get_parameter rds.${ENV}.endpoint) -u$(get_parameter rds.${ENV}.master_username) -p$(get_parameter rds.${ENV}.master_password) <$COMPONENT.sql
fi
