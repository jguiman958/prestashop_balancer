#!/bin/bash

# Muestra todos los comandos que se han ejeutado.

set -ex

# Incluimos las variables del archivo .env.
source .env

# Creamos la base de datos.
mysql -u root <<< "DROP DATABASE IF EXISTS $PS_DB_NAME"
mysql -u root <<< "CREATE DATABASE $PS_DB_NAME"
mysql -u root <<< "DROP USER IF EXISTS $PS_DB_USER@$IP_CLIENTE_MYSQL"
mysql -u root <<< "CREATE USER $PS_DB_USER@$IP_CLIENTE_MYSQL IDENTIFIED BY '$PS_DB_PASSWORD'"
mysql -u root <<< "GRANT ALL PRIVILEGES ON $PS_DB_NAME.* TO $PS_DB_USER@$IP_CLIENTE_MYSQL"

# Reiniciamos mysql.
systemctl restart mysql




