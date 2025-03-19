#!/bin/bash

# Imprimir variables de entorno para depuración
echo "Variables de entorno:"
echo "DB_HOST: ${DB_HOST}"
echo "DB_PORT: ${DB_PORT}"
echo "DB_USER: ${DB_USER}"
echo "DB_NAME: ${DB_NAME}"
echo "DB_PASSWORD: ${DB_PASSWORD:0:5}..." # Solo mostramos los primeros 5 caracteres por seguridad

# Crear el archivo de configuración dinámicamente
cat > /etc/odoo/odoo.conf << EOF
[options]
admin_passwd = admin
addons_path = /usr/lib/python3/dist-packages/odoo/addons
log_level = debug
logfile = /var/log/odoo/odoo.log
log_handler = [':DEBUG']

[db]
host = ${DB_HOST}
port = ${DB_PORT}
user = ${DB_USER}
password = ${DB_PASSWORD}
db_name = ${DB_NAME}
sslmode = require
EOF

# Asegurar permisos correctos
chown odoo:odoo /etc/odoo/odoo.conf
chmod 644 /etc/odoo/odoo.conf

# Mostrar el contenido del archivo de configuración (sin la contraseña)
echo "Contenido del archivo de configuración (sin contraseña):"
sed 's/password = .*/password = ****/' /etc/odoo/odoo.conf

# Cambiar al usuario odoo
exec su - odoo -c "odoo -c /etc/odoo/odoo.conf --http-interface=0.0.0.0 --http-port=8069 --no-cron --log-level=debug" 